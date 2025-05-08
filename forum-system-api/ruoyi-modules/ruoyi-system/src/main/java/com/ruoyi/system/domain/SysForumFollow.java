package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 论坛用户关注对象 sys_forum_follow
 */
public class SysForumFollow extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关注ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 被关注用户ID */
    @Excel(name = "被关注用户ID")
    private Long followUserId;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String userName;

    /** 用户头像 */
    private String avatar;

    /** 被关注用户昵称 */
    @Excel(name = "被关注用户昵称")
    private String followUserName;

    /** 被关注用户头像 */
    private String followUserAvatar;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setFollowUserId(Long followUserId) 
    {
        this.followUserId = followUserId;
    }

    public Long getFollowUserId() 
    {
        return followUserId;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    
    public String getUserName() 
    {
        return userName;
    }

    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getAvatar() 
    {
        return avatar;
    }

    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getFollowUserName() 
    {
        return followUserName;
    }

    public void setFollowUserName(String followUserName) 
    {
        this.followUserName = followUserName;
    }

    public String getFollowUserAvatar() 
    {
        return followUserAvatar;
    }

    public void setFollowUserAvatar(String followUserAvatar) 
    {
        this.followUserAvatar = followUserAvatar;
    }
} 