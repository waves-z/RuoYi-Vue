import request from '@/utils/request'

// 查询评论列表
export function listComments(postId) {
  return request({
    url: '/bbs/comment/list/' + postId,
    method: 'get'
  })
}

// 查询评论详细
export function getComment(commentId) {
  return request({
    url: '/bbs/comment/' + commentId,
    method: 'get'
  })
}

// 新增评论
export function addComment(data) {
  return request({
    url: '/bbs/comment',
    method: 'post',
    data: data
  })
}

// 修改评论
export function updateComment(data) {
  return request({
    url: '/bbs/comment',
    method: 'put',
    data: data
  })
}

// 删除评论
export function deleteComment(commentId) {
  return request({
    url: '/bbs/comment/' + commentId,
    method: 'delete'
  })
}

// 通过评论
export function approveComment(commentId) {
  return request({
    url: '/bbs/comment/' + commentId + '/approve',
    method: 'put'
  })
}

// 拒绝评论
export function rejectComment(commentId) {
  return request({
    url: '/bbs/comment/' + commentId + '/reject',
    method: 'put'
  })
} 