package com.ruoyi.bbs.mapper;

import java.util.List;
import com.ruoyi.bbs.domain.BbsComment;

/**
 * 帖子评论Mapper接口
 */
public interface BbsCommentMapper {
    /**
     * 查询帖子评论
     */
    public BbsComment selectBbsCommentById(Long commentId);

    /**
     * 查询帖子评论列表
     */
    public List<BbsComment> selectBbsCommentList(BbsComment bbsComment);

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
     * 更新评论点赞数
     */
    public int updateCommentLikeCount(Long commentId);

    /**
     * 更新评论状态
     */
    public int updateCommentStatus(Long commentId, String status, String updateBy);
} 