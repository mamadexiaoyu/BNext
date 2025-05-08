package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysForumMessage;

/**
 * 论坛消息Service接口
 */
public interface ISysForumMessageService {
    /**
     * 查询论坛消息
     * 
     * @param id 论坛消息主键
     * @return 论坛消息
     */
    public SysForumMessage selectSysForumMessageById(Long id);

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
    public int insertSysForumMessage(SysForumMessage sysForumMessage);

    /**
     * 修改论坛消息
     * 
     * @param sysForumMessage 论坛消息
     * @return 结果
     */
    public int updateSysForumMessage(SysForumMessage sysForumMessage);

    /**
     * 批量删除论坛消息
     * 
     * @param ids 需要删除的论坛消息主键集合
     * @return 结果
     */
    public int deleteSysForumMessageByIds(Long[] ids);

    /**
     * 删除论坛消息信息
     * 
     * @param id 论坛消息主键
     * @return 结果
     */
    public int deleteSysForumMessageById(Long id);

    /**
     * 标记消息为已读
     * 
     * @param id 消息ID
     * @return 结果
     */
    public int markMessageAsRead(Long id);

    /**
     * 清空用户所有消息
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int clearUserMessages(Long userId);

    /**
     * 发送系统消息
     * 
     * @param userId 接收用户ID
     * @param content 消息内容
     * @return 结果
     */
    public int sendSystemMessage(Long userId, String content);

    /**
     * 发送评论消息
     * 
     * @param userId 接收用户ID
     * @param fromUserId 发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content 消息内容
     * @param targetId 目标ID
     * @return 结果
     */
    public int sendCommentMessage(Long userId, Long fromUserId, String fromUserName, String content, Long targetId);

    /**
     * 发送点赞消息
     * 
     * @param userId 接收用户ID
     * @param fromUserId 发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content 消息内容
     * @param targetId 目标ID
     * @return 结果
     */
    public int sendLikeMessage(Long userId, Long fromUserId, String fromUserName, String content, Long targetId);

    /**
     * 发送关注消息
     * 
     * @param userId 接收用户ID
     * @param fromUserId 发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content 消息内容
     * @return 结果
     */
    public int sendFollowMessage(Long userId, Long fromUserId, String fromUserName, String content);

    /**
     * 查询消息列表
     * 
     * @param userId 用户ID
     * @return 消息列表
     */
    public List<SysForumMessage> selectMessageList(Long userId);
} 