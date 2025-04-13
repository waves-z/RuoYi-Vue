// 查询最新帖子列表
export function listLatestPosts(query) {
  return request({
    url: '/system/post/latest',
    method: 'get',
    params: query
  })
} 