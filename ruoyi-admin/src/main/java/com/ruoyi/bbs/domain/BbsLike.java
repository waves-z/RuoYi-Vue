package com.ruoyi.bbs.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 帖子点赞对象 bbs_like
 */
public class BbsLike extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 点赞ID */
    private Long id;

    /** 帖子ID */
    @Excel(name = "帖子ID")
    private Long postId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Long getPostId() {
        return postId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("postId", getPostId())
            .append("userId", getUserId())
            .append("createTime", getCreateTime())
            .toString();
    }
} 