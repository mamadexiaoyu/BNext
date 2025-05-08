package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumPost;

/**
 * 论坛帖子Mapper接口
 */
public interface SysForumPostMapper 
{
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
    @Select({
        "select p.*, u.nick_name as userName, u.avatar,u.user_id as userId",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "where p.id = #{id} and p.del_flag = '0'"
    })
    public SysForumPost selectPostById(Long id);

    /**
     * 新增帖子
     * 
     * @param post 帖子信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_post (",
        "user_id, title, content, category, tags, images, ",
        "view_count, like_count, comment_count, ",
        "is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag",
        ") values (",
        "#{userId}, #{title}, #{content}, #{category}, #{tags}, #{images}, ",
        "0, 0, 0, ",
        "'0', '0', '0', #{createBy}, sysdate(), #{updateBy}, sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertPost(SysForumPost post);

    /**
     * 修改帖子
     * 
     * @param post 帖子信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_post",
        "<set>",
        "<if test='title != null'>title = #{title},</if>",
        "<if test='content != null'>content = #{content},</if>",
        "<if test='category != null'>category = #{category},</if>",
        "<if test='tags != null'>tags = #{tags},</if>",
        "<if test='images != null'>images = #{images},</if>",
        "<if test='status != null'>status = #{status},</if>",
        "update_by = #{updateBy},",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updatePost(SysForumPost post);

    /**
     * 删除帖子
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deletePostById(Long id);

    /**
     * 批量删除帖子
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_post set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deletePostByIds(Long[] ids);

    /**
     * 增加浏览量
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set view_count = view_count + 1 where id = #{id}")
    public int incrementViewCount(Long id);

    /**
     * 增加点赞数
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set like_count = like_count + 1 where id = #{id}")
    public int incrementLikeCount(Long id);

    /**
     * 减少点赞数
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set like_count = like_count - 1 where id = #{id} and like_count > 0")
    public int decrementLikeCount(Long id);

    /**
     * 增加评论数
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set comment_count = comment_count + 1, last_reply_time = sysdate() where id = #{id}")
    public int incrementCommentCount(Long id);

    /**
     * 减少评论数
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set comment_count = comment_count - 1 where id = #{id} and comment_count > 0")
    public int decrementCommentCount(Long id);

    /**
     * 置顶帖子
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set is_top = '1' where id = #{id}")
    public int setTop(Long id);

    /**
     * 取消置顶
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set is_top = '0' where id = #{id}")
    public int cancelTop(Long id);

    /**
     * 加精帖子
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set is_essence = '1' where id = #{id}")
    public int setEssence(Long id);

    /**
     * 取消加精
     * 
     * @param id 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_post set is_essence = '0' where id = #{id}")
    public int cancelEssence(Long id);

    /**
     * 收藏帖子
     * 
     * @param id 帖子ID
     * @param userId 用户ID
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_collect (",
        "post_id, user_id, create_time, update_time, del_flag",
        ") values (",
        "#{id}, #{userId}, sysdate(), sysdate(), '0'",
        ")"
    })
    public int collectPost(@Param("id") Long id, @Param("userId") Long userId);

    /**
     * 取消收藏帖子
     * 
     * @param id 帖子ID
     * @param userId 用户ID
     * @return 结果
     */
    @Update("update sys_forum_collect set del_flag = '2', update_time = sysdate() where post_id = #{id} and user_id = #{userId} and del_flag = '0'")
    public int uncollectPost(@Param("id") Long id, @Param("userId") Long userId);

    /**
     * 查询用户发布的帖子
     * 
     * @param userId 用户ID
     * @return 帖子列表
     */
    @Select({
        "select p.*, u.nick_name as userName, u.avatar",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "where p.user_id = #{userId} and p.del_flag = '0'",
        "order by p.create_time desc"
    })
    public List<SysForumPost> selectUserPosts(Long userId);

    /**
     * 查询用户收藏的帖子
     * 
     * @param userId 用户ID
     * @return 帖子列表
     */
    @Select({
        "select p.*, u.nick_name as userName, u.avatar",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "inner join sys_forum_collect c on p.id = c.post_id",
        "where c.user_id = #{userId} and c.del_flag = '0' and p.del_flag = '0'",
        "order by c.create_time desc"
    })
    public List<SysForumPost> selectUserCollectPosts(Long userId);

    /**
     * 查询热门帖子
     * 
     * @param limit 限制数量
     * @return 帖子列表
     */
    @Select({
        "select p.*, u.nick_name as userName, u.avatar",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "where p.del_flag = '0'",
        "order by p.view_count desc, p.like_count desc, p.create_time desc",
        "limit #{limit}"
    })
    public List<SysForumPost> selectHotPosts(int limit);

    /**
     * 查询最新帖子
     * 
     * @param limit 限制数量
     * @return 帖子列表
     */
    @Select({
        "select p.*, u.nick_name as userName, u.avatar",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "where p.del_flag = '0'",
        "order by p.create_time desc",
        "limit #{limit}"
    })
    public List<SysForumPost> selectLatestPosts(int limit);

    /**
     * 查询精华帖子
     * 
     * @param limit 限制数量
     * @return 帖子列表
     */
    @Select({
        "select p.*, u.nick_name as userName, u.avatar",
        "from sys_forum_post p",
        "left join sys_user u on p.user_id = u.user_id",
        "where p.del_flag = '0' and p.is_essence = '1'",
        "order by p.create_time desc",
        "limit #{limit}"
    })
    public List<SysForumPost> selectEssencePosts(int limit);
} 