<template>
  <div class="create-post-page">
    <div class="content-section">
      <h2>{{ isEdit ? '编辑帖子' : '发布新帖子' }}</h2>
      
      <el-form :model="postForm" :rules="rules" ref="postForm" label-width="80px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="postForm.title" placeholder="请输入帖子标题（5-50字）"></el-input>
        </el-form-item>
        
        <el-form-item label="分类">
          <el-select v-model="postForm.category" placeholder="请选择分类">
            <el-option v-for="item in categories" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>
        
        <el-form-item label="标签">
          <el-select
            v-model="postForm.tags"
            multiple
            filterable
            allow-create
            default-first-option
            placeholder="请选择标签（可自定义，最多3个）"
            :multiple-limit="3"
          >
            <el-option v-for="item in tagOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>
        
        <el-form-item label="内容" prop="content">
          <el-input
            type="textarea"
            v-model="postForm.content"
            :rows="8"
            placeholder="请输入帖子内容..."
          ></el-input>
        </el-form-item>
        
        <el-form-item label="图片">
          <el-upload
            :action="uploadFileUrl"
            list-type="picture-card"
            :headers="headers"
            :limit="6"
            :file-list="postForm.images"
            :on-success="handleUploadSuccess"
            :on-remove="handleImageRemove"
            :before-upload="beforeUpload"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <div class="upload-tip">支持 jpg, png, gif 格式，单张图片不超过 5MB，最多可上传 6 张</div>
        </el-form-item>
        
        <el-form-item>
          <el-button type="primary" @click="submitForm('postForm')">{{ isEdit ? '更新帖子' : '发布帖子' }}</el-button>
          <el-button @click="resetForm('postForm')">重置</el-button>
          <el-button @click="previewPost" v-if="postForm.title || postForm.content">预览</el-button>
        </el-form-item>
      </el-form>
    </div>
    
    <!-- 预览对话框 -->
    <el-dialog title="帖子预览" :visible.sync="previewVisible" width="70%">
      <div class="post-preview">
        <h2 class="preview-title">{{ postForm.title || '无标题' }}</h2>
        <div class="preview-meta">
          <span>当前用户</span>
          <span>{{ new Date().toLocaleDateString() }}</span>
          <span v-if="postForm.category">分类: {{ getCategoryLabel(postForm.category) }}</span>
        </div>
        
        <div class="preview-tags" v-if="postForm.tags && postForm.tags.length > 0">
          <el-tag v-for="tag in postForm.tags" :key="tag" size="small" style="margin-right: 5px;">{{ tag }}</el-tag>
        </div>
        
        <div class="preview-content">{{ postForm.content || '无内容' }}</div>
        
        <div class="preview-images" v-if="postForm.images && postForm.images.length > 0">
          <h4>图片预览:</h4>
          <div class="image-list">
            <div v-for="(image, index) in postForm.images" :key="index" class="preview-image-item">
              <img :src="image.url" alt="预览图片" />
            </div>
          </div>
        </div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="previewVisible = false">关闭</el-button>
        <el-button type="primary" @click="submitForm('postForm')">{{ isEdit ? '更新' : '直接发布' }}</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { getToken } from "@/utils/auth"
import { getPost, updatePost, addPost } from "@/api/forum/post"

