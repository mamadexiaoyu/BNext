import request from '@/utils/request'

// 查询论坛消息列表
export function listMessages(query) {
  return request({
    url: '/system/message/list',
    method: 'get',
    params: query
  })
}

// 查询论坛消息详细
export function getMessage(id) {
  return request({
    url: '/system/message/' + id,
    method: 'get'
  })
}

// 新增论坛消息
export function addMessage(data) {
  return request({
    url: '/system/message',
    method: 'post',
    data: data
  })
}

// 修改论坛消息
export function updateMessage(data) {
  return request({
    url: '/system/message',
    method: 'put',
    data: data
  })
}

// 删除论坛消息
export function delMessage(id) {
  return request({
    url: '/system/message/' + id,
    method: 'delete'
  })
}

// 导出论坛消息
export function exportMessage(query) {
  return request({
    url: '/system/message/export',
    method: 'get',
    params: query
  })
}

// 标记消息为已读
export function markMessageAsRead(id) {
  return request({
    url: '/system/message/read/' + id,
    method: 'put'
  })
}

// 清空用户所有消息
export function clearMessages() {
  return request({
    url: '/system/message/clear/' + getUserId(),
    method: 'delete'
  })
}

// 发送系统消息
export function sendSystemMessage(userId, content) {
  return request({
    url: '/system/message/system/' + userId,
    method: 'post',
    data: content
  })
}

// 发送评论消息
export function sendCommentMessage(data) {
  return request({
    url: '/system/message/comment',
    method: 'post',
    data: data
  })
}

// 发送点赞消息
export function sendLikeMessage(data) {
  return request({
    url: '/system/message/like',
    method: 'post',
    data: data
  })
}

// 发送关注消息
export function sendFollowMessage(data) {
  return request({
    url: '/system/message/follow',
    method: 'post',
    data: data
  })
}

// 获取当前用户ID
function getUserId() {
  return JSON.parse(localStorage.getItem('userInfo')).userId
} 