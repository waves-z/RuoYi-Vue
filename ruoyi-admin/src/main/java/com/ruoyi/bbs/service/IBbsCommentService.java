package com.ruoyi.bbs.service;

import java.util.List;
import com.ruoyi.bbs.domain.BbsComment;

/**
 * 帖子评论Service接口
 */
public interface IBbsCommentService {
    /**
     * 查询帖子评论列表
     */
    public List<BbsComment> selectBbsCommentList(BbsComment bbsComment);

    /**
     * 查询帖子评论
     */
    public BbsComment selectBbsCommentById(Long commentId);

    /**
     * 新增帖子评论
     */
    public int insertBbsComment(BbsComment bbsComment);

    /**
     * 修改帖子评论
     */
    public int updateBbsComment(BbsComment bbsComment);

    /**
     * 删除帖子评论
     */
    public int deleteBbsCommentById(Long commentId);

    /**
     * 批量删除帖子评论
     */
    public int deleteBbsCommentByIds(Long[] commentIds);

    /**
     * 更新评论状态
     */
    public int updateCommentStatus(Long commentId, String status);
} 