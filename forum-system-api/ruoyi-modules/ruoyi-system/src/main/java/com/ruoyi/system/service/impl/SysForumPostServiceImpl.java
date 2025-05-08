package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SysForumPost;
import com.ruoyi.system.mapper.SysForumPostMapper;
import com.ruoyi.system.service.ISysForumPostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 论坛帖子Service业务层处理
 */
@Service
public class SysForumPostServiceImpl implements ISysForumPostService {
    @Resource
    private SysForumPostMapper postMapper;

    @Override
    public List<SysForumPost> selectPostList(SysForumPost post) {
        return postMapper.selectPostList(post);
    }

    @Override
    public SysForumPost selectPostById(Long id) {
        return postMapper.selectPostById(id);
    }

    @Override
    public int insertPost(SysForumPost post) {
        return postMapper.insertPost(post);
    }

    @Override
    public int updatePost(SysForumPost post) {
        return postMapper.updatePost(post);
    }

    @Override
    public int deletePostByIds(Long[] ids) {
        return postMapper.deletePostByIds(ids);
    }

    @Override
    public int deletePostById(Long id) {
        return postMapper.deletePostById(id);
    }

    @Override
    public int incrementViewCount(Long id) {
        return postMapper.incrementViewCount(id);
    }

    @Override
    public int incrementLikeCount(Long id) {
        return postMapper.incrementLikeCount(id);
    }

    @Override
    public int decrementLikeCount(Long id) {
        return postMapper.decrementLikeCount(id);
    }

    @Override
    public int incrementCommentCount(Long id) {
        return postMapper.incrementCommentCount(id);
    }

    @Override
    public int decrementCommentCount(Long id) {
        return postMapper.decrementCommentCount(id);
    }

    @Override
    public int setTop(Long id) {
        return postMapper.setTop(id);
    }

    @Override
    public int cancelTop(Long id) {
        return postMapper.cancelTop(id);
    }

    @Override
    public int setEssence(Long id) {
        return postMapper.setEssence(id);
    }

    @Override
    public int cancelEssence(Long id) {
        return postMapper.cancelEssence(id);
    }

    @Override
    public int collectPost(Long id, Long userId) {
        return postMapper.collectPost(id, userId);
    }

    @Override
    public int uncollectPost(Long id, Long userId) {
        return postMapper.uncollectPost(id, userId);
    }

    @Override
    public List<SysForumPost> selectUserPosts(Long userId) {
        return postMapper.selectUserPosts(userId);
    }

    @Override
    public List<SysForumPost> selectUserCollectPosts(Long userId) {
        return postMapper.selectUserCollectPosts(userId);
    }

    @Override
    public List<SysForumPost> selectHotPosts(int limit) {
        return postMapper.selectHotPosts(limit);
    }

    @Override
    public List<SysForumPost> selectLatestPosts(int limit) {
        return postMapper.selectLatestPosts(limit);
    }

    @Override
    public List<SysForumPost> selectEssencePosts(int limit) {
        return postMapper.selectEssencePosts(limit);
    }
}