package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumComment;

/**
 * 论坛评论Mapper接口
 */
public interface SysForumCommentMapper 
{
    /**
     * 查询评论列表
     * 
     * @param comment 评论信息
     * @return 评论集合
     */
    @Select({
        "<script>",
        "select c.*, u.nick_name as userName, u.avatar, ru.nick_name as replyUserName",
        "from sys_forum_comment c",
        "left join sys_user u on c.user_id = u.user_id",
        "left join sys_user ru on c.reply_user_id = ru.user_id",
        "where c.del_flag = '0'",
        "<if test='postId != null'>and c.post_id = #{postId}</if>",
        "<if test='userId != null'>and c.user_id = #{userId}</if>",
        "<if test='content != null and content != \"\"'>and c.content like concat('%', #{content}, '%')</if>",
        "<if test='parentId != null'>and c.parent_id = #{parentId}</if>",
        "order by c.create_time desc",
        "</script>"
    })
    public List<SysForumComment> selectCommentList(SysForumComment comment);

    /**
     * 查询评论详细信息
     * 
     * @param id 评论ID
     * @return 评论信息
     */
    @Select({
        "select c.*, u.nick_name as userName, u.avatar, ru.nick_name as replyUserName",
        "from sys_forum_comment c",
        "left join sys_user u on c.user_id = u.user_id",
        "left join sys_user ru on c.reply_user_id = ru.user_id",
        "where c.id = #{id} and c.del_flag = '0'"
    })
    public SysForumComment selectCommentById(Long id);

    /**
     * 新增评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_comment (",
        "post_id, user_id, content, like_count, parent_id, reply_user_id, create_time, update_time, del_flag",
        ") values (",
        "#{postId}, #{userId}, #{content}, 0, #{parentId}, #{replyUserId}, sysdate(), sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertComment(SysForumComment comment);

    /**
     * 修改评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_comment",
        "<set>",
        "<if test='content != null'>content = #{content},</if>",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updateComment(SysForumComment comment);

    /**
     * 删除评论
     * 
     * @param id 评论ID
     * @return 结果
     */
    @Update("update sys_forum_comment set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deleteCommentById(Long id);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_comment set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deleteCommentByIds(Long[] ids);

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
    public List<SysForumComment> selectCommentsByPostId(@Param("postId") Long postId);
    /**
     * 获取评论的回复列表
     * 
     * @param commentId 评论ID
     * @return 回复列表
     */
    public List<SysForumComment> selectRepliesByCommentId(Long commentId);
} 