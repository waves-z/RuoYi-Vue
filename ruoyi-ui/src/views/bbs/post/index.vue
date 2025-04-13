<template>
  <div class="app-container">
    <!-- 添加 Font Awesome 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择分类" clearable size="small">
          <el-option
            v-for="category in categoryOptions"
            :key="category.categoryId"
            :label="category.categoryName"
            :value="category.categoryId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="标题" prop="postTitle">
        <el-input
          v-model="queryParams.postTitle"
          placeholder="请输入标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者" prop="authorName">
        <el-input
          v-model="queryParams.authorName"
          placeholder="请输入作者"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="isAdmin" label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable size="small">
          <el-option
            v-for="dict in statusOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-checkbox v-model="onlyMine" @change="handleOnlyMineChange">只看我的</el-checkbox>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >发布帖子</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-radio-group v-model="queryParams.orderByColumn" size="mini" @change="handleOrderChange">
          <el-radio-button label="create_time">最新</el-radio-button>
          <el-radio-button label="like_count">最热</el-radio-button>
        </el-radio-group>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-row :gutter="20">
      <el-col :span="24" v-for="post in postList" :key="post.postId">
        <el-card shadow="hover" class="post-card">
          <div class="post-header">
            <h3 class="post-title">
              <el-link type="primary" @click="handleView(post)">{{ post.postTitle }}</el-link>
            </h3>
            <div class="post-meta">
              <span class="meta-item">
                <i class="el-icon-user"></i>
                {{ post.authorName }}
              </span>
              <span class="meta-item">
                <i class="el-icon-folder"></i>
                {{ post.categoryName }}
              </span>
              <span class="meta-item">
                <i class="el-icon-time"></i>
                {{ parseTime(post.createTime) }}
              </span>
            </div>
          </div>
          <div class="post-content">{{ post.postContent }}</div>
          <div class="post-footer">
            <div class="post-stats">
              <span class="stat-item" style="cursor: pointer;">
                <i class="fas" :class="{'fa-heart': post.isLiked, 'fa-heart': !post.isLiked}" 
                   :style="{ color: post.isLiked ? '#ff4949' : '#909399' }">
                </i>
                <span style="margin-left: 4px">{{ post.likeCount || '' }}</span>
              </span>
              <span class="stat-item">
                <i class="el-icon-chat-dot-round"></i>
                {{ post.commentCount || 0 }}
              </span>
            </div>
            <div class="post-actions">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(post)"
                v-if="isAdmin || (post.authorId === userId && post.status !== '2')"
              >修改</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(post)"
                v-if="isAdmin || (post.authorId === userId && post.status !== '2')"
              >删除</el-button>
              <el-button
                v-if="isAdmin && post.status === '1'"
                size="mini"
                type="text"
                icon="el-icon-check"
                @click="handleApprove(post)"
              >通过</el-button>
              <el-button
                v-if="isAdmin && post.status === '1'"
                size="mini"
                type="text"
                icon="el-icon-close"
                @click="handleReject(post)"
              >拒绝</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改帖子对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="780px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="分类" prop="categoryId">
          <el-select v-model="form.categoryId" placeholder="请选择分类">
            <el-option
              v-for="category in categoryOptions"
              :key="category.categoryId"
              :label="category.categoryName"
              :value="category.categoryId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="标题" prop="postTitle">
          <el-input v-model="form.postTitle" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容" prop="postContent">
          <editor v-model="form.postContent" :min-height="192"/>
        </el-form-item>
        <el-form-item label="状态" prop="status" v-if="isAdmin">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in statusOptions"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 查看帖子对话框 -->
    <el-dialog title="查看帖子" :visible.sync="viewOpen" width="780px" append-to-body>
      <div class="post-header">
        <h2 class="post-title">{{ viewForm.postTitle }}</h2>
        <div class="post-meta">
          <span class="meta-item">
            <i class="el-icon-user"></i>
            {{ viewForm.authorName }}
          </span>
          <span class="meta-item">
            <i class="el-icon-folder"></i>
            {{ viewForm.categoryName }}
          </span>
          <span class="meta-item">
            <i class="el-icon-time"></i>
            {{ parseTime(viewForm.createTime) }}
          </span>
          <span class="meta-item">
            <i class="el-icon-refresh"></i>
            {{ parseTime(viewForm.updateTime) }}
          </span>
        </div>
        <div class="post-stats">
          <span class="stat-item">
            <i class="fas" :class="{'fa-heart': viewForm.isLiked, 'fa-heart': !viewForm.isLiked}" 
               :style="{ color: viewForm.isLiked ? '#ff4949' : '#909399' }">
            </i>
            <span style="margin-left: 4px">{{ viewForm.likeCount > 0 ? viewForm.likeCount : '' }}</span>
          </span>
          <span class="stat-item">
            <i class="el-icon-chat-dot-round"></i>
            {{ viewForm.commentCount }}
          </span>
          <span class="stat-item">
            <el-tag
              :type="viewForm.status === '0' ? 'success' : viewForm.status === '1' ? 'warning' : 'danger'"
              size="small"
            >
              {{ viewForm.status === '0' ? '已发布' : viewForm.status === '1' ? '待审核' : '审核不通过' }}
            </el-tag>
          </span>
        </div>
      </div>
      <div class="post-content" v-html="viewForm.postContent"></div>
    </el-dialog>
  </div>
</template>

<script>
import { listPost, getPost, delPost, addPost, updatePost, updatePostStatus } from "@/api/bbs/post";
import { listCategory } from "@/api/bbs/category";
import Editor from '@/components/Editor';

