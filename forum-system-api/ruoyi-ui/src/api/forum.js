import request from '@/utils/request'

// 获取论坛帖子列表
export function getForumPosts(query) {
  return request({
    url: '/system/forum/post/list',
    method: 'get',
    params: query
  })
}

// 获取我的帖子列表
export function getMyPosts(query) {
  return request({
    url: '/system/forum/post/my',
    method: 'get',
    params: query
  })
}

// 获取论坛消息列表
export function getForumMessages(query) {
  return request({
    url: '/system/forum/message/list',
    method: 'get',
    params: query
  })
}

// 创建论坛帖子
export function createForumPost(data) {
  return request({
    url: '/system/forum/post',
    method: 'post',
    data: data
  })
}

// 添加论坛评论
export function addForumComment(postId, data) {
  return request({
    url: `/system/forum/post/${postId}/comment`,
    method: 'post',
    data: data
  })
} 