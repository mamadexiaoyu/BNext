import request from '@/utils/request'

// 查询帖子列表
export function listPost(query) {
  return request({
    url: '/system/forum/post/list',
    method: 'get',
    params: query
  })
}

// 查询我的帖子列表
export function listMyPosts(query) {
  return request({
    url: '/system/forum/post/my',
    method: 'get',
    params: query
  })
}

// 查询帖子详细
export function getPost(id) {
  return request({
    url: '/system/forum/post/' + id,
    method: 'get'
  })
}

// 新增帖子
export function addPost(data) {
  return request({
    url: '/system/forum/post',
    method: 'post',
    data: data
  })
}

// 修改帖子
export function updatePost(data) {
  return request({
    url: '/system/forum/post',
    method: 'put',
    data: data
  })
}

// 删除帖子
export function delPost(id) {
  return request({
    url: '/system/forum/post/' + id,
    method: 'delete'
  })
}

// 点赞帖子
export function likePost(id) {
  return request({
    url: '/system/forum/post/like/' + id,
    method: 'put'
  })
}

// 取消点赞
export function unlikePost(id) {
  return request({
    url: '/system/forum/post/unlike/' + id,
    method: 'put'
  })
} 