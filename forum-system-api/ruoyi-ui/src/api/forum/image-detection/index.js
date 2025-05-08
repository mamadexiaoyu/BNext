import request from '@/utils/request'

// 上传图片
export function uploadImage(data) {
  return request({
    url: '/file/upload',
    method: 'post',
    data: data
  })
}

// 检测图片
export function detectImage(data) {
  return request({
    url: '/system/image',
    method: 'post',
    data: {
      url: data.url,
      fileName: data.fileName,
      fileSize: data.fileSize,
      mimeType: data.mimeType
    }
  })
}

// 获取检测历史列表
export function getDetectionList(query) {
  return request({
    url: '/system/record/list',
    method: 'get',
    params: query
  })
}

// 获取检测详情
export function getDetectionDetail(id) {
  return request({
    url: '/system/forum/image-detection/' + id,
    method: 'get'
  })
}

// 保存检测结果
export function saveDetectionResult(detectionId) {
  return request({
    url: '/system/forum/image-detection/save',
    method: 'post',
    data: { detectionId }
  })
}

// 删除检测记录
export function deleteDetection(id) {
  return request({
    url: '/system/record/' + id,
    method: 'delete'
  })
}

// 下载检测结果
export function downloadDetectionResult(id) {
  return request({
    url: '/system/forum/image-detection/download/' + id,
    method: 'get',
    responseType: 'blob'
  })
} 