<template>
  <div class="image-detection-container">
    <el-card class="upload-card">
      <div slot="header" class="clearfix">
        <span>图像检测</span>
        <el-button style="float: right; padding: 3px 0" type="text"
          @click="$router.push('/forum/image-detection/history')">查看历史记录</el-button>
      </div>

      <!-- 未登录提示 -->
      <el-alert
        v-if="!isLoggedIn"
        title="请先登录"
        type="warning"
        description="您需要登录才能使用图像检测功能"
        show-icon
        :closable="false">
        <el-button type="primary" size="small" @click="goToLogin" style="margin-top: 10px;">
          立即登录
        </el-button>
      </el-alert>

      <div class="upload-area" v-if="isLoggedIn">
        <div class="upload-instructions">
          <h3>上传图片进行检测</h3>
          <p>支持jpg、png格式图片，大小不超过10MB</p>
        </div>

        <div class="upload-container">
          <el-upload class="upload-box" :action="uploadUrl" :headers="headers" :show-file-list="false"
            :on-success="handleUploadSuccess" :on-error="handleUploadError" :before-upload="beforeUpload" drag>
            <i v-if="!imageUrl" class="el-icon-upload"></i>
            <div v-if="!imageUrl" class="el-upload__text">
              <h3>上传图片</h3>
              <p>拖拽图片到此处，或<em>点击上传</em></p>
            </div>
            <img v-if="imageUrl" :src="imageUrl" class="upload-image">
          </el-upload>
        </div>

        <div class="upload-actions">
          <el-button type="primary" @click="startDetection" :disabled="!imageUrl || detecting">
            {{ detecting ? '检测中...' : '开始检测' }}
          </el-button>
          <el-button @click="resetUpload" :disabled="!imageUrl || detecting">重置</el-button>
        </div>
      </div>

      <div v-if="detectionResult" class="detection-result">
        <h3>检测结果</h3>
        <div class="result-content">
          <div class="result-image-container">
            <img :src="resultImageUrl || imageUrl" class="result-image">
          </div>
          <div class="result-data">
            <div v-for="(item, index) in detectionResult.items" :key="index" class="result-item">
              <div class="item-label">{{ item.label }}</div>
              <div class="item-confidence">置信度: {{ (item.confidence * 100).toFixed(2) }}%</div>
            </div>
          </div>
        </div>

        <div class="result-actions">
          <el-button type="primary" @click="saveResult">保存结果</el-button>
          <el-button @click="resetDetection">重新检测</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'
import { detectImage, saveDetectionResult } from '@/api/forum/image-detection'

