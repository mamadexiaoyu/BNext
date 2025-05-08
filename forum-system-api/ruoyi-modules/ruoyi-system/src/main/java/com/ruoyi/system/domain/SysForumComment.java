package com.ruoyi.system.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 论坛评论对象 sys_forum_comment
 */
public class SysForumComment extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 评论ID
     */
    private Long id;

    /**
     * 帖子ID
     */
    @Excel(name = "帖子ID")
    private Long postId;

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
     * 用户头像
     */
    private String avatar;

    /**
     * 评论内容
     */
    @Excel(name = "评论内容")
    private String content;

    /**
     * 点赞次数
     */
    @Excel(name = "点赞次数")
    private Long likeCount;

    /**
     * 父评论ID，如果为0表示是顶层评论
     */
    private Long parentId;

    /**
     * 回复的用户ID
     */
    private Long replyUserId;

    /**
     * 回复的用户昵称
     */
    private String replyUserName;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

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

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() {
        return likeCount;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setReplyUserId(Long replyUserId) {
        this.replyUserId = replyUserId;
    }

    public Long getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserName(String replyUserName) {
        this.replyUserName = replyUserName;
    }

    public String getReplyUserName() {
        return replyUserName;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("postId", getPostId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("avatar", getAvatar())
                .append("content", getContent())
                .append("likeCount", getLikeCount())
                .append("parentId", getParentId())
                .append("replyUserId", getReplyUserId())
                .append("replyUserName", getReplyUserName())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
} 