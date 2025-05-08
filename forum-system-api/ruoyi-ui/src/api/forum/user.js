import request from '@/utils/request'

// 获取论坛用户信息
export function getInfo() {
  return request({
    url: '/system/forum/user/info',
    method: 'get'
  })
}

// 修改论坛用户个人资料
export function updateUserProfile(data) {
  return request({
    url: '/system/forum/user/profile',
    method: 'put',
    data: data
  })
}

// 修改论坛用户密码
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/forum/user/updatePwd',
    method: 'put',
    params: data
  })
}

// 论坛用户头像上传
export function uploadAvatar(data) {
  return request({
    url: '/system/forum/user/avatar',
    method: 'post',
    data: data
  })
} 