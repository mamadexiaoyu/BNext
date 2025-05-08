package com.ruoyi.system.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 论坛统计数据对象 sys_forum_statistics
 */
public class SysForumStatistics extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 统计ID
     */
    private Long id;

    /**
     * 用户ID
     */
    @Excel(name = "用户ID")
    private Long userId;

    /**
     * 用户昵称
     */
    @Excel(name = "用户昵称")
    private String userName;

    /**
     * 帖子数量
     */
    @Excel(name = "帖子数量")
    private Long postCount;

    /**
     * 评论数量
     */
    @Excel(name = "评论数量")
    private Long commentCount;

    /**
     * 获得点赞数量
     */
    @Excel(name = "获得点赞数量")
    private Long likeCount;

    /**
     * 浏览量
     */
    @Excel(name = "浏览量")
    private Long viewCount;

    /**
     * 统计类型（0用户统计 1论坛总体统计）
     */
    @Excel(name = "统计类型", readConverterExp = "0=用户统计,1=论坛总体统计")
    private String type;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
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

    public void setPostCount(Long postCount) {
        this.postCount = postCount;
    }

    public Long getPostCount() {
        return postCount;
    }

    public void setCommentCount(Long commentCount) {
        this.commentCount = commentCount;
    }

    public Long getCommentCount() {
        return commentCount;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() {
        return likeCount;
    }

    public void setViewCount(Long viewCount) {
        this.viewCount = viewCount;
    }

    public Long getViewCount() {
        return viewCount;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("postCount", getPostCount())
                .append("commentCount", getCommentCount())
                .append("likeCount", getLikeCount())
                .append("viewCount", getViewCount())
                .append("type", getType())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
} 