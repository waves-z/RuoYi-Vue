import request from '@/utils/request'

// 获取点赞状态
export function getLikeStatus(postId) {
  return request({
    url: '/bbs/like/status',
    method: 'get',
    params: { postId }
  })
}

// 点赞/取消点赞
export function toggleLike(postId, userId) {
  return request({
    url: '/bbs/like/toggle',
    method: 'post',
    data: {
      postId: postId,
      userId: userId
    }
  })
} 