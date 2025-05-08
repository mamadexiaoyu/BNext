package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysForumComment;

/**
 * 论坛评论Service接口
 */
public interface ISysForumCommentService 
{
    /**
     * 查询评论列表
     * 
     * @param comment 评论信息
     * @return 评论集合
     */
    public List<SysForumComment> selectCommentList(SysForumComment comment);

    /**
     * 查询评论详细信息
     * 
     * @param id 评论ID
     * @return 评论信息
     */
    public SysForumComment selectCommentById(Long id);

    /**
     * 新增评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
    public int insertComment(SysForumComment comment);

    /**
     * 修改评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
    public int updateComment(SysForumComment comment);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论ID
     * @return 结果
     */
    public int deleteCommentByIds(Long[] ids);

    /**
     * 删除评论信息
     * 
     * @param id 评论ID
     * @return 结果
     */
    public int deleteCommentById(Long id);

    /**
     * 增加点赞数
     * 
     * @param id 评论ID
     * @return 结果
     */
    public int incrementLikeCount(Long id);

    /**
     * 减少点赞数
     * 
     * @param id 评论ID
     * @return 结果
     */
    public int decrementLikeCount(Long id);

    /**
     * 获取帖子的评论列表
     * 
     * @param postId 帖子ID
     * @return 评论列表
     */
    public List<SysForumComment> selectCommentsByPostId(Long postId);

    /**
     * 获取评论的回复列表
     * 
     * @param commentId 评论ID
     * @return 回复列表
     */
    public List<SysForumComment> selectRepliesByCommentId(Long commentId);
} 