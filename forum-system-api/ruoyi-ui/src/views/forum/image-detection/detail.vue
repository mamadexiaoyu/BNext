<template>
  <div class="detection-detail-container">
    <el-card class="detail-card">
      <div slot="header" class="clearfix">
        <span>检测结果详情</span>
        <el-button
          style="float: right; padding: 3px 0"
          type="text"
          @click="$router.push('/forum/image-detection/history')"
        >返回列表</el-button>
      </div>
      
      <div v-loading="loading" class="detail-content">
        <div v-if="detailData" class="detection-detail">
          <div class="detail-header">
            <div class="detection-id">
              <span class="label">检测ID：</span>
              <span class="value">{{ detailData.id }}</span>
            </div>
            <div class="detection-time">
              <span class="label">检测时间：</span>
              <span class="value">{{ parseTime(detailData.createTime) }}</span>
            </div>
          </div>
          
          <div class="detail-images">
            <div class="original-image">
              <h4>原始图片</h4>
              <el-image
                :src="detailData.originalImageUrl"
                style="max-width: 100%; max-height: 400px"
                :preview-src-list="[detailData.originalImageUrl]"
                fit="contain"
              ></el-image>
            </div>
            <div class="result-image">
              <h4>检测结果</h4>
              <el-image
                :src="detailData.resultImageUrl"
                style="max-width: 100%; max-height: 400px"
                :preview-src-list="[detailData.resultImageUrl]"
                fit="contain"
              ></el-image>
            </div>
          </div>
          
          <div class="detection-info">
            <h4>检测信息</h4>
            <div class="info-grid">
              <div class="info-item">
                <span class="label">检测对象数：</span>
                <span class="value">{{ detailData.objectCount }}</span>
              </div>
              <div class="info-item">
                <span class="label">处理时间：</span>
                <span class="value">{{ detailData.processingTime }}ms</span>
              </div>
              <div class="info-item">
                <span class="label">检测模型：</span>
                <span class="value">{{ detailData.modelName || 'YOLOv5' }}</span>
              </div>
              <div class="info-item">
                <span class="label">图片大小：</span>
                <span class="value">{{ detailData.imageWidth }} x {{ detailData.imageHeight }}</span>
              </div>
            </div>
          </div>
          
          <div class="detection-objects">
            <h4>检测到的对象</h4>
            <el-table
              :data="detailData.detectionItems"
              style="width: 100%"
              border
            >
              <el-table-column
                prop="label"
                label="对象类型"
                width="180"
              ></el-table-column>
              <el-table-column
                prop="confidence"
                label="置信度"
                width="120"
              >
                <template slot-scope="scope">
                  <el-progress
                    :percentage="(scope.row.confidence * 100).toFixed(0)"
                    :color="getConfidenceColor(scope.row.confidence)"
                  ></el-progress>
                </template>
              </el-table-column>
              <el-table-column
                label="位置信息"
              >
                <template slot-scope="scope">
                  <div class="position-info">
                    <span>X: {{ Math.round(scope.row.position.x) }}</span>
                    <span>Y: {{ Math.round(scope.row.position.y) }}</span>
                    <span>宽: {{ Math.round(scope.row.position.width) }}</span>
                    <span>高: {{ Math.round(scope.row.position.height) }}</span>
                  </div>
                </template>
              </el-table-column>
            </el-table>
          </div>
          
          <div class="detection-actions">
            <el-button type="primary" @click="downloadResult">下载检测结果</el-button>
            <el-button @click="redetect">重新检测</el-button>
          </div>
        </div>
        
        <div v-else-if="!loading" class="no-data">
          <i class="el-icon-warning"></i>
          <p>未找到检测结果或数据已失效</p>
          <el-button @click="$router.push('/forum/image-detection')">返回检测</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import { parseTime } from '@/utils/ruoyi'
import { getDetectionDetail, downloadDetectionResult } from '@/api/forum/image-detection'

