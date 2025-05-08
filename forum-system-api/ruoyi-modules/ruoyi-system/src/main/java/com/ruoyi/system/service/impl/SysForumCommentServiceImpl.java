package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SysForumComment;
import com.ruoyi.system.mapper.SysForumCommentMapper;
import com.ruoyi.system.service.ISysForumCommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 论坛评论Service业务层处理
 */
@Service
public class SysForumCommentServiceImpl implements ISysForumCommentService {
    @Resource
    private SysForumCommentMapper commentMapper;

    /**
     * 查询评论列表
     *
     * @param comment 评论信息
     * @return 评论
     */
    @Override
    public List<SysForumComment> selectCommentList(SysForumComment comment) {
        return commentMapper.selectCommentList(comment);
    }

    /**
     * 查询评论详细信息
     *
     * @param id 评论ID
     * @return 评论
     */
    @Override
    public SysForumComment selectCommentById(Long id) {
        return commentMapper.selectCommentById(id);
    }

    /**
     * 新增评论
     *
     * @param comment 评论信息
     * @return 结果
     */
    @Override
    public int insertComment(SysForumComment comment) {
        return commentMapper.insertComment(comment);
    }

    /**
     * 修改评论
     *
     * @param comment 评论信息
     * @return 结果
     */
    @Override
    public int updateComment(SysForumComment comment) {
        return commentMapper.updateComment(comment);
    }

    /**
     * 批量删除评论
     *
     * @param ids 需要删除的评论ID
     * @return 结果
     */
    @Override
    public int deleteCommentByIds(Long[] ids) {
        return commentMapper.deleteCommentByIds(ids);
    }

    /**
     * 删除评论信息
     *
     * @param id 评论ID
     * @return 结果
     */
    @Override
    public int deleteCommentById(Long id) {
        return commentMapper.deleteCommentById(id);
    }

    /**
     * 增加点赞数
     *
     * @param id 评论ID
     * @return 结果
     */
    @Override
    public int incrementLikeCount(Long id) {
        return commentMapper.incrementLikeCount(id);
    }

    /**
     * 减少点赞数
     *
     * @param id 评论ID
     * @return 结果
     */
    @Override
    public int decrementLikeCount(Long id) {
        return commentMapper.decrementLikeCount(id);
    }

    /**
     * 获取帖子的评论列表
     *
     * @param postId 帖子ID
     * @return 评论列表
     */
    @Override
    public List<SysForumComment> selectCommentsByPostId(Long postId) {
        return commentMapper.selectCommentsByPostId(postId);
    }

    /**
     * 获取评论的回复列表
     *
     * @param commentId 评论ID
     * @return 回复列表
     */
    @Override
    public List<SysForumComment> selectRepliesByCommentId(Long commentId) {
        return commentMapper.selectRepliesByCommentId(commentId);
    }
    

} 