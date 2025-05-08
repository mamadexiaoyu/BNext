package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumLike;

/**
 * 论坛点赞Mapper接口
 */
public interface SysForumLikeMapper 
{
    /**
     * 查询点赞列表
     * 
     * @param like 点赞信息
     * @return 点赞集合
     */
    @Select({
        "<script>",
        "select l.*, u.nick_name as userName, u.avatar",
        "from sys_forum_like l",
        "left join sys_user u on l.user_id = u.user_id",
        "where l.del_flag = '0'",
        "<if test='userId != null'>and l.user_id = #{userId}</if>",
        "<if test='type != null'>and l.type = #{type}</if>",
        "<if test='targetId != null'>and l.target_id = #{targetId}</if>",
        "order by l.create_time desc",
        "</script>"
    })
    public List<SysForumLike> selectLikeList(SysForumLike like);

    /**
     * 查询点赞详细信息
     * 
     * @param id 点赞ID
     * @return 点赞信息
     */
    @Select({
        "select l.*, u.nick_name as userName, u.avatar",
        "from sys_forum_like l",
        "left join sys_user u on l.user_id = u.user_id",
        "where l.id = #{id} and l.del_flag = '0'"
    })
    public SysForumLike selectLikeById(Long id);

    /**
     * 新增点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_like (",
        "user_id, type, target_id, create_time, update_time, del_flag",
        ") values (",
        "#{userId}, #{type}, #{targetId}, sysdate(), sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertLike(SysForumLike like);

    /**
     * 修改点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_like",
        "<set>",
        "<if test='type != null'>type = #{type},</if>",
        "<if test='targetId != null'>target_id = #{targetId},</if>",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updateLike(SysForumLike like);

    /**
     * 删除点赞
     * 
     * @param id 点赞ID
     * @return 结果
     */
    @Update("update sys_forum_like set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deleteLikeById(Long id);

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_like set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deleteLikeByIds(Long[] ids);

    /**
     * 检查用户是否点赞过
     * 
     * @param userId 用户ID
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 点赞数量
     */
    @Select("select count(*) from sys_forum_like where user_id = #{userId} and type = #{type} and target_id = #{targetId} and del_flag = '0'")
    public int hasLiked(@Param("userId") Long userId, @Param("type") String type, @Param("targetId") Long targetId);

    /**
     * 获取目标点赞数量
     * 
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 点赞数量
     */
    @Select("select count(*) from sys_forum_like where type = #{type} and target_id = #{targetId} and del_flag = '0'")
    public int getLikeCount(@Param("type") String type, @Param("targetId") Long targetId);

    /**
     * 检查用户是否点赞过
     * 
     * @param userId 用户ID
     * @param type 点赞类型（0:帖子, 1:评论）
     * @param targetId 目标ID
     * @return 点赞信息
     */
    @Select("select * from sys_forum_like where user_id = #{userId} and type = #{type} and target_id = #{targetId} and del_flag = '0'")
    public SysForumLike checkUserLike(@Param("userId") Long userId, @Param("type") Integer type, @Param("targetId") Long targetId);

    /**
     * 删除用户对特定目标的点赞
     * 
     * @param userId 用户ID
     * @param type 点赞类型（0:帖子, 1:评论）
     * @param targetId 目标ID
     * @return 结果
     */
    @Update("update sys_forum_like set del_flag = '2', update_time = sysdate() where user_id = #{userId} and type = #{type} and target_id = #{targetId}")
    public int deleteLikeByUserAndTarget(@Param("userId") Long userId, @Param("type") Integer type, @Param("targetId") Long targetId);

    /**
     * 获取用户的点赞列表
     * 
     * @param userId 用户ID
     * @param type 点赞类型（0:帖子, 1:评论）
     * @return 点赞列表
     */
    @Select("select * from sys_forum_like where user_id = #{userId} and type = #{type} and del_flag = '0'")
    public List<SysForumLike> selectUserLikes(@Param("userId") Long userId, @Param("type") Integer type);
} 