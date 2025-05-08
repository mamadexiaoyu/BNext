import request from '@/utils/request'

// 获取用户统计数据
export function getStatistics() {
  return request({
    url: '/system/forum/statistics/user',
    method: 'get'
  })
}

// 获取论坛总体统计数据
export function getForumStatistics() {
  return request({
    url: '/system/forum/statistics/forum',
    method: 'get'
  })
} 