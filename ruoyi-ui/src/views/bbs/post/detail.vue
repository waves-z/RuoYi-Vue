<template>
  <div class="app-container">
    <!-- 添加 Font Awesome 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <div class="post-detail">
      <div class="post-header">
        <h2>{{ post.postTitle }}</h2>
        <div class="post-meta">
          <span class="meta-item">
            <i class="el-icon-user"></i>
            {{ post.authorName }}
          </span>
          <span class="meta-item">
            <i class="el-icon-date"></i>
            {{ parseTime(post.createTime) }}
          </span>
          <span class="meta-item">
            <i class="fas" :class="{'fa-heart': isLiked, 'fa-heart': !isLiked}"
               :style="{ color: isLiked ? '#ff4949' : '#909399', cursor: 'pointer' }"
               @click="handleLike"></i>
            <span style="margin-left: 4px">{{ post.likeCount || 0 }}</span>
          </span>
          <span class="meta-item">
            <i class="el-icon-chat-dot-round"></i>
            {{ post.commentCount || 0 }}
          </span>
        </div>
      </div>
      <div class="post-content" v-html="post.postContent"></div>
      <div class="post-actions">
        <el-button v-if="isAdmin || post.authorId === userId" type="text" @click="handleEdit">编辑</el-button>
        <el-button v-if="isAdmin || post.authorId === userId" type="text" @click="handleDelete">删除</el-button>
        <el-button v-if="isAdmin && post.status === '1'" type="text" @click="handleApprove">通过</el-button>
        <el-button v-if="isAdmin && post.status === '1'" type="text" @click="handleReject">拒绝</el-button>
      </div>
    </div>

    <!-- 评论区域 -->
    <el-card class="box-card comment-section">
      <div slot="header" class="clearfix">
        <span>评论 ({{ comments.length }})</span>
      </div>
      <div class="comment-input">
        <el-input
          type="textarea"
          :rows="3"
          placeholder="写下你的评论..."
          v-model="commentContent">
        </el-input>
        <div class="comment-submit">
          <el-button type="primary" @click="submitComment">发表评论</el-button>
        </div>
      </div>
      <div class="comment-list">
        <div v-for="comment in comments" :key="comment.commentId" class="comment-item">
          <div class="comment-header">
            <span class="comment-author">{{ comment.userName }}</span>
            <span class="comment-time">{{ parseTime(comment.createTime) }}</span>
          </div>
          <div class="comment-content">{{ comment.content }}</div>
          <div class="comment-actions" v-if="isAdmin || comment.userId === userId">
            <template v-if="isAdmin && comment.status === '1'">
              <el-button type="text" size="mini" @click="handleApproveComment(comment)">通过</el-button>
              <el-button type="text" size="mini" @click="handleRejectComment(comment)">拒绝</el-button>
            </template>
            <el-button type="text" size="mini" @click="handleDeleteComment(comment)">删除</el-button>
          </div>
        </div>
        <div v-if="comments.length === 0" class="no-comment">
          暂无评论
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import { getPost, updatePostStatus, addComment, listComments, delPost } from "@/api/bbs/post";
import { getLikeStatus, toggleLike } from "@/api/bbs/like";
import { deleteComment, approveComment, rejectComment } from "@/api/bbs/comment";

export default {
  name: "PostDetail",
  data() {
    return {
      // 帖子信息
      post: {
        postTitle: '',
        authorName: '',
        createTime: null,
        categoryName: '',
        commentCount: 0,
        likeCount: 0,
        postContent: '',
        isLiked: false
      },
      // 当前用户ID
      userId: null,
      // 是否为管理员
      isAdmin: false,
      // 评论内容
      commentContent: '',
      // 评论列表
      comments: [],
      // 帖子ID
      postId: null,
      // 加载状态
      loading: false
    };
  },
  created() {
    this.postId = this.$route.params.postId;
    this.userId = this.$store.state.user.userId;
    this.isAdmin = this.$store.getters.roles.includes('admin');
    this.loadPostData();
  },
  methods: {
    /** 加载帖子数据 */
    async loadPostData() {
      try {
        this.loading = true;
        await this.getPost();
        await this.getComments();
      } catch (error) {
        console.error('加载数据失败：', error);
        this.$modal.msgError('加载数据失败，请刷新页面重试');
      } finally {
        this.loading = false;
      }
    },
    /** 获取帖子详情 */
    async getPost() {
      try {
        const response = await getPost(this.postId);
        if (response.code === 200 && response.data) {
          this.post = {
            ...this.post,
            ...response.data
          };
          // 获取点赞状态
          await this.getLikeStatus();
        } else {
          throw new Error(response.msg || '获取帖子详情失败');
        }
      } catch (error) {
        console.error('获取帖子详情失败：', error);
        throw error;
      }
    },
    /** 获取评论列表 */
    async getComments() {
      try {
        const response = await listComments(this.postId);
        if (response.code === 200) {
          this.comments = response.data || [];
        } else {
          throw new Error(response.msg || '获取评论列表失败');
        }
      } catch (error) {
        console.error('获取评论列表失败：', error);
        this.$modal.msgError("获取评论列表失败");
      }
    },
    /** 获取点赞状态 */
    async getLikeStatus() {
      try {
        const response = await getLikeStatus(this.postId);
        if (response.code === 200) {
          this.post.isLiked = response.data;
        } else {
          throw new Error(response.msg || '获取点赞状态失败');
        }
      } catch (error) {
        console.error('获取点赞状态失败：', error);
        this.post.isLiked = false;
      }
    },
    /** 处理点赞 */
    async handleLike() {
      if (this.loading) return;
      
      try {
        this.loading = true;
        const response = await toggleLike(this.postId, this.userId);
        
        if (response.code === 200) {
          // 立即更新UI状态
          this.post.isLiked = !this.post.isLiked;
          this.post.likeCount = this.post.isLiked 
            ? (this.post.likeCount || 0) + 1 
            : Math.max((this.post.likeCount || 0) - 1, 0);
          
          this.$modal.msgSuccess(this.post.isLiked ? '点赞成功' : '取消点赞成功');
          
          // 重新加载帖子数据以确保数据准确性
          await this.getPost();
        } else {
          throw new Error(response.msg || '操作失败');
        }
      } catch (error) {
        console.error('点赞操作失败：', error);
        this.$modal.msgError('操作失败：' + error.message);
      } finally {
        this.loading = false;
      }
    },
    /** 提交评论 */
    async submitComment() {
      if (!this.commentContent.trim()) {
        this.$modal.msgWarning("请输入评论内容");
        return;
      }
      try {
        const comment = {
          postId: this.postId,
          content: this.commentContent.trim()
        };
        const response = await addComment(comment);
        if (response.code === 200) {
          this.$modal.msgSuccess("评论成功");
          this.commentContent = '';
          // 重新加载评论列表
          await this.getComments();
          // 更新评论数
          this.post.commentCount = (this.post.commentCount || 0) + 1;
        } else {
          this.$modal.msgError(response.msg || "评论失败");
        }
      } catch (error) {
        console.error('评论失败：', error);
        this.$modal.msgError("评论失败：" + error.message);
      }
    },
    /** 审批通过 */
    handleApprove() {
      this.$modal.confirm('是否确认审批通过该帖子？').then(() => {
        updatePostStatus(this.post.postId, '0').then(response => {
          this.$modal.msgSuccess("审批成功");
          this.post.status = '0';
          this.getPost();
        });
      });
    },
    /** 审批不通过 */
    handleReject() {
      this.$modal.confirm('是否确认审批不通过该帖子？').then(() => {
        updatePostStatus(this.post.postId, '2').then(response => {
          this.$modal.msgSuccess("操作成功");
          this.post.status = '2';
          this.getPost();
        });
      });
    },
    /** 删除帖子 */
    handleDelete() {
      this.$modal.confirm('是否确认删除该帖子？').then(() => {
        delPost(this.post.postId).then(response => {
          this.$modal.msgSuccess("删除成功");
          this.goBack();
        });
      });
    },
    /** 返回列表页 */
    goBack() {
      this.$router.push("/bbs/post");
    },
    /** 编辑帖子 */
    handleEdit() {
      this.$router.push(`/bbs/post/edit/${this.post.postId}`);
      // 监听路由变化，当用户从编辑页面返回时刷新数据
      const unwatch = this.$watch(
        () => this.$route.path,
        (newPath) => {
          if (newPath === `/bbs/post/detail/${this.post.postId}`) {
            this.getPost();
            unwatch(); // 清除监听器
          }
        }
      );
    },
    /** 删除评论 */
    handleDeleteComment(comment) {
      this.$modal.confirm('是否确认删除该评论？').then(async () => {
        try {
          const response = await deleteComment(comment.commentId);
          if (response.code === 200) {
            this.$modal.msgSuccess("删除成功");
            await this.getComments();
            // 更新评论数
            this.post.commentCount = Math.max((this.post.commentCount || 0) - 1, 0);
          } else {
            this.$modal.msgError(response.msg || "删除失败");
          }
        } catch (error) {
          console.error('删除评论失败：', error);
          this.$modal.msgError("删除评论失败：" + error.message);
        }
      });
    },
    /** 通过评论 */
    handleApproveComment(comment) {
      this.$modal.confirm('是否确认通过该评论？').then(async () => {
        try {
          const response = await approveComment(comment.commentId);
          if (response.code === 200) {
            this.$modal.msgSuccess("操作成功");
            await this.getComments();
          } else {
            this.$modal.msgError(response.msg || "操作失败");
          }
        } catch (error) {
          console.error('通过评论失败：', error);
          this.$modal.msgError("操作失败：" + error.message);
        }
      });
    },
    /** 拒绝评论 */
    handleRejectComment(comment) {
      this.$modal.confirm('是否确认拒绝该评论？').then(async () => {
        try {
          const response = await rejectComment(comment.commentId);
          if (response.code === 200) {
            this.$modal.msgSuccess("操作成功");
            await this.getComments();
          } else {
            this.$modal.msgError(response.msg || "操作失败");
          }
        } catch (error) {
          console.error('拒绝评论失败：', error);
          this.$modal.msgError("操作失败：" + error.message);
        }
      });
    }
  }
};
</script>

<style scoped>
.post-meta {
  display: flex;
  align-items: center;
  gap: 16px;
  margin: 12px 0;
  color: #606266;
}

.meta-item {
  display: flex;
  align-items: center;
}

.meta-item i {
  margin-right: 4px;
  font-size: 16px;
}

.fa-heart {
  transition: all 0.3s ease;
}

.meta-item:hover .fa-heart {
  transform: scale(1.1);
}

.post-content {
  margin: 20px 0;
  line-height: 1.8;
}
.post-actions {
  margin-top: 20px;
  border-top: 1px solid #eee;
  padding-top: 10px;
}
.comment-section {
  margin-top: 20px;
}
.comment-input {
  margin-bottom: 20px;
}
.comment-submit {
  margin-top: 10px;
  text-align: right;
}
.comment-list {
  margin-top: 20px;
}
.comment-item {
  padding: 15px 0;
  border-bottom: 1px solid #eee;
}
.comment-header {
  margin-bottom: 10px;
}
.comment-author {
  font-weight: bold;
  margin-right: 10px;
}
.comment-time {
  color: #999;
  font-size: 12px;
}
.comment-content {
  line-height: 1.6;
  margin-bottom: 10px;
}
</style> 