package com.ruoyi.bbs.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bbs.mapper.BbsLikeMapper;
import com.ruoyi.bbs.domain.BbsLike;
import com.ruoyi.bbs.service.IBbsLikeService;
import com.ruoyi.common.utils.DateUtils;

/**
 * 点赞Service业务层处理
 */
@Service
public class BbsLikeServiceImpl implements IBbsLikeService {
    @Autowired
    private BbsLikeMapper bbsLikeMapper;

    /**
     * 查询点赞
     */
    @Override
    public BbsLike selectBbsLikeById(Long id) {
        return bbsLikeMapper.selectBbsLikeById(id);
    }

    /**
     * 查询点赞列表
     */
    @Override
    public List<BbsLike> selectBbsLikeList(BbsLike bbsLike) {
        return bbsLikeMapper.selectBbsLikeList(bbsLike);
    }

    /**
     * 新增点赞
     */
    @Override
    public int insertBbsLike(BbsLike bbsLike) {
        bbsLike.setCreateTime(DateUtils.getNowDate());
        return bbsLikeMapper.insertBbsLike(bbsLike);
    }

    /**
     * 删除点赞
     */
    @Override
    public int deleteBbsLike(BbsLike bbsLike) {
        return bbsLikeMapper.deleteLike(bbsLike.getPostId(), bbsLike.getUserId());
    }

    /**
     * 查询点赞状态
     */
    @Override
    public boolean checkLikeStatus(Long userId, Long postId, Long commentId) {
        int count = bbsLikeMapper.checkLike(postId, userId);
        return count > 0;
    }

    /**
     * 切换点赞状态
     */
    @Override
    public int toggleLike(Long postId, Long userId) {
        // 检查是否已经点赞
        int count = bbsLikeMapper.checkLike(postId, userId);
        if (count > 0) {
            // 已点赞，取消点赞
            bbsLikeMapper.deleteLike(postId, userId);
            return 0;
        } else {
            // 未点赞，添加点赞
            BbsLike like = new BbsLike();
            like.setPostId(postId);
            like.setUserId(userId);
            bbsLikeMapper.insertBbsLike(like);
            return 1;
        }
    }
} 