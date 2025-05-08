package com.ruoyi.system.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 论坛消息对象 sys_forum_message
 */
public class SysForumMessage extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 消息ID
     */
    private Long id;

    /**
     * 接收用户ID
     */
    @Excel(name = "接收用户ID")
    private Long userId;

    /**
     * 发送用户ID
     */
    @Excel(name = "发送用户ID")
    private Long fromUserId;

    /**
     * 发送用户昵称
     */
    @Excel(name = "发送用户昵称")
    private String fromUserName;

    /**
     * 消息类型（1评论 2点赞 3关注 4系统）
     */
    @Excel(name = "消息类型", readConverterExp = "1=评论,2=点赞,3=关注,4=系统")
    private String type;

    /**
     * 消息内容
     */
    @Excel(name = "消息内容")
    private String content;

    /**
     * 目标ID（帖子ID或评论ID）
     */
    @Excel(name = "目标ID")
    private Long targetId;

    /**
     * 是否已读（0未读 1已读）
     */
    @Excel(name = "是否已读", readConverterExp = "0=未读,1=已读")
    private String isRead;

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

    public void setFromUserId(Long fromUserId) {
        this.fromUserId = fromUserId;
    }

    public Long getFromUserId() {
        return fromUserId;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    public Long getTargetId() {
        return targetId;
    }

    public void setIsRead(String isRead) {
        this.isRead = isRead;
    }

    public String getIsRead() {
        return isRead;
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
                .append("fromUserId", getFromUserId())
                .append("fromUserName", getFromUserName())
                .append("type", getType())
                .append("content", getContent())
                .append("targetId", getTargetId())
                .append("isRead", getIsRead())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
} 