export default {
  name: 'ImageDetection',
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + '/file/upload',
      headers: {
        Authorization: 'Bearer ' + getToken()
      },
      imageUrl: '',
      originalImage: null,
      detecting: false,
      detectionResult: null,
      resultImageUrl: '',
      savedId: null,
      isLoggedIn: !!getToken()
    }
  },
  created() {
    // 检查登录状态
    if (!this.isLoggedIn) {
      this.$message.warning('您需要登录才能使用图像检测功能')
      return
    }
    
    // Check if we're redirected from detail with an imageId
    const imageId = this.$route.query.imageId
    if (imageId) {
      this.originalImage = { id: imageId }
      this.$message.info('正在准备图片...')
      // Get image details to display
      this.$http.get(process.env.VUE_APP_BASE_API + `/system/forum/image-detection/image/${imageId}`).then(res => {
        if (res.data.code === 200) {
          this.imageUrl = process.env.VUE_APP_BASE_API + res.data.data.url
          this.$message.success('图片已加载，可以开始检测')
        }
      }).catch(() => {
        this.$message.error('加载图片失败')
      })
    }
  },
  methods: {
    // 跳转到登录页
    goToLogin() {
      this.$router.push('/forum/login?redirect=' + encodeURIComponent(this.$route.fullPath))
    },
    beforeUpload(file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isLt10M = file.size / 1024 / 1024 < 10

      if (!isJPG && !isPNG) {
        this.$message.error('只能上传JPG/PNG格式图片!')
        return false
      }

      if (!isLt10M) {
        this.$message.error('图片大小不能超过10MB!')
        return false
      }

      return true
    },
    handleUploadSuccess(response) {
      if (response.code === 200) {
        this.imageUrl = response.data.url
        this.originalImage = response.data
        this.$message.success('图片上传成功')
      } else {
        this.$message.error(response.msg || '上传失败')
      }
    },
    handleUploadError() {
      this.$message.error('图片上传失败，请重试')
    },
    resetUpload() {
      this.imageUrl = ''
      this.originalImage = null
      this.resetDetection()
    },
    startDetection() {
      if (!this.originalImage) {
        this.$message.warning('请先上传图片')
        return
      }

      this.detecting = true
      // 调用后端检测API
      const data = {
        url: this.imageUrl,
        fileName: this.originalImage.fileName,
        fileSize: this.originalImage.fileSize,
        mimeType: this.originalImage.mimeType
      }
      detectImage(data).then(response => {
        console.log(response)
        if (response.code === 200) {
          // this.detectionResult = response.data
          // this.resultImageUrl = this.detectionResult.resultImageUrl
          //去检测记录列表
          this.$router.push('/forum/image-detection/history')
          this.$message.success('已发起检测，请稍后查看结果')
        } else {
          this.$message.error(response.msg || '检测失败')
        }
      }).catch(err => {
        console.error(err)
        this.$message.error('检测请求失败，请重试')
      }).finally(() => {
        this.detecting = false
      })
    },
    resetDetection() {
      this.detectionResult = null
      this.resultImageUrl = ''
      this.savedId = null
    },
    saveResult() {
      if (!this.detectionResult) {
        this.$message.warning('没有可保存的结果')
        return
      }

      if (this.savedId) {
        this.$message.info('结果已保存')
        return
      }

      // 调用保存API
      saveDetectionResult(this.detectionResult.id).then(response => {
        if (response.code === 200) {
          this.savedId = response.data.id
          this.$message.success('结果已保存')
        } else {
          this.$message.error(response.msg || '保存失败')
        }
      }).catch(err => {
        console.error(err)
        this.$message.error('保存请求失败，请重试')
      })
    }
  }
}
</script>

<style scoped>
.image-detection-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.upload-card {
  margin-bottom: 20px;
}

.upload-area {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 30px;
  width: 100%;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.upload-instructions {
  text-align: center;
  margin-bottom: 20px;
}

.upload-instructions h3 {
  margin-bottom: 10px;
  color: #303133;
}

.upload-instructions p {
  color: #909399;
  font-size: 14px;
}

.upload-container {
  width: 100%;
  margin-bottom: 20px;
}

.upload-box {
  width: 100%;
  height: 300px;
}

.upload-box ::v-deep .el-upload {
  width: 100%;
  height: 100%;
}

.upload-box ::v-deep .el-upload-dragger {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.upload-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.upload-actions {
  margin-top: 20px;
  text-align: center;
}

.detection-result {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid #EBEEF5;
}

.detection-result h3 {
  margin-bottom: 20px;
  color: #303133;
  text-align: center;
}

.result-content {
  display: flex;
  margin-bottom: 20px;
}

.result-image-container {
  flex: 1;
  margin-right: 20px;
  text-align: center;
}

.result-image {
  max-width: 400px;
  max-height: 300px;
  object-fit: contain;
}

.result-data {
  flex: 1;
  overflow-y: auto;
  max-height: 300px;
}

.result-item {
  background-color: #f7f7f7;
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 10px;
}

.item-label {
  font-weight: bold;
  margin-bottom: 5px;
}

.item-confidence {
  color: #67C23A;
}

.result-actions {
  text-align: center;
}
</style>