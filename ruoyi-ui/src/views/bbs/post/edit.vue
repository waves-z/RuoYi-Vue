<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="120px">
      <el-form-item label="标题" prop="postTitle">
        <el-input v-model="form.postTitle" placeholder="请输入帖子标题" />
      </el-form-item>
      <el-form-item label="内容" prop="postContent">
        <editor v-model="form.postContent" :min-height="192"/>
      </el-form-item>
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="form.categoryId" placeholder="请选择分类">
          <el-option
            v-for="item in categoryOptions"
            :key="item.categoryId"
            :label="item.categoryName"
            :value="item.categoryId"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">保存</el-button>
        <el-button @click="cancel">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getPost, updatePost } from "@/api/bbs/post";
import { listCategory } from "@/api/bbs/category";
import Editor from '@/components/Editor';

export default {
  name: "PostEdit",
  components: {
    Editor
  },
  data() {
    return {
      // 表单参数
      form: {
        postId: undefined,
        postTitle: undefined,
        postContent: undefined,
        categoryId: undefined,
        status: undefined
      },
      // 表单校验
      rules: {
        postTitle: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
        postContent: [
          { required: true, message: "内容不能为空", trigger: "blur" }
        ],
        categoryId: [
          { required: true, message: "请选择分类", trigger: "change" }
        ]
      },
      // 分类选项
      categoryOptions: []
    };
  },
  created() {
    const postId = this.$route.params.postId;
    this.getPost(postId);
    this.getCategories();
  },
  methods: {
    /** 获取帖子详细信息 */
    getPost(postId) {
      getPost(postId).then(response => {
        const data = response.data;
        this.form = {
          postId: data.postId,
          postTitle: data.postTitle,
          postContent: data.postContent,
          categoryId: data.categoryId,
          status: data.status
        };
      });
    },
    /** 获取分类列表 */
    getCategories() {
      listCategory().then(response => {
        this.categoryOptions = response.rows;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updatePost(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.cancel();
          });
        }
      });
    },
    /** 取消按钮 */
    cancel() {
      this.$router.push({ path: `/bbs/post/detail/${this.form.postId}` });
    }
  }
};
</script> 