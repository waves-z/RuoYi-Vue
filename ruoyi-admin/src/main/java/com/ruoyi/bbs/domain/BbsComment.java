package com.ruoyi.bbs.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 帖子评论对象 bbs_comment
 */
public class BbsComment extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 评论ID */
    private Long commentId;

    /** 帖子ID */
    @Excel(name = "帖子ID")
    private Long postId;

    /** 父评论ID */
    @Excel(name = "父评论ID")
    private Long parentId;

    /** 评论内容 */
    @Excel(name = "评论内容")
    private String content;

    /** 评论人ID */
    @Excel(name = "评论人ID")
    private Long userId;

    /** 评论人名称 */
    @Excel(name = "评论人名称")
    private String userName;

    /** 点赞数 */
    @Excel(name = "点赞数")
    private Long likeCount;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Long getPostId() {
        return postId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() {
        return likeCount;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("commentId", getCommentId())
            .append("postId", getPostId())
            .append("parentId", getParentId())
            .append("content", getContent())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("likeCount", getLikeCount())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("status", getStatus())
            .toString();
    }
} 