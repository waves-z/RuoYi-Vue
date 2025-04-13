package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BbsPostMapper;
import com.ruoyi.system.domain.BbsPost;
import com.ruoyi.system.service.IBbsPostService;

/**
 * 帖子Service业务层处理
 */
@Service
public class BbsPostServiceImpl implements IBbsPostService {
    @Autowired
    private BbsPostMapper bbsPostMapper;

    /**
     * 查询帖子
     * 
     * @param postId 帖子ID
     * @return 帖子
     */
    @Override
    public BbsPost selectBbsPostByPostId(Long postId) {
        return bbsPostMapper.selectBbsPostByPostId(postId);
    }

    /**
     * 查询帖子列表
     * 
     * @param bbsPost 帖子
     * @return 帖子
     */
    @Override
    public List<BbsPost> selectBbsPostList(BbsPost bbsPost) {
        return bbsPostMapper.selectBbsPostList(bbsPost);
    }

    /**
     * 查询热门帖子列表
     */
    @Override
    public List<BbsPost> selectHotPostList() {
        return bbsPostMapper.selectHotPostList();
    }

    /**
     * 查询最新帖子列表
     * 
     * @param bbsPost 帖子信息
     * @return 帖子集合
     */
    @Override
    public List<BbsPost> selectLatestPostList(BbsPost bbsPost) {
        return bbsPostMapper.selectBbsPostList(bbsPost);
    }

    /**
     * 新增帖子
     * 
     * @param bbsPost 帖子
     * @return 结果
     */
    @Override
    public int insertBbsPost(BbsPost bbsPost) {
        return bbsPostMapper.insertBbsPost(bbsPost);
    }

    /**
     * 修改帖子
     * 
     * @param bbsPost 帖子
     * @return 结果
     */
    @Override
    public int updateBbsPost(BbsPost bbsPost) {
        System.out.println("Updating post with data: " + bbsPost.toString());
        int rows = bbsPostMapper.updateBbsPost(bbsPost);
        System.out.println("Update result rows: " + rows);
        return rows;
    }

    /**
     * 批量删除帖子
     * 
     * @param postIds 需要删除的帖子ID
     * @return 结果
     */
    @Override
    public int deleteBbsPostByPostIds(Long[] postIds) {
        return bbsPostMapper.deleteBbsPostByPostIds(postIds);
    }

    /**
     * 删除帖子信息
     * 
     * @param postId 帖子ID
     * @return 结果
     */
    @Override
    public int deleteBbsPostByPostId(Long postId) {
        return bbsPostMapper.deleteBbsPostByPostId(postId);
    }

    /**
     * 更新帖子状态
     * 
     * @param bbsPost 帖子
     * @return 结果
     */
    @Override
    public int updatePostStatus(BbsPost bbsPost) {
        return bbsPostMapper.updateBbsPost(bbsPost);
    }

    /**
     * 增加帖子浏览量
     */
    @Override
    public int incrementViewCount(Long postId) {
        return bbsPostMapper.incrementViewCount(postId);
    }

    /**
     * 增加帖子点赞数
     */
    @Override
    public int incrementLikeCount(Long postId) {
        return bbsPostMapper.incrementLikeCount(postId);
    }

    /**
     * 增加帖子评论数
     */
    @Override
    public int incrementCommentCount(Long postId) {
        return bbsPostMapper.incrementCommentCount(postId);
    }
} 