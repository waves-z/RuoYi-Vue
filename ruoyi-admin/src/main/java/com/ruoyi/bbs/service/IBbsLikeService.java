package com.ruoyi.bbs.service;

import java.util.List;
import com.ruoyi.bbs.domain.BbsLike;

/**
 * 点赞Service接口
 */
public interface IBbsLikeService {
    /**
     * 查询点赞
     */
    public BbsLike selectBbsLikeById(Long likeId);

    /**
     * 查询点赞列表
     */
    public List<BbsLike> selectBbsLikeList(BbsLike bbsLike);

    /**
     * 新增点赞
     */
    public int insertBbsLike(BbsLike bbsLike);

    /**
     * 删除点赞
     */
    public int deleteBbsLike(BbsLike bbsLike);

    /**
     * 查询点赞状态
     */
    public boolean checkLikeStatus(Long userId, Long postId, Long commentId);

    /**
     * 切换点赞状态
     * @param postId 帖子ID
     * @param userId 用户ID
     * @return 1表示点赞成功，0表示取消点赞成功
     */
    int toggleLike(Long postId, Long userId);
} 