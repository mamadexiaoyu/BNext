package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysForumPost;

import java.util.List;

/**
 * 论坛帖子服务接口
 */
public interface ISysForumPostService {
    /**
     * 查询帖子列表
     *
     * @param post 帖子信息
     * @return 帖子集合
     */
    public List<SysForumPost> selectPostList(SysForumPost post);

    /**
     * 查询帖子详细信息
     *
     * @param id 帖子ID
     * @return 帖子信息
     */
    public SysForumPost selectPostById(Long id);

    /**
     * 新增帖子
     *
     * @param post 帖子信息
     * @return 结果
     */
    public int insertPost(SysForumPost post);

    /**
     * 修改帖子
     *
     * @param post 帖子信息
     * @return 结果
     */
    public int updatePost(SysForumPost post);

    /**
     * 批量删除帖子
     *
     * @param ids 需要删除的帖子ID
     * @return 结果
     */
    public int deletePostByIds(Long[] ids);

    /**
     * 删除帖子信息
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int deletePostById(Long id);

    /**
     * 增加浏览量
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int incrementViewCount(Long id);

    /**
     * 增加点赞数
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int incrementLikeCount(Long id);

    /**
     * 减少点赞数
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int decrementLikeCount(Long id);

    /**
     * 增加评论数
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int incrementCommentCount(Long id);

    /**
     * 减少评论数
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int decrementCommentCount(Long id);

    /**
     * 置顶帖子
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int setTop(Long id);

    /**
     * 取消置顶
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int cancelTop(Long id);

    /**
     * 加精帖子
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int setEssence(Long id);

    /**
     * 取消加精
     *
     * @param id 帖子ID
     * @return 结果
     */
    public int cancelEssence(Long id);

    /**
     * 收藏帖子
     *
     * @param id     帖子ID
     * @param userId 用户ID
     * @return 结果
     */
    public int collectPost(Long id, Long userId);

    /**
     * 取消收藏
     *
     * @param id     帖子ID
     * @param userId 用户ID
     * @return 结果
     */
    public int uncollectPost(Long id, Long userId);

    /**
     * 查询用户发布的帖子列表
     *
     * @param userId 用户ID
     * @return 帖子集合
     */
    public List<SysForumPost> selectUserPosts(Long userId);

    /**
     * 查询用户收藏的帖子列表
     *
     * @param userId 用户ID
     * @return 帖子集合
     */
    public List<SysForumPost> selectUserCollectPosts(Long userId);

    /**
     * 查询热门帖子列表
     *
     * @param limit 查询数量
     * @return 帖子集合
     */
    public List<SysForumPost> selectHotPosts(int limit);

    /**
     * 查询最新帖子列表
     *
     * @param limit 查询数量
     * @return 帖子集合
     */
    public List<SysForumPost> selectLatestPosts(int limit);

    /**
     * 查询精华帖子列表
     *
     * @param limit 查询数量
     * @return 帖子集合
     */
    public List<SysForumPost> selectEssencePosts(int limit);
}