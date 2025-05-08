<template>
  <div class="detection-history-container">
    <el-card class="history-card">
      <div slot="header" class="clearfix">
        <span>检测历史记录</span>
        <el-button
          style="float: right; padding: 3px 0"
          type="text"
          @click="$router.push('/forum/image-detection')"
        >返回检测</el-button>
      </div>
      

      
      <div v-loading="loading" class="history-content">
        <el-table
          :data="historyList"
          style="width: 100%"
        >
          <!-- <el-table-column
            prop="id"
            label="ID"
            width="80"
          ></el-table-column> -->
          <el-table-column
            prop="imagePreview"
            label="图片"
          >
            <template slot-scope="scope">
              <el-image 
                style="width: 80px; height: 60px"
                :src="scope.row.resultImageUrl"
                :preview-src-list="[scope.row.resultImageUrl]"
                fit="contain"
              ></el-image>
            </template>
          </el-table-column>
          <el-table-column
            prop="detectedObjects"
            label="检测到的对象"
          >
            <template slot-scope="scope">
              <el-tag
                v-for="(tag, index) in scope.row.detectedObjectsList"
                :key="index"
                size="mini"
                style="margin-right: 5px; margin-bottom: 5px"
              >
                {{ tag }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column
            prop="confidence"
            label="最高置信度"
            width="120"
          >
            <template slot-scope="scope">
              {{ (scope.row.highestConfidence * 100).toFixed(2) }}%
            </template>
          </el-table-column>
          <el-table-column
            prop="createTime"
            label="检测时间"
            width="180"
          >
            <template slot-scope="scope">
              {{ parseTime(scope.row.createTime) }}
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            width="180"
          >
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                class="delete-btn"
                @click.stop="handleDelete(scope.row)"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        
        <div class="pagination-container">
          <el-pagination
            background
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="queryParams.pageNum"
            :page-sizes="[10, 20, 30, 50]"
            :page-size="queryParams.pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
          ></el-pagination>
        </div>
      </div>
    </el-card>
    
    <!-- 详情对话框 -->
    <el-dialog
      title="检测结果详情"
      :visible.sync="detailVisible"
      width="70%"
    >
      <div v-if="detailData" class="detail-content">
        <div class="detail-images">
          <div class="original-image">
            <h4>原始图片</h4>
            <el-image
              :src="detailData.originalImageUrl"
              style="max-width: 100%; max-height: 300px"
              :preview-src-list="[detailData.originalImageUrl]"
              fit="contain"
            ></el-image>
          </div>
          <div class="result-image">
            <h4>检测结果</h4>
            <el-image
              :src="detailData.resultImageUrl"
              style="max-width: 100%; max-height: 300px"
              :preview-src-list="[detailData.resultImageUrl]"
              fit="contain"
            ></el-image>
          </div>
        </div>
        
        <div class="detection-details">
          <h4>检测信息</h4>
          <ul class="detail-list">
            <li><strong>检测ID：</strong>{{ detailData.id }}</li>
            <li><strong>检测时间：</strong>{{ parseTime(detailData.createTime) }}</li>
            <li><strong>检测对象数：</strong>{{ detailData.objectCount }}</li>
            <li><strong>处理时间：</strong>{{ detailData.processingTime }}ms</li>
          </ul>
          
          <h4>检测到的对象</h4>
          <el-table
            :data="detailData.detectionItems"
            style="width: 100%"
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
                {{ (scope.row.confidence * 100).toFixed(2) }}%
              </template>
            </el-table-column>
            <el-table-column
              prop="position"
              label="位置信息"
            >
              <template slot-scope="scope">
                x: {{ scope.row.position.x }}, 
                y: {{ scope.row.position.y }}, 
                width: {{ scope.row.position.width }}, 
                height: {{ scope.row.position.height }}
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="detailVisible = false">关闭</el-button>
        <el-button type="primary" @click="downloadResult">下载检测结果</el-button>
      </span>
    </el-dialog>
    
    <!-- 删除确认对话框 -->
    <el-dialog
      title="删除确认"
      :visible.sync="deleteVisible"
      width="30%"
    >
      <div class="delete-confirm">
        <p>确定要删除这条检测记录吗？此操作不可恢复。</p>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="deleteVisible = false">取消</el-button>
        <el-button type="danger" @click="confirmDelete">确定删除</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { parseTime } from '@/utils/ruoyi'
import { getDetectionList, getDetectionDetail, downloadDetectionResult, deleteDetection } from '@/api/forum/image-detection'

export default {
  name: 'DetectionHistory',
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 历史记录表格数据
      historyList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        beginTime: undefined,
        endTime: undefined,
        object: undefined
      },
      // 日期范围
      dateRange: [],
      // 是否显示搜索表单
      showSearch: true,
      // 详情对话框
      detailVisible: false,
      detailData: null,
      // 删除对话框
      deleteVisible: false,
      deleteId: null
    }
  },
  created() {
    this.getList()
  },
  methods: {
    parseTime,
    // 获取历史记录列表
    getList() {
      this.loading = true
      // 调用后端获取列表API
      getDetectionList(this.queryParams).then(response => {
        if (response.code === 200) {
          const { rows, total } = response
          
          // 处理数据
          this.historyList = rows.map(item => {
            return {
              ...item,
              imageUrl: process.env.VUE_APP_BASE_API + item.imageUrl,
              detectedObjectsList: (item.detectedObjects || '').split(',').filter(obj => obj),
              highestConfidence: item.highestConfidence || 0
            }
          })
          this.total = total
        } else {
          this.$message.error(response.msg || '获取历史记录失败')
          this.historyList = []
          this.total = 0
        }
        this.loading = false
      }).catch(err => {
        console.error(err)
        this.$message.error('获取历史记录失败，请重试')
        this.loading = false
      })
    },
    // 处理日期范围变化
    handleDateRangeChange(val) {
      if (val) {
        this.queryParams.beginTime = val[0]
        this.queryParams.endTime = val[1]
      } else {
        this.queryParams.beginTime = undefined
        this.queryParams.endTime = undefined
      }
    },
    // 搜索按钮操作
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    // 重置按钮操作
    resetQuery() {
      this.dateRange = []
      this.$refs["queryForm"].resetFields()
      this.queryParams.beginTime = undefined
      this.queryParams.endTime = undefined
      this.queryParams.object = undefined
      this.handleQuery()
    },
    // 处理行点击事件
    handleRowClick(row) {
      this.viewDetail(row)
    },
    // 查看详情
    viewDetail(row) {
      // 调用后端获取详情API
      getDetectionDetail(row.id).then(response => {
        if (response.code === 200) {
          const detail = response.data
          
          this.detailData = {
            ...detail,
            originalImageUrl: process.env.VUE_APP_BASE_API + detail.originalImageUrl,
            resultImageUrl: process.env.VUE_APP_BASE_API + detail.resultImageUrl,
            objectCount: detail.detectionItems ? detail.detectionItems.length : 0
          }
          
          this.detailVisible = true
        } else {
          this.$message.error(response.msg || '获取检测详情失败')
        }
      }).catch(err => {
        console.error(err)
        this.$message.error('获取检测详情失败，请重试')
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
    // 处理删除记录
    handleDelete(row) {
      this.deleteId = row.id
      this.deleteVisible = true
    },
    // 确认删除
    confirmDelete() {
      if (!this.deleteId) return
      
      deleteDetection(this.deleteId).then(response => {
        if (response.code === 200) {
          this.$message.success('删除成功')
          this.getList()
        } else {
          this.$message.error(response.msg || '删除失败')
        }
        this.deleteVisible = false
        this.deleteId = null
      }).catch(err => {
        console.error(err)
        this.$message.error('删除失败，请重试')
        this.deleteVisible = false
      })
    },
    // 处理每页条数变化
    handleSizeChange(size) {
      this.queryParams.pageSize = size
      this.getList()
    },
    // 处理页码变化
    handleCurrentChange(page) {
      this.queryParams.pageNum = page
      this.getList()
    }
  }
}
</script>

<style scoped>
.detection-history-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.history-card {
  margin-bottom: 20px;
}

.search-form {
  margin-bottom: 20px;
  background-color: #f5f7fa;
  padding: 15px;
  border-radius: 4px;
}

.history-content {
  min-height: 500px;
}

.pagination-container {
  margin-top: 20px;
  text-align: center;
}

.detail-content {
  max-width: 100%;
}

.detail-images {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  flex-wrap: wrap;
}

.original-image, .result-image {
  width: 48%;
  min-width: 300px;
  margin-bottom: 20px;
}

.original-image h4, .result-image h4 {
  margin-bottom: 10px;
}

.detection-details {
  margin-top: 20px;
}

.detail-list {
  padding-left: 20px;
  margin-bottom: 20px;
}

.detail-list li {
  margin-bottom: 10px;
}

.delete-btn {
  color: #F56C6C;
}

.delete-confirm {
  text-align: center;
  padding: 20px 0;
}
</style> 