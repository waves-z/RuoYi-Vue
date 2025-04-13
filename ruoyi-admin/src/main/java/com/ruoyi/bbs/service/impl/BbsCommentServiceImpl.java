package com.ruoyi.bbs.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bbs.mapper.BbsCommentMapper;
import com.ruoyi.bbs.domain.BbsComment;
import com.ruoyi.bbs.service.IBbsCommentService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;

/**
 * 帖子评论Service业务层处理
 */
@Service
public class BbsCommentServiceImpl implements IBbsCommentService {
    @Autowired
    private BbsCommentMapper bbsCommentMapper;

    /**
     * 查询帖子评论
     */
    @Override
    public BbsComment selectBbsCommentById(Long commentId) {
        return bbsCommentMapper.selectBbsCommentById(commentId);
    }

    /**
     * 查询帖子评论列表
     */
    @Override
    public List<BbsComment> selectBbsCommentList(BbsComment bbsComment) {
        return bbsCommentMapper.selectBbsCommentList(bbsComment);
    }

    /**
     * 新增帖子评论
     */
    @Override
    public int insertBbsComment(BbsComment bbsComment) {
        bbsComment.setCreateTime(DateUtils.getNowDate());
        return bbsCommentMapper.insertBbsComment(bbsComment);
    }

    /**
     * 修改帖子评论
     */
    @Override
    public int updateBbsComment(BbsComment bbsComment) {
        bbsComment.setUpdateTime(DateUtils.getNowDate());
        return bbsCommentMapper.updateBbsComment(bbsComment);
    }

    /**
     * 批量删除帖子评论
     */
    @Override
    public int deleteBbsCommentByIds(Long[] commentIds) {
        return bbsCommentMapper.deleteBbsCommentByIds(commentIds);
    }

    /**
     * 删除帖子评论信息
     */
    @Override
    public int deleteBbsCommentById(Long commentId) {
        return bbsCommentMapper.deleteBbsCommentById(commentId);
    }

    /**
     * 更新评论状态
     */
    @Override
    public int updateCommentStatus(Long commentId, String status) {
        return bbsCommentMapper.updateCommentStatus(commentId, status, SecurityUtils.getUsername());
    }
} 