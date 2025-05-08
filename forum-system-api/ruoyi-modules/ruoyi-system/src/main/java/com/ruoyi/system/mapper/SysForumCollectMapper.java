package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumCollect;

/**
 * 论坛收藏Mapper接口
 */
public interface SysForumCollectMapper 
{
    /**
     * 查询收藏列表
     * 
     * @param collect 收藏信息
     * @return 收藏集合
     */
    @Select({
        "<script>",
        "select c.*, u.nick_name as userName, u.avatar, p.title as postTitle",
        "from sys_forum_collect c",
        "left join sys_user u on c.user_id = u.user_id",
        "left join sys_forum_post p on c.post_id = p.id",
        "where c.del_flag = '0'",
        "<if test='userId != null'>and c.user_id = #{userId}</if>",
        "<if test='postId != null'>and c.post_id = #{postId}</if>",
        "order by c.create_time desc",
        "</script>"
    })
    public List<SysForumCollect> selectCollectList(SysForumCollect collect);

    /**
     * 查询收藏详细信息
     * 
     * @param id 收藏ID
     * @return 收藏信息
     */
    @Select({
        "select c.*, u.nick_name as userName, u.avatar, p.title as postTitle",
        "from sys_forum_collect c",
        "left join sys_user u on c.user_id = u.user_id",
        "left join sys_forum_post p on c.post_id = p.id",
        "where c.id = #{id} and c.del_flag = '0'"
    })
    public SysForumCollect selectCollectById(Long id);

    /**
     * 新增收藏
     * 
     * @param collect 收藏信息
     * @return 结果
     */
    @Insert({
        "insert into sys_forum_collect (",
        "user_id, post_id, create_time, update_time, del_flag",
        ") values (",
        "#{userId}, #{postId}, sysdate(), sysdate(), '0'",
        ")"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertCollect(SysForumCollect collect);

    /**
     * 修改收藏
     * 
     * @param collect 收藏信息
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_collect",
        "<set>",
        "update_time = sysdate()",
        "</set>",
        "where id = #{id} and del_flag = '0'",
        "</script>"
    })
    public int updateCollect(SysForumCollect collect);

    /**
     * 删除收藏
     * 
     * @param id 收藏ID
     * @return 结果
     */
    @Update("update sys_forum_collect set del_flag = '2', update_time = sysdate() where id = #{id}")
    public int deleteCollectById(Long id);

    /**
     * 批量删除收藏
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Update({
        "<script>",
        "update sys_forum_collect set del_flag = '2', update_time = sysdate() where id in",
        "<foreach collection='array' item='id' open='(' separator=',' close=')'>",
        "#{id}",
        "</foreach>",
        "</script>"
    })
    public int deleteCollectByIds(Long[] ids);

    /**
     * 检查用户是否已收藏帖子
     * 
     * @param userId 用户ID
     * @param postId 帖子ID
     * @return 收藏信息
     */
    @Select("select * from sys_forum_collect where user_id = #{userId} and post_id = #{postId} and del_flag = '0'")
    public SysForumCollect checkUserCollect(@Param("userId") Long userId, @Param("postId") Long postId);

    /**
     * 取消用户对帖子的收藏
     * 
     * @param userId 用户ID
     * @param postId 帖子ID
     * @return 结果
     */
    @Update("update sys_forum_collect set del_flag = '2', update_time = sysdate() where user_id = #{userId} and post_id = #{postId}")
    public int cancelCollect(@Param("userId") Long userId, @Param("postId") Long postId);

    /**
     * 获取用户收藏列表
     * 
     * @param userId 用户ID
     * @return 收藏列表
     */
    @Select({
        "select c.*, p.title as postTitle, p.content as postContent, p.view_count as postViewCount, p.like_count as postLikeCount,",
        "p.comment_count as postCommentCount, u2.nick_name as postUserName, u2.avatar as postUserAvatar",
        "from sys_forum_collect c",
        "left join sys_forum_post p on c.post_id = p.id",
        "left join sys_user u2 on p.user_id = u2.user_id",
        "where c.user_id = #{userId} and c.del_flag = '0' and p.del_flag = '0'",
        "order by c.create_time desc"
    })
    public List<SysForumCollect> selectUserCollects(Long userId);

    /**
     * 获取帖子收藏数量
     * 
     * @param postId 帖子ID
     * @return 收藏数量
     */
    @Select("select count(*) from sys_forum_collect where post_id = #{postId} and del_flag = '0'")
    public int selectCollectCount(Long postId);
} 