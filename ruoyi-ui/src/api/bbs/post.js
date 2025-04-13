import request from '@/utils/request'

// 查询帖子列表
export function listPost(query) {
  return request({
    url: '/bbs/post/list',
    method: 'get',
    params: query
  })
}

// 查询帖子详细
export function getPost(postId) {
  return request({
    url: '/bbs/post/' + postId,
    method: 'get'
  })
}

// 新增帖子
export function addPost(data) {
  return request({
    url: '/bbs/post',
    method: 'post',
    data: data
  })
}

// 修改帖子
export function updatePost(data) {
  return request({
    url: '/bbs/post',
    method: 'put',
    data: data
  })
}

// 删除帖子
export function delPost(postId) {
  return request({
    url: '/bbs/post/' + postId,
    method: 'delete'
  })
}

// 更新帖子状态
export function updatePostStatus(postId, status) {
  return request({
    url: '/bbs/post/' + postId + '/status',
    method: 'put',
    data: { status }
  })
}

// 获取热门帖子
export function getHotPosts() {
  return request({
    url: '/bbs/post/hot',
    method: 'get'
  })
}

// 获取最新帖子
export function getLatestPosts() {
  return request({
    url: '/bbs/post/latest',
    method: 'get'
  })
}

// 增加帖子浏览量
export function incrementViewCount(postId) {
  return request({
    url: '/bbs/post/' + postId + '/view',
    method: 'post'
  })
}

// 增加帖子点赞数
export function incrementLikeCount(postId) {
  return request({
    url: '/bbs/post/' + postId + '/like',
    method: 'post'
  })
}

// 增加帖子评论数
export function incrementCommentCount(postId) {
  return request({
    url: '/bbs/post/' + postId + '/comment',
    method: 'post'
  })
}

// 添加评论
export function addComment(data) {
  return request({
    url: '/bbs/comment',
    method: 'post',
    data: {
      postId: data.postId,
      content: data.content,
      userId: data.userId
    }
  })
}

// 获取评论列表
export function listComments(postId) {
  return request({
    url: '/bbs/comment/list/' + postId,
    method: 'get'
  })
}

// 点赞帖子
export function likePost(postId) {
  return request({
    url: '/bbs/like',
    method: 'post',
    data: { postId, commentId: 0 }
  })
}

// 取消点赞
export function unlikePost(postId) {
  return request({
    url: '/bbs/like',
    method: 'post',
    data: { postId, commentId: 0 }
  })
}

// 获取点赞状态
export function getLikeStatus(postId) {
  return request({
    url: '/bbs/like/status',
    method: 'get',
    params: { postId, commentId: 0 }
  })
} 