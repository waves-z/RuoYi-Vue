<template>
  <div class="app-container home">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- 主要内容区 -->
    <el-row :gutter="20">
      <!-- 左侧帖子列表 -->
      <el-col :span="16">
        <!-- 最新帖子 -->
        <div class="latest-posts">
          <div class="section-header">
            <h2>最新帖子</h2>
            <el-button type="text" @click="viewAllPosts">查看全部</el-button>
          </div>
          
          <div v-loading="loading" class="post-list">
            <template v-if="latestPosts && latestPosts.length > 0">
              <div v-for="post in latestPosts" 
                   :key="post.postId" 
                   class="post-item">
                <div class="post-card">
                  <div class="post-info">
                    <div class="post-user">
                      <i class="el-icon-user"></i>
                      {{ post.authorName || post.createBy || '未知作者' }}
                    </div>
                    <div class="post-category">
                      <i class="el-icon-folder"></i>
                      {{ post.categoryName }}
                    </div>
                    <div class="post-time">
                      <i class="el-icon-time"></i>
                      {{ parseTime(post.createTime) }}
                    </div>
                  </div>
                  <div class="post-main" @click="handlePostClick(post)">
                    <div class="post-title">{{ post.postTitle || '无标题' }}</div>
                    <div class="post-content">
    {{ stripHtml(post.postContent).slice(0, 100) }}{{ post.postContent.length > 100 ? '...' : '' }}
</div>
                  </div>
                  <div class="post-footer">
                    <div class="post-stats">
                      <span class="stat-item">
                        <i class="el-icon-chat-dot-round"></i>
                        {{ post.commentCount || 0 }}
                      </span>
                      <span class="stat-item">
                        <i class="fas fa-heart"
                           :style="{ color: post.isLiked ? '#ff4949' : '#909399' }">
                        </i>
                        {{ post.likeCount || 0 }}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            
            <el-empty v-else description="暂无帖子"></el-empty>
          </div>
        </div>
      </el-col>

      <!-- 右侧推荐板块 -->
      <el-col :span="8">
        <div class="recommend-section">
          <h2 class="section-title">推荐板块</h2>
          <div class="category-grid">
            <div v-for="category in categoryList" 
                 :key="category.categoryId" 
                 class="category-item" 
                 @click="handleCategoryClick(category)">
              <i :class="getCategoryIcon(category.categoryName)"></i>
              <span class="category-name">{{ category.categoryName }}</span>
            </div>
          </div>
        </div>

      </el-col>
    </el-row>
  </div>
</template>

<script>
import { listCategory } from "@/api/bbs/category";
import { listPost } from "@/api/bbs/post";
import { parseTime } from "@/utils/ruoyi";

export default {
  name: "Index",
  data() {
    return {
      categoryList: [],
      latestPosts: [],
      loading: true,
      queryParams: {
        pageNum: 1,
        pageSize: 2,  // 只显示2条最新帖子
        orderByColumn: 'create_time',
        isAsc: 'desc'
      }
    };
  },
  created() {
    this.getCategoryList();
    this.getLatestPosts();
  },
  methods: {
    getCategoryList() {
      listCategory().then(response => {
        this.categoryList = response.rows;
      });
    },
    getLatestPosts() {
      this.loading = true;
      listPost(this.queryParams).then(response => {
        if (response.code === 200) {
          this.latestPosts = response.rows;
        } else {
          this.$message.error(response.msg || '获取帖子列表失败');
        }
      }).catch(error => {
        console.error('获取帖子失败：', error);
        this.$message.error('获取帖子列表失败');
      }).finally(() => {
        this.loading = false;
      });
    },
    handleCategoryClick(category) {
      this.$router.push({
        path: '/bbs/post',
        query: { 
          categoryId: category.categoryId
        }
      });
    },
    viewAllPosts() {
      this.$router.push({
        path: '/bbs/post',
        query: { 
          orderByColumn: 'create_time',
          isAsc: 'desc'
        }
      });
    },
    createPost() {
      this.$router.push({
        path: '/bbs/post/add',
        query: {
          categoryId: '100',
          status: '1'
        }
      });
    },
    parseTime(time) {
      return parseTime(time);
    },
    stripHtml(html) {
  if (!html) return '';
  return html.replace(/<[^>]+>/g, '').replace(/&nbsp;/g, ' ').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&amp;/g, '&');
},
    getCategoryIcon(categoryName) {
      const iconMap = {
        '最新帖子': 'el-icon-document',
        '交友互动': 'el-icon-user-solid',
        '风景摄影': 'el-icon-picture-outline',
        '通知公告': 'el-icon-bell'
      };
      return iconMap[categoryName] || 'el-icon-folder';
    },
    handlePostClick(post) {
      this.$router.push(`/bbs/post/detail/${post.postId}`);
    }
  }
};
</script>

<style scoped>
.home {
  padding: 20px;
}

.latest-posts {
    margin-bottom: 20px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
    margin-bottom: 20px;
  }

.post-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.post-item {
  margin-bottom: 16px;
}

.post-card {
  background: #fff;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.post-info {
  display: flex;
  gap: 16px;
  color: #909399;
  font-size: 13px;
  margin-bottom: 12px;
}

.post-user, .post-category, .post-time {
  display: flex;
  align-items: center;
}

.post-user i, .post-category i, .post-time i {
  margin-right: 4px;
}

.post-main {
  cursor: pointer;
  padding: 8px 0;
}

.post-title {
  font-size: 16px;
  font-weight: 600;
  color: #303133;
  margin-bottom: 8px;
}

.post-content {
  color: #606266;
  font-size: 14px;
  line-height: 1.6;
  margin-bottom: 12px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.post-footer {
  display: flex;
  justify-content: flex-end;
  padding-top: 12px;
  border-top: 1px solid #EBEEF5;
}

.post-stats {
  display: flex;
  gap: 16px;
}

.stat-item {
  display: flex;
  align-items: center;
  color: #909399;
  font-size: 14px;
}

.stat-item i {
  margin-right: 4px;
  font-size: 16px;
}

.el-icon-heart {
  color: #F56C6C;
}

.recommend-section {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.section-title {
  font-size: 18px;
  color: #303133;
  margin-bottom: 20px;
  font-weight: 600;
  border-bottom: 2px solid #409EFF;
  padding-bottom: 10px;
}

.category-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 15px;
}

.category-item {
  display: flex;
  align-items: center;
  padding: 15px;
  background: #f5f7fa;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.category-item:hover {
  background: #ecf5ff;
  transform: translateY(-2px);
}

.category-item i {
  font-size: 24px;
  color: #409EFF;
  margin-right: 10px;
}

.category-name {
  font-size: 16px;
  color: #606266;
  font-weight: 500;
}

.create-post-btn {
  width: 100%;
  margin-top: 20px;
  height: 40px;
  font-size: 16px;
}

.box-card {
  margin-bottom: 20px;
}

.link-type {
  color: #409EFF;
  text-decoration: none;
}

.link-type:hover {
  color: #66b1ff;
}
</style>