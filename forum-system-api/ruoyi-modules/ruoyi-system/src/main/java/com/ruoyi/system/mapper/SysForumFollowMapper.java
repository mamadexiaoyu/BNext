package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumFollow;

/**
 * 论坛用户关注Mapper接口
 */
public interface SysForumFollowMapper 
{
    /**
     * 查询关注列表
     * 
     * @param follow 关注信息
     * @return 关注集合
     */
    @Select({
        "<script>",
        "select f.*, u.nick_name as userName, u.avatar, fu.nick_name as followUserName, fu.avatar as followUserAvatar",
        "from sys_forum_follow f",
        "left join sys_user u on f.user_id = u.user_id",
        "left join sys_user fu on f.follow_user_id = fu.user_id",
        "where f.del_flag = '0'",
        "<if test='userId != null'>and f.user_id = #{userId}</if>",
        "<if test='followUserId != null'>and f.follow_user_id = #{followUserId}</if>",
        "order by f.create_time desc",
        "</script>"
    })
    public List<SysForumFollow> selectFollowList(SysForumFollow follow);

    /**
     * 查询关注详细信息
     * 
     * @param id 关注ID
     * @return 关注信息
     */
    @Select({
        "select f.*, u.nick_name as userName, u.avatar, fu.nick_name as followUserName, fu.avatar as followUserAvatar",
        "from sys_forum_follow f",
        "left join sys_user u on f.user_id = u.user_id",
        "left join sys_user fu on f.follow_user_id = fu.user_id",
        "where f.id = #{id} and f.del_flag = '0'"
    })
    public SysForumFollow selectFollowById(Long id);

    /**
     * 新增关注
     * 
     * @param follow 关注信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_follow (",
        "user_id, follow_user_id, create_time, update_time, del_flag",
        ") values (",
        "#{userId}, #{followUserId}, sysdate(), sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertFollow(SysForumFollow follow);

    /**
     * 修改关注
     * 
     * @param follow 关注信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_follow",
        "<set>",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updateFollow(SysForumFollow follow);

    /**
     * 删除关注
     * 
     * @param id 关注ID
     * @return 结果
     */
    @Update("update sys_forum_follow set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deleteFollowById(Long id);

    /**
     * 批量删除关注
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_follow set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deleteFollowByIds(Long[] ids);

    /**
     * 检查是否已关注
     * 
     * @param userId 用户ID
     * @param followUserId 被关注用户ID
     * @return 关注信息
     */
    @Select("select * from sys_forum_follow where user_id = #{userId} and follow_user_id = #{followUserId} and del_flag = '0'")
    public SysForumFollow checkFollow(@Param("userId") Long userId, @Param("followUserId") Long followUserId);

    /**
     * 取消用户关注
     * 
     * @param userId 用户ID
     * @param followUserId 被关注用户ID
     * @return 结果
     */
    @Update("update sys_forum_follow set del_flag = '2', update_time = sysdate() where user_id = #{userId} and follow_user_id = #{followUserId}")
    public int cancelFollow(@Param("userId") Long userId, @Param("followUserId") Long followUserId);

    /**
     * 获取用户关注列表
     * 
     * @param userId 用户ID
     * @return 关注列表
     */
    @Select({
        "select f.*, u.nick_name as followUserName, u.avatar as followUserAvatar",
        "from sys_forum_follow f",
        "left join sys_user u on f.follow_user_id = u.user_id",
        "where f.user_id = #{userId} and f.del_flag = '0'",
        "order by f.create_time desc"
    })
    public List<SysForumFollow> selectUserFollows(Long userId);

    /**
     * 获取用户粉丝列表
     * 
     * @param followUserId 被关注用户ID
     * @return 粉丝列表
     */
    @Select({
        "select f.*, u.nick_name as userName, u.avatar",
        "from sys_forum_follow f",
        "left join sys_user u on f.user_id = u.user_id",
        "where f.follow_user_id = #{followUserId} and f.del_flag = '0'",
        "order by f.create_time desc"
    })
    public List<SysForumFollow> selectUserFans(Long followUserId);

    /**
     * 获取用户关注数量
     * 
     * @param userId 用户ID
     * @return 关注数量
     */
    @Select("select count(*) from sys_forum_follow where user_id = #{userId} and del_flag = '0'")
    public int selectFollowCount(Long userId);

    /**
     * 获取用户粉丝数量
     * 
     * @param followUserId 被关注用户ID
     * @return 粉丝数量
     */
    @Select("select count(*) from sys_forum_follow where follow_user_id = #{followUserId} and del_flag = '0'")
    public int selectFanCount(Long followUserId);
} 