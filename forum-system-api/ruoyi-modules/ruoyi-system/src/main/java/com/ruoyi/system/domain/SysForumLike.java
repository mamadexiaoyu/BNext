package com.ruoyi.system.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 论坛点赞对象 sys_forum_like
 */
public class SysForumLike extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 点赞ID
     */
    private Long id;

    /**
     * 用户ID
     */
    @Excel(name = "用户ID")
    private Long userId;

    /**
     * 点赞类型（0帖子 1评论）
     */
    @Excel(name = "点赞类型", readConverterExp = "0=帖子,1=评论")
    private String type;

    /**
     * 关联ID（帖子ID或评论ID）
     */
    @Excel(name = "关联ID")
    private Long targetId;

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

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    public Long getTargetId() {
        return targetId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("type", getType())
                .append("targetId", getTargetId())
                .append("createTime", getCreateTime())
                .toString();
    }
} 