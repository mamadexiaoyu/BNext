package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 论坛收藏对象 sys_forum_collect
 */
public class SysForumCollect extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收藏ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 帖子ID */
    @Excel(name = "帖子ID")
    private Long postId;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String userName;

    /** 用户头像 */
    private String avatar;

    /** 帖子标题 */
    @Excel(name = "帖子标题")
    private String postTitle;
    
    /** 帖子内容 */
    private String postContent;
    
    /** 帖子浏览量 */
    private Long postViewCount;
    
    /** 帖子点赞量 */
    private Long postLikeCount;
    
    /** 帖子评论量 */
    private Long postCommentCount;
    
    /** 帖子作者昵称 */
    private String postUserName;
    
    /** 帖子作者头像 */
    private String postUserAvatar;

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
    public void setPostId(Long postId) 
    {
        this.postId = postId;
    }

    public Long getPostId() 
    {
        return postId;
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

    public String getPostTitle() 
    {
        return postTitle;
    }

    public void setPostTitle(String postTitle) 
    {
        this.postTitle = postTitle;
    }
    
    public String getPostContent() 
    {
        return postContent;
    }

    public void setPostContent(String postContent) 
    {
        this.postContent = postContent;
    }
    
    public Long getPostViewCount() 
    {
        return postViewCount;
    }

    public void setPostViewCount(Long postViewCount) 
    {
        this.postViewCount = postViewCount;
    }
    
    public Long getPostLikeCount() 
    {
        return postLikeCount;
    }

    public void setPostLikeCount(Long postLikeCount) 
    {
        this.postLikeCount = postLikeCount;
    }
    
    public Long getPostCommentCount() 
    {
        return postCommentCount;
    }

    public void setPostCommentCount(Long postCommentCount) 
    {
        this.postCommentCount = postCommentCount;
    }
    
    public String getPostUserName() 
    {
        return postUserName;
    }

    public void setPostUserName(String postUserName) 
    {
        this.postUserName = postUserName;
    }
    
    public String getPostUserAvatar() 
    {
        return postUserAvatar;
    }

    public void setPostUserAvatar(String postUserAvatar) 
    {
        this.postUserAvatar = postUserAvatar;
    }
} 