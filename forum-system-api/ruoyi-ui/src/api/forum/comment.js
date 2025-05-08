import request from '@/utils/request'

// 查询帖子评论列表
export function listComments(postId, query) {
  return request({
    url: `/system/forum/post/comment/list/${postId}`,
    method: 'get',
    params: query
  })
}

// 添加评论
export function addComment(postId, data) {
  return request({
    url: `/system/forum/post/comment`,
    method: 'post',
    data: data
  })
}

// 回复评论
export function replyComment(postId, commentId, data) {
  // 复用添加评论接口，只是在数据中添加父评论ID和回复用户信息
  return request({
    url: `/system/forum/post/comment`,
    method: 'post',
    data: data
  })
}

// 删除评论
export function deleteComment(commentId) {
  return request({
    url: `/system/forum/post/comment/${commentId}`,
    method: 'delete'
  })
}

// 点赞评论
export function likeComment(commentId) {
  // 这个接口后端尚未实现，暂时使用模拟返回
  return Promise.resolve({ code: 200, msg: "操作成功" });
}

// 取消点赞评论
export function unlikeComment(commentId) {
  // 这个接口后端尚未实现，暂时使用模拟返回
  return Promise.resolve({ code: 200, msg: "操作成功" });
} 