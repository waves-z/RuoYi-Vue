package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BbsPost;

/**
 * 帖子Service接口
 */
public interface IBbsPostService {
    /**
     * 查询帖子
     */
    public BbsPost selectBbsPostByPostId(Long postId);

    /**
     * 查询帖子列表
     */
    public List<BbsPost> selectBbsPostList(BbsPost bbsPost);

    /**
     * 查询热门帖子列表
     */
    public List<BbsPost> selectHotPostList();

    /**
     * 查询最新帖子列表
     * 
     * @param bbsPost 帖子信息
     * @return 帖子集合
     */
    public List<BbsPost> selectLatestPostList(BbsPost bbsPost);

    /**
     * 新增帖子
     */
    public int insertBbsPost(BbsPost bbsPost);

    /**
     * 修改帖子
     */
    public int updateBbsPost(BbsPost bbsPost);

    /**
     * 批量删除帖子
     */
    public int deleteBbsPostByPostIds(Long[] postIds);

    /**
     * 删除帖子信息
     */
    public int deleteBbsPostByPostId(Long postId);

    /**
     * 更新帖子状态
     */
    public int updatePostStatus(BbsPost bbsPost);

    /**
     * 增加帖子浏览量
     */
    public int incrementViewCount(Long postId);

    /**
     * 增加帖子点赞数
     */
    public int incrementLikeCount(Long postId);

    /**
     * 增加帖子评论数
     */
    public int incrementCommentCount(Long postId);
} 