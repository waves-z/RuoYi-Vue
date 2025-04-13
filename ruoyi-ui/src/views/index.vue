<template>
  <div class="app-container home">
    <!-- 搜索栏 -->
    <div class="search-bar">
      <el-input
        v-model="searchQuery"
        placeholder="搜索帖子..."
        class="search-input"
        @keyup.enter.native="handleSearch"
      >
        <el-button slot="append" icon="el-icon-search" @click="handleSearch"></el-button>
      </el-input>
    </div>

    <!-- 主要内容区 -->
    <el-row :gutter="20">
      <!-- 左侧帖子列表 -->
      <el-col :span="16">
        <!-- 最新帖子 -->
        <div class="latest-posts">
          <div class="section-header">
            <h2>最新帖子</h2>
            <el-button type="text" @click="handleViewAll('latest')">查看全部</el-button>
          </div>
          <el-row :gutter="20">
            <el-col :span="12" v-for="post in latestPosts" :key="post.id">
              <el-card shadow="hover" class="post-card">
                <div class="post-header">
                  <h3 class="post-title">{{ post.title }}</h3>
                  <div class="post-meta">
                    <span class="meta-item">
                      <i class="el-icon-user"></i>
                      {{ post.author }}
                    </span>
                    <span class="meta-item">
                      <i class="el-icon-time"></i>
                      {{ post.createTime }}
                    </span>
                  </div>
                </div>
                <div class="post-content">{{ post.summary }}</div>
                <div class="post-footer">
                  <div class="post-stats">
                    <span class="stat-item">
                      <i class="el-icon-view"></i>
                      {{ post.views }}
                    </span>
                    <span class="stat-item">
                      <i class="el-icon-star-on"></i>
                      {{ post.likes }}
                    </span>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <!-- 热门帖子 -->
        <div class="hot-posts">
          <div class="section-header">
            <h2>热门帖子</h2>
            <el-button type="text" @click="handleViewAll('hot')">查看全部</el-button>
          </div>
          <el-row :gutter="20">
            <el-col :span="12" v-for="post in hotPosts" :key="post.id">
              <el-card shadow="hover" class="post-card">
                <div class="post-header">
                  <h3 class="post-title">{{ post.title }}</h3>
                  <div class="post-meta">
                    <span class="meta-item">
                      <i class="el-icon-user"></i>
                      {{ post.author }}
                    </span>
                    <span class="meta-item">
                      <i class="el-icon-time"></i>
                      {{ post.createTime }}
                    </span>
                  </div>
                </div>
                <div class="post-content">{{ post.summary }}</div>
                <div class="post-footer">
                  <div class="post-stats">
                    <span class="stat-item">
                      <i class="el-icon-view"></i>
                      {{ post.views }}
                    </span>
                    <span class="stat-item">
                      <i class="el-icon-star-on"></i>
                      {{ post.likes }}
                    </span>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
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

        <!-- 发帖按钮 -->
        <el-button type="primary" class="create-post-btn" @click="createPost">
          <i class="el-icon-edit"></i> 发布新帖子
        </el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { listCategory } from "@/api/bbs/category";
import { listPost } from "@/api/bbs/post";

export default {
  name: "Index",
  data() {
    return {
      searchQuery: "",
      categoryList: [],
      latestPosts: [
        {
          id: 1,
          title: "示例帖子标题1",
          summary: "这是帖子的摘要内容，展示帖子的主要内容...",
          author: "张三",
          createTime: "2024-03-20 10:00",
          views: 100,
          likes: 20
        },
        {
          id: 2,
          title: "示例帖子标题2",
          summary: "这是帖子的摘要内容，展示帖子的主要内容...",
          author: "李四",
          createTime: "2024-03-20 09:30",
          views: 80,
          likes: 15
        }
      ],
      hotPosts: [
        {
          id: 3,
          title: "热门帖子标题1",
          summary: "这是热门帖子的摘要内容...",
          author: "王五",
          createTime: "2024-03-19 15:00",
          views: 500,
          likes: 100
        },
        {
          id: 4,
          title: "热门帖子标题2",
          summary: "这是热门帖子的摘要内容...",
          author: "赵六",
          createTime: "2024-03-19 14:00",
          views: 400,
          likes: 80
        }
      ],
      sections: []
    };
  },
  created() {
    this.getCategoryList();
    this.getLatestPosts();
    this.getHotPosts();
  },
  methods: {
    getCategoryList() {
      listCategory().then(response => {
        this.categoryList = response.rows;
      });
    },
    getLatestPosts() {
      listPost({ pageSize: 2, orderByColumn: 'create_time', isAsc: 'desc' }).then(response => {
        this.latestPosts = response.rows;
      });
    },
    getHotPosts() {
      listPost({ pageSize: 2, orderByColumn: 'like_count', isAsc: 'desc' }).then(response => {
        this.hotPosts = response.rows;
      });
    },
    handleCategoryClick(category) {
      this.$router.replace({
        path: '/bbs/post',
        query: { 
          categoryId: category.categoryId,
          pageNum: 1,
          pageSize: 10,
          orderByColumn: 'create_time',
          isAsc: 'desc'
        }
      });
    },
    handleViewAll(type) {
      this.$router.push({
        path: '/bbs/post',
        query: { 
          orderByColumn: type === 'latest' ? 'create_time' : 'like_count',
          isAsc: 'desc'
        }
      });
    },
    handleSearch() {
      // 处理搜索逻辑
      console.log("搜索:", this.searchQuery);
    },
    viewMore(type) {
      // 查看更多帖子
      console.log("查看更多:", type);
    },
    createPost() {
      // 创建新帖子
      console.log("创建新帖子");
    },
    parseTime(time) {
      // 实现时间解析逻辑
      return time;
    },
    getCategoryIcon(categoryName) {
      const iconMap = {
        '最新帖子': 'el-icon-document',
        '交友互动': 'el-icon-user-solid',
        '风景摄影': 'el-icon-picture-outline',
        '通知公告': 'el-icon-bell'
      };
      return iconMap[categoryName] || 'el-icon-folder';
    }
  }
};
</script>

<style scoped>
.home {
  padding: 20px;
}

.search-bar {
  margin-bottom: 20px;
}

.search-input {
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  display: block;
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

.post-card {
  margin-bottom: 20px;
  height: 100%;
}

.post-header {
  margin-bottom: 15px;
}

.post-title {
  margin: 0 0 10px 0;
  font-size: 18px;
  color: #303133;
}

.post-meta {
  display: flex;
  flex-wrap: wrap;
  color: #909399;
  font-size: 14px;
}

.meta-item {
  margin-right: 15px;
  display: flex;
  align-items: center;
}

.meta-item i {
  margin-right: 5px;
}

.post-content {
  color: #606266;
  font-size: 14px;
  line-height: 1.6;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
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
</style>

