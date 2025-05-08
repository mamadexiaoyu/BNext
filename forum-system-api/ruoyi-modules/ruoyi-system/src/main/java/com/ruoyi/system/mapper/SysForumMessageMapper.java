package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.ruoyi.system.domain.SysForumMessage;
import org.apache.ibatis.annotations.Param;

/**
 * 论坛消息Mapper接口
 */
public interface SysForumMessageMapper 
{
    /**
     * 查询论坛消息
     * 
     * @param id 论坛消息主键
     * @return 论坛消息
     */
    public SysForumMessage selectSysForumMessageById(@Param("id") Long id);

    /**
     * 查询论坛消息列表
     * 
     * @param sysForumMessage 论坛消息
     * @return 论坛消息集合
     */
    public List<SysForumMessage> selectSysForumMessageList(SysForumMessage sysForumMessage);

    /**
     * 新增论坛消息
     * 
     * @param sysForumMessage 论坛消息
     * @return 结果
     */
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insertSysForumMessage(@Param("sysForumMessage") SysForumMessage sysForumMessage);

    /**
     * 修改论坛消息
     * 
     * @param sysForumMessage 论坛消息
     * @return 结果
     */
    public int updateSysForumMessage(@Param("sysForumMessage") SysForumMessage sysForumMessage);

    /**
     * 删除论坛消息
     * 
     * @param id 论坛消息主键
     * @return 结果
     */
    public int deleteSysForumMessageById(@Param("id") Long id);

    /**
     * 批量删除论坛消息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysForumMessageByIds(@Param("ids") Long[] ids);

    /**
     * 标记消息为已读
     * 
     * @param id 消息ID
     * @return 结果
     */
    public int markMessageAsRead(@Param("id") Long id);

    /**
     * 清空用户所有消息
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int clearUserMessages(@Param("userId") Long userId);

    /**
     * 获取用户未读消息数量
     * 
     * @param userId 用户ID
     * @return 未读消息数量
     */
    @Select("select count(*) from sys_forum_message where user_id = #{userId} and is_read = '0' and del_flag = '0'")
    public int getUnreadCount(Long userId);

    /**
     * 查询消息列表
     * 
     * @param userId 用户ID
     * @param isAdmin 是否是管理员
     * @return 消息列表
     */
    public List<SysForumMessage> selectMessageList(@Param("userId") Long userId, @Param("isAdmin") Boolean isAdmin);
} 