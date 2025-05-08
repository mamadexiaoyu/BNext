import request from '@/utils/request'

// 查询检测图片记录列表
export function listImage(query) {
  return request({
    url: '/system/image/list',
    method: 'get',
    params: query
  })
}

// 查询检测图片记录详细
export function getImage(id) {
  return request({
    url: '/system/image/' + id,
    method: 'get'
  })
}

// 新增检测图片记录
export function addImage(data) {
  return request({
    url: '/system/image',
    method: 'post',
    data: data
  })
}

// 修改检测图片记录
export function updateImage(data) {
  return request({
    url: '/system/image',
    method: 'put',
    data: data
  })
}

// 删除检测图片记录
export function delImage(id) {
  return request({
    url: '/system/image/' + id,
    method: 'delete'
  })
}
