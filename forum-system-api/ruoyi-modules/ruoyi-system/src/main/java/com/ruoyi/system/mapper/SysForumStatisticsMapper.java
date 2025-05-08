package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumStatistics;

/**
 * 论坛统计数据Mapper接口
 */
public interface SysForumStatisticsMapper 
{
    /**
     * 查询统计数据列表
     * 
     * @param statistics 统计数据信息
     * @return 统计数据集合
     */
    @Select({
        "<script>",
        "select * from sys_forum_statistics",
        "where del_flag = '0'",
        "<if test='userId != null'>and user_id = #{userId}</if>",
        "<if test='type != null'>and type = #{type}</if>",
        "order by update_time desc",
        "</script>"
    })
    public List<SysForumStatistics> selectStatisticsList(SysForumStatistics statistics);

    /**
     * 查询统计数据详细信息
     * 
     * @param id 统计数据ID
     * @return 统计数据信息
     */
    @Select("select * from sys_forum_statistics where id = #{id} and del_flag = '0'")
    public SysForumStatistics selectStatisticsById(Long id);

    /**
     * 新增统计数据
     * 
     * @param statistics 统计数据信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_statistics (",
        "user_id, type, post_count, comment_count, like_count, view_count, create_time, update_time, del_flag",
        ") values (",
        "#{userId}, #{type}, #{postCount}, #{commentCount}, #{likeCount}, #{viewCount}, sysdate(), sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertStatistics(SysForumStatistics statistics);

    /**
     * 修改统计数据
     * 
     * @param statistics 统计数据信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_statistics",
        "<set>",
        "<if test='postCount != null'>post_count = #{postCount},</if>",
        "<if test='commentCount != null'>comment_count = #{commentCount},</if>",
        "<if test='likeCount != null'>like_count = #{likeCount},</if>",
        "<if test='viewCount != null'>view_count = #{viewCount},</if>",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updateStatistics(SysForumStatistics statistics);

    /**
     * 删除统计数据
     * 
     * @param id 统计数据ID
     * @return 结果
     */
    @Update("update sys_forum_statistics set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deleteStatisticsById(Long id);

    /**
     * 批量删除统计数据
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_statistics set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deleteStatisticsByIds(Long[] ids);

    /**
     * 获取用户统计数据
     * 
     * @param userId 用户ID
     * @return 用户统计数据
     */
    @Select("select * from sys_forum_statistics where user_id = #{userId}  and del_flag = '0'")
    public SysForumStatistics selectUserStatistics(Long userId);

    /**
     * 获取论坛整体统计数据
     * 
     * @return 论坛统计数据
     */
    @Select("select * from sys_forum_statistics where type = 'forum' and del_flag = '0'")
    public SysForumStatistics selectForumStatistics();

    /**
     * 更新用户发帖计数
     * 
     * @param userId 用户ID
     * @param count 增减数量(正数为增加，负数为减少)
     * @return 结果
     */
    @Update("update sys_forum_statistics set post_count = post_count + #{count}, update_time = sysdate() where user_id = #{userId} and type = 'user' and del_flag = '0'")
    public int updateUserPostCount(@Param("userId") Long userId, @Param("count") int count);

    /**
     * 更新用户评论计数
     * 
     * @param userId 用户ID
     * @param count 增减数量(正数为增加，负数为减少)
     * @return 结果
     */
    @Update("update sys_forum_statistics set comment_count = comment_count + #{count}, update_time = sysdate() where user_id = #{userId} and type = 'user' and del_flag = '0'")
    public int updateUserCommentCount(@Param("userId") Long userId, @Param("count") int count);

    /**
     * 更新用户点赞计数
     * 
     * @param userId 用户ID
     * @param count 增减数量(正数为增加，负数为减少)
     * @return 结果
     */
    @Update("update sys_forum_statistics set like_count = like_count + #{count}, update_time = sysdate() where user_id = #{userId} and type = 'user' and del_flag = '0'")
    public int updateUserLikeCount(@Param("userId") Long userId, @Param("count") int count);

    /**
     * 更新论坛整体统计数据
     * 
     * @param field 字段名称(post_count/comment_count/like_count/view_count)
     * @param count 增减数量(正数为增加，负数为减少)
     * @return 结果
     */
    @Update("update sys_forum_statistics set ${field} = ${field} + #{count}, update_time = sysdate() where type = 'forum' and del_flag = '0'")
    public int updateForumStatistics(@Param("field") String field, @Param("count") int count);
} 