export default {
  name: 'DetectionDetail',
  data() {
    return {
      loading: true,
      detailData: null
    }
  },
  created() {
    const id = this.$route.params.id
    if (id) {
      this.getDetail(id)
    } else {
      this.loading = false
    }
  },
  methods: {
    parseTime,
    // 获取检测详情
    getDetail(id) {
      this.loading = true
      // 调用后端获取详情API
      getDetectionDetail(id).then(response => {
        if (response.code === 200) {
          const detail = response.data
          
          this.detailData = {
            ...detail,
            originalImageUrl: process.env.VUE_APP_BASE_API + detail.originalImageUrl,
            resultImageUrl: process.env.VUE_APP_BASE_API + detail.resultImageUrl,
            objectCount: detail.detectionItems ? detail.detectionItems.length : 0,
            imageWidth: detail.imageWidth || 0,
            imageHeight: detail.imageHeight || 0
          }
        } else {
          this.$message.error(response.msg || '获取检测详情失败')
          this.detailData = null
        }
        this.loading = false
      }).catch(err => {
        console.error(err)
        this.$message.error('获取检测详情失败，请重试')
        this.loading = false
        this.detailData = null
      })
    },
    // 下载检测结果
    downloadResult() {
      if (!this.detailData) {
        this.$message.warning('没有可下载的结果')
        return
      }
      
      // 调用后端下载API
      downloadDetectionResult(this.detailData.id).then(response => {
        const blob = new Blob([response], { type: 'application/octet-stream' })
        const url = window.URL.createObjectURL(blob)
        const link = document.createElement('a')
        link.href = url
        link.download = `detection-${this.detailData.id}.zip`
        link.click()
        window.URL.revokeObjectURL(url)
      }).catch(() => {
        this.$message.error('下载失败，请重试')
      })
    },
    // 重新检测
    redetect() {
      this.$confirm('是否使用相同图片重新进行检测?', '确认信息', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$router.push({
          path: '/forum/image-detection',
          query: { imageId: this.detailData.originalImageId }
        })
      }).catch(() => {})
    },
    // 根据置信度获取颜色
    getConfidenceColor(confidence) {
      if (confidence >= 0.9) {
        return '#67C23A'  // 绿色
      } else if (confidence >= 0.7) {
        return '#409EFF'  // 蓝色 
      } else if (confidence >= 0.5) {
        return '#E6A23C'  // 黄色
      } else {
        return '#F56C6C'  // 红色
      }
    }
  }
}
</script>

<style scoped>
.detection-detail-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.detail-card {
  margin-bottom: 20px;
}

.detail-content {
  min-height: 500px;
}

.detection-detail {
  padding: 10px;
}

.detail-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #EBEEF5;
}

.detection-id .label,
.detection-time .label {
  font-weight: bold;
  margin-right: 10px;
}

.detail-images {
  display: flex;
  justify-content: space-between;
  margin-bottom: 30px;
  flex-wrap: wrap;
}

.original-image, .result-image {
  width: 48%;
  text-align: center;
  min-width: 300px;
}

.original-image h4, .result-image h4 {
  margin-bottom: 15px;
  color: #303133;
}

.detection-info {
  margin-bottom: 30px;
}

.detection-info h4 {
  margin-bottom: 15px;
  color: #303133;
}

.info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 15px;
}

.info-item {
  padding: 10px;
  background-color: #f9f9f9;
  border-radius: 4px;
}

.info-item .label {
  font-weight: bold;
  color: #606266;
}

.detection-objects {
  margin-bottom: 30px;
}

.detection-objects h4 {
  margin-bottom: 15px;
  color: #303133;
}

.position-info {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.detection-actions {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 30px;
}

.no-data {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 300px;
  color: #909399;
}

.no-data i {
  font-size: 50px;
  margin-bottom: 20px;
}

.no-data p {
  margin-bottom: 20px;
}
</style> 