export default {
  name: "Post",
  components: {
    Editor
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 帖子表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示查看弹出层
      viewOpen: false,
      // 分类选项
      categoryOptions: [],
      // 状态数据字典
      statusOptions: [
        { value: "1", label: "待审批" },
        { value: "0", label: "已通过" },
        { value: "2", label: "已拒绝" }
      ],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        postTitle: null,
        status: null,
        authorName: null,
        orderByColumn: 'create_time',
        isAsc: 'desc'
      },
      // 表单参数
      form: {
        postId: null,
        categoryId: null,
        postTitle: null,
        postContent: null,
        status: "1"  // 默认状态为待审核
      },
      // 查看表单参数
      viewForm: {},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "分类不能为空", trigger: "change" }
        ],
        postTitle: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
        postContent: [
          { required: true, message: "内容不能为空", trigger: "blur" }
        ]
      },
      // 当前用户ID
      userId: null,
      // 是否为管理员
      isAdmin: false,
      // 当前用户名
      userName: '',
      // 只看我的
      onlyMine: false
    };
  },
  created() {
    this.getCategoryOptions();
    
    // 获取当前用户信息和角色
    this.userId = this.$store.state.user.userId;
    this.userName = this.$store.state.user.nickName;
    this.isAdmin = this.$store.getters.roles.includes('admin');

    // 如果是管理员，默认查询待审批的帖子
    if (this.isAdmin) {
      this.queryParams.status = "1";
    }

    this.getList();
  },
  watch: {
    // 监听路由参数变化
    '$route': {
      handler(to, from) {
        // 只有在路由参数变化时才重新获取数据
        if (to.query.categoryId !== from?.query?.categoryId ||
            to.query.pageNum !== from?.query?.pageNum ||
            to.query.pageSize !== from?.query?.pageSize ||
            to.query.orderByColumn !== from?.query?.orderByColumn ||
            to.query.isAsc !== from?.query?.isAsc) {
          this.initQueryParams();
        }
      },
      immediate: true
    }
  },
  methods: {
    // 初始化查询参数
    initQueryParams() {
      const { categoryId, pageNum, pageSize, orderByColumn, isAsc } = this.$route.query;
      
      // 设置查询参数
      if (categoryId) {
        this.queryParams.categoryId = Number(categoryId);
      }
      if (pageNum) {
        this.queryParams.pageNum = Number(pageNum);
      }
      if (pageSize) {
        this.queryParams.pageSize = Number(pageSize);
      }
      if (orderByColumn) {
        this.queryParams.orderByColumn = orderByColumn;
      }
      if (isAsc) {
        this.queryParams.isAsc = isAsc;
      }

      // 获取帖子列表
      this.getList();
    },
    /** 查询帖子列表 */
    getList() {
      this.loading = true;
      listPost(this.queryParams).then(response => {
        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取分类选项 */
    getCategoryOptions() {
      listCategory().then(response => {
        this.categoryOptions = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        postId: null,
        categoryId: null,
        postTitle: null,
        postContent: null,
        status: "1"
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      // 更新路由参数，同时保证调用 getList
      const query = { ...this.queryParams };
      if (!query.authorName) {
        delete query.authorName;
      }
      this.$router.push({ query }).then(() => {
        this.getList();
      });
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.onlyMine = false;
      // 清除所有查询参数并更新路由
      this.$router.push({ query: {} }).then(() => {
        // 如果是管理员，重置后默认查看待审批的帖子
        if (this.isAdmin) {
          this.queryParams.status = "1";
        }
        this.getList();
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.postId);
      this.single = selection.length!==1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "发布帖子";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids;
      getPost(postId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改帖子";
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.$router.push(`/bbs/post/detail/${row.postId}`);
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.postId != null) {
            updatePost(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal.confirm('是否确认删除帖子编号为"' + postIds + '"的数据项？').then(function() {
        return delPost(postIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 排序方式改变 */
    handleOrderChange(value) {
      this.queryParams.orderByColumn = value;
      this.queryParams.isAsc = 'desc';
      this.handleQuery();
    },
    /** 审批通过 */
    handleApprove(row) {
      this.$modal.confirm('是否确认审批通过该帖子？').then(() => {
        updatePostStatus(row.postId, '0').then(response => {
          this.$modal.msgSuccess("审批成功");
          this.getList();
        });
      });
    },
    /** 审批不通过 */
    handleReject(row) {
      this.$modal.confirm('是否确认审批不通过该帖子？').then(() => {
        updatePostStatus(row.postId, '2').then(response => {
          this.$modal.msgSuccess("操作成功");
          this.getList();
        });
      });
    },
    /** 处理"只看我的"复选框变化 */
    handleOnlyMineChange(checked) {
      if (checked) {
        // 直接修改路由，添加 authorName 参数
        this.$router.replace({
          path: this.$route.path,
          query: { ...this.$route.query, authorName: this.userName }
        });
        this.queryParams.authorName = this.userName;
        this.getList();
      } else {
        // 直接修改路由，移除 authorName 参数
        const query = { ...this.$route.query };
        delete query.authorName;
        this.$router.replace({
          path: this.$route.path,
          query: query
        });
        this.queryParams.authorName = null;
        this.getList();
      }
    }
  }
};
</script>

<style scoped>
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
  margin-bottom: 15px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}

.post-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: 1px solid #ebeef5;
  padding-top: 15px;
}

.post-stats {
  display: flex;
  align-items: center;
  gap: 16px;
}

.stat-item {
  display: flex;
  align-items: center;
  color: #606266;
}

.stat-item i {
  margin-right: 4px;
  font-size: 16px;
}

.fa-heart {
  transition: color 0.3s ease;
}

.stat-item:hover .fa-heart {
  transform: scale(1.1);
}

.post-actions {
  display: flex;
  gap: 10px;
}
</style> 