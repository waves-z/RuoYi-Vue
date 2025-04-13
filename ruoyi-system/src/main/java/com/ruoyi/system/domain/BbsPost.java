package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 帖子对象 bbs_post
 */
public class BbsPost extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 帖子ID */
    private Long postId;

    /** 帖子标题 */
    @Excel(name = "帖子标题")
    private String postTitle;

    /** 帖子内容 */
    @Excel(name = "帖子内容")
    private String postContent;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Long categoryId;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    /** 作者ID */
    @Excel(name = "作者ID")
    private Long authorId;

    /** 作者名称 */
    @Excel(name = "作者名称")
    private String authorName;

    /** 状态（0已发布 1待审核 2审核不通过） */
    @Excel(name = "状态", readConverterExp = "0=已发布,1=待审核,2=审核不通过")
    private String status;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private Long viewCount;

    /** 点赞数 */
    @Excel(name = "点赞数")
    private Long likeCount;

    /** 评论数 */
    @Excel(name = "评论数")
    private Long commentCount;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 是否是管理员 */
    @JsonIgnore
    private Boolean isAdmin;

    /** 当前用户ID */
    @JsonIgnore
    private Long userId;

    /** 排序字段 */
    @JsonIgnore
    private String orderByColumn;

    /** 排序方向 */
    @JsonIgnore
    private String isAsc;

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Long authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getViewCount() {
        return viewCount;
    }

    public void setViewCount(Long viewCount) {
        this.viewCount = viewCount;
    }

    public Long getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    public Long getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Long commentCount) {
        this.commentCount = commentCount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOrderByColumn() {
        return orderByColumn;
    }

    public void setOrderByColumn(String orderByColumn) {
        this.orderByColumn = orderByColumn;
    }

    public String getIsAsc() {
        return isAsc;
    }

    public void setIsAsc(String isAsc) {
        this.isAsc = isAsc;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
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
            .append("postId", getPostId())
            .append("postTitle", getPostTitle())
            .append("postContent", getPostContent())
            .append("categoryId", getCategoryId())
            .append("categoryName", getCategoryName())
            .append("authorId", getAuthorId())
            .append("authorName", getAuthorName())
            .append("status", getStatus())
            .append("viewCount", getViewCount())
            .append("likeCount", getLikeCount())
            .append("commentCount", getCommentCount())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
} 