export default {
  name: 'CreatePostPage',
  data() {
    return {
      isEdit: false,
      postId: null,
      postForm: {
        title: '',
        category: '',
        tags: [],
        content: '',
        images: []
      },
      rules: {
        title: [
          { required: true, message: '请输入帖子标题', trigger: 'blur' },
          { min: 5, max: 50, message: '标题长度在 5 到 50 个字符之间', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入帖子内容', trigger: 'blur' },
          { min: 10, message: '内容至少 10 个字符', trigger: 'blur' }
        ]
      },
      categories: [
        { value: 'tech', label: '技术分享' },
        { value: 'question', label: '问答' },
        { value: 'discussion', label: '讨论' },
        { value: 'news', label: '资讯' },
        { value: 'other', label: '其他' }
      ],
      tagOptions: [
        { value: '前端', label: '前端' },
        { value: '后端', label: '后端' },
        { value: 'Vue', label: 'Vue' },
        { value: 'React', label: 'React' },
        { value: '数据库', label: '数据库' },
        { value: '云服务', label: '云服务' },
        { value: '开源', label: '开源' },
        { value: 'AI', label: 'AI' }
      ],
      previewVisible: false,
      // 上传地址
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/file/upload",
      // 设置上传头
      headers: {
        Authorization: "Bearer " + getToken()
      }
    }
  },
  created() {
    // Check if we're in edit mode (postId in route)
    const id = this.$route.query.id;
    if (id) {
      this.isEdit = true;
      this.postId = parseInt(id);
      this.loadPostData(this.postId);
    }
  },
  methods: {
    ...mapActions(['CreateForumPost']),
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const formData = {
            title: this.postForm.title,
            category: this.postForm.category,
            tags: this.postForm.tags,
            content: this.postForm.content,
            images: this.postForm.images.map(img => img.url)
          };
          
          if (this.isEdit) {
            // Update existing post
            formData.id = this.postId;
            
            const postData = {
              id: this.postId,
              title: this.postForm.title,
              content: this.postForm.content,
              category: this.postForm.category,
              tags: this.postForm.tags.join(','),
              images: this.postForm.images.map(img => img.url).join(',')
            };
            
            updatePost(postData).then(response => {
              if (response.code === 200) {
                this.$message.success('帖子更新成功！');
                this.$router.push('/forum/my-posts');
              } else {
                this.$message.error('帖子更新失败：' + (response.msg || '未知错误'));
              }
            }).catch(error => {
              console.error('帖子更新异常', error);
              this.$message.error('帖子更新异常，请重试');
            });
          } else {
            // Create new post
            const postData = {
              title: this.postForm.title,
              content: this.postForm.content,
              category: this.postForm.category,
              tags: this.postForm.tags,
              images: this.postForm.images.map(img => img.url)
            };
            
            addPost(postData).then(response => {
              if (response.code === 200) {
                this.$message.success('帖子发布成功！');
                this.$router.push('/forum/home');
              } else {
                this.$message.error('帖子发布失败：' + (response.msg || '未知错误'));
              }
            }).catch(error => {
              console.error('帖子发布异常', error);
              this.$message.error('帖子发布异常，请重试');
            });
          }
        } else {
          this.$message.error('表单内容有误，请检查');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
      this.postForm.images = []
    },
    // 上传前的校验
    beforeUpload(file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isGIF = file.type === 'image/gif'
      const isLt5M = file.size / 1024 / 1024 < 5

      if (!isJPG && !isPNG && !isGIF) {
        this.$message.error('上传图片只能是 JPG/PNG/GIF 格式!')
        return false
      }
      if (!isLt5M) {
        this.$message.error('上传图片大小不能超过 5MB!')
        return false
      }
      return true
    },
    // 上传成功回调
    handleUploadSuccess(response, file, fileList) {
      if (response.code === 200) {
        this.postForm.images = fileList.map(f => {
          if (f === file) {
            return { ...f, url: response.data.url }
          }
          return f
        })
        this.$message.success('图片上传成功')
      } else {
        this.$message.error(response.msg)
      }
    },
    handleImageRemove(file, fileList) {
      this.postForm.images = fileList
    },
    previewPost() {
      this.previewVisible = true
    },
    getCategoryLabel(value) {
      const category = this.categories.find(c => c.value === value)
      return category ? category.label : value
    },
    loadPostData(postId) {
      getPost(postId).then(response => {
        if (response.code === 200) {
          const post = response.data;
          
          // Update form data
          this.postForm.title = post.title || '';
          this.postForm.category = post.category || '';
          this.postForm.content = post.content || '';
          
          // Handle tags
          if (post.tags) {
            this.postForm.tags = post.tags.split(',').filter(tag => tag);
          }
          
          // Handle images
          if (post.images) {
            const imageUrls = post.images.split(',').filter(url => url);
            this.postForm.images = imageUrls.map(url => {
              return {
                name: url.substring(url.lastIndexOf('/') + 1),
                url: url.startsWith('http') ? url : process.env.VUE_APP_BASE_API + url
              };
            });
          }
          
          // Update page title
          document.title = '编辑帖子 - ' + post.title;
          
          this.$message.success('帖子数据加载成功');
        } else {
          this.$message.error('加载帖子数据失败：' + (response.msg || '未知错误'));
        }
      }).catch(error => {
        console.error('加载帖子数据异常', error);
        this.$message.error('加载帖子数据异常，请刷新重试');
      });
    }
  }
}
</script>

<style scoped>
.create-post-page {
  max-width: 900px;
  margin: 0 auto;
}

.upload-tip {
  font-size: 12px;
  color: #909399;
  margin-top: 5px;
}

.post-preview {
  padding: 20px;
  border-radius: 4px;
  background-color: #fff;
}

.preview-title {
  margin-top: 0;
  margin-bottom: 15px;
  color: #303133;
}

.preview-meta {
  display: flex;
  color: #909399;
  font-size: 14px;
  margin-bottom: 15px;
}

.preview-meta span {
  margin-right: 15px;
}

.preview-tags {
  margin-bottom: 20px;
}

.preview-content {
  line-height: 1.6;
  margin-bottom: 20px;
  white-space: pre-wrap;
}

.image-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.preview-image-item {
  width: 120px;
  height: 120px;
  overflow: hidden;
  border-radius: 4px;
  border: 1px solid #EBEEF5;
}

.preview-image-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style> 