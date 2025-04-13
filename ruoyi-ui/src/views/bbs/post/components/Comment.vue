<template>
  <div class="comment-section">
    <div class="comment-header">
      <h3>评论 ({{ total }})</h3>
      <el-button type="primary" size="small" @click="showCommentForm">发表评论</el-button>
    </div>

    <!-- 评论表单 -->
    <el-form v-if="showForm" class="comment-form" :model="commentForm" :rules="rules" ref="commentForm">
      <el-form-item prop="content">
        <el-input
          type="textarea"
          v-model="commentForm.content"
          :rows="3"
          placeholder="写下你的评论..."
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="small" @click="submitComment">提交</el-button>
        <el-button size="small" @click="cancelComment">取消</el-button>
      </el-form-item>
    </el-form>

    <!-- 评论列表 -->
    <div class="comment-list">
      <div v-for="comment in commentList" :key="comment.commentId" class="comment-item">
        <div class="comment-content">
          <div class="comment-meta">
            <span class="comment-author">{{ comment.userName }}</span>
            <span class="comment-time">{{ parseTime(comment.createTime) }}</span>
          </div>
          <div class="comment-text">{{ comment.content }}</div>
          <div class="comment-actions">
            <span class="like-btn" @click="handleLike(comment)">
              <i :class="['el-icon-star-on', { 'liked': comment.liked }]"></i>
              {{ comment.likeCount }}
            </span>
            <span class="reply-btn" @click="handleReply(comment)">回复</span>
          </div>
        </div>
      </div>
    </div>

    <!-- 分页 -->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listComment, addComment } from "@/api/bbs/comment";
import { getLikeStatus, toggleLike } from "@/api/bbs/like";

export default {
  name: "Comment",
  props: {
    postId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      // 评论列表
      commentList: [],
      // 总条数
      total: 0,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      // 是否显示评论表单
      showForm: false,
      // 评论表单
      commentForm: {
        content: "",
        postId: this.postId
      },
      // 表单校验规则
      rules: {
        content: [
          { required: true, message: "请输入评论内容", trigger: "blur" },
          { min: 1, max: 500, message: "评论内容长度在1到500个字符之间", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询评论列表 */
    getList() {
      listComment({
        ...this.queryParams,
        postId: this.postId
      }).then(response => {
        this.commentList = response.rows;
        this.total = response.total;
        // 获取每个评论的点赞状态
        this.commentList.forEach(comment => {
          this.getCommentLikeStatus(comment);
        });
      });
    },
    /** 获取评论点赞状态 */
    getCommentLikeStatus(comment) {
      getLikeStatus({
        postId: this.postId,
        commentId: comment.commentId
      }).then(response => {
        this.$set(comment, 'liked', response.data);
      });
    },
    /** 显示评论表单 */
    showCommentForm() {
      this.showForm = true;
    },
    /** 取消评论 */
    cancelComment() {
      this.showForm = false;
      this.commentForm.content = "";
    },
    /** 提交评论 */
    submitComment() {
      this.$refs.commentForm.validate(valid => {
        if (valid) {
          addComment(this.commentForm).then(response => {
            this.$modal.msgSuccess("评论成功");
            this.showForm = false;
            this.commentForm.content = "";
            this.getList();
          });
        }
      });
    },
    /** 处理点赞 */
    handleLike(comment) {
      toggleLike({
        postId: this.postId,
        commentId: comment.commentId
      }).then(response => {
        comment.liked = !comment.liked;
        comment.likeCount += comment.liked ? 1 : -1;
      });
    },
    /** 处理回复 */
    handleReply(comment) {
      // TODO: 实现回复功能
      console.log("回复评论:", comment);
    }
  }
};
</script>

<style scoped>
.comment-section {
  margin-top: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 4px;
}

.comment-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.comment-header h3 {
  margin: 0;
  font-size: 18px;
  color: #303133;
}

.comment-form {
  margin-bottom: 20px;
}

.comment-item {
  padding: 15px 0;
  border-bottom: 1px solid #ebeef5;
}

.comment-meta {
  margin-bottom: 10px;
}

.comment-author {
  font-weight: bold;
  color: #303133;
  margin-right: 10px;
}

.comment-time {
  color: #909399;
  font-size: 12px;
}

.comment-text {
  color: #606266;
  line-height: 1.6;
  margin-bottom: 10px;
}

.comment-actions {
  display: flex;
  align-items: center;
}

.like-btn, .reply-btn {
  color: #909399;
  font-size: 12px;
  cursor: pointer;
  margin-right: 15px;
}

.like-btn i {
  margin-right: 5px;
}

.like-btn.liked i {
  color: #f56c6c;
}

.like-btn:hover, .reply-btn:hover {
  color: #409eff;
}
</style> 