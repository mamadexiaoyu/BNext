package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Transient;

import java.util.Date;

/**
 * 论坛帖子对象 sys_forum_post
 */
public class SysForumPost extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 帖子ID
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
     * 用户头像
     */
    @Transient
    private String avatar;

    /**
     * 帖子标题
     */
    @Excel(name = "帖子标题")
    private String title;

    /**
     * 帖子内容
     */
    @Excel(name = "帖子内容")
    private String content;

    /**
     * 帖子分类
     */
    @Excel(name = "帖子分类")
    private String category;

    /**
     * 帖子标签，多个用逗号分隔
     */
    private String tags;

    /**
     * 帖子图片，多个用逗号分隔
     */
    private String images;

    /**
     * 浏览次数
     */
    @Excel(name = "浏览次数")
    private Long viewCount;

    /**
     * 点赞次数
     */
    @Excel(name = "点赞次数")
    private Long likeCount;

    /**
     * 评论次数
     */
    @Excel(name = "评论次数")
    private Long commentCount;

    /**
     * 是否置顶
     */
    @Excel(name = "是否置顶", readConverterExp = "0=否,1=是")
    private String isTop;

    /**
     * 是否精华
     */
    @Excel(name = "是否精华", readConverterExp = "0=否,1=是")
    private String isEssence;

    /**
     * 状态（0正常 1关闭）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=关闭")
    private String status;

    /**
     * 最后回复时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后回复时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastReplyTime;

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

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTags() {
        return tags;
    }


    public void setViewCount(Long viewCount) {
        this.viewCount = viewCount;
    }

    public Long getViewCount() {
        return viewCount;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() {
        return likeCount;
    }

    public void setCommentCount(Long commentCount) {
        this.commentCount = commentCount;
    }

    public Long getCommentCount() {
        return commentCount;
    }

    public void setIsTop(String isTop) {
        this.isTop = isTop;
    }

    public String getIsTop() {
        return isTop;
    }

    public void setIsEssence(String isEssence) {
        this.isEssence = isEssence;
    }

    public String getIsEssence() {
        return isEssence;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setLastReplyTime(Date lastReplyTime) {
        this.lastReplyTime = lastReplyTime;
    }

    public Date getLastReplyTime() {
        return lastReplyTime;
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
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("avatar", getAvatar())
                .append("title", getTitle())
                .append("content", getContent())
                .append("category", getCategory())
                .append("tags", getTags())
                .append("viewCount", getViewCount())
                .append("likeCount", getLikeCount())
                .append("commentCount", getCommentCount())
                .append("isTop", getIsTop())
                .append("isEssence", getIsEssence())
                .append("status", getStatus())
                .append("lastReplyTime", getLastReplyTime())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .append("delFlag", getDelFlag())
                .toString();
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getImages() {
        return images;
    }
} 