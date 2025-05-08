package com.ruoyi.system.service.impl;

import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.domain.SysForumMessage;
import com.ruoyi.system.mapper.SysForumMessageMapper;
import com.ruoyi.system.service.ISysForumMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 论坛消息Service业务层处理
 */
@Service
public class SysForumMessageServiceImpl implements ISysForumMessageService {
    @Autowired
    private SysForumMessageMapper sysForumMessageMapper;

    /**
     * 查询论坛消息
     *
     * @param id 论坛消息主键
     * @return 论坛消息
     */
    @Override
    public SysForumMessage selectSysForumMessageById(Long id) {
        return sysForumMessageMapper.selectSysForumMessageById(id);
    }

    /**
     * 查询论坛消息列表
     *
     * @param sysForumMessage 论坛消息
     * @return 论坛消息
     */
    @Override
    public List<SysForumMessage> selectSysForumMessageList(SysForumMessage sysForumMessage) {
        return sysForumMessageMapper.selectSysForumMessageList(sysForumMessage);
    }

    /**
     * 新增论坛消息
     *
     * @param sysForumMessage 论坛消息
     * @return 结果
     */
    @Override
    public int insertSysForumMessage(SysForumMessage sysForumMessage) {
        return sysForumMessageMapper.insertSysForumMessage(sysForumMessage);
    }

    /**
     * 修改论坛消息
     *
     * @param sysForumMessage 论坛消息
     * @return 结果
     */
    @Override
    public int updateSysForumMessage(SysForumMessage sysForumMessage) {
        return sysForumMessageMapper.updateSysForumMessage(sysForumMessage);
    }

    /**
     * 批量删除论坛消息
     *
     * @param ids 需要删除的论坛消息主键
     * @return 结果
     */
    @Override
    public int deleteSysForumMessageByIds(Long[] ids) {
        return sysForumMessageMapper.deleteSysForumMessageByIds(ids);
    }

    /**
     * 删除论坛消息信息
     *
     * @param id 论坛消息主键
     * @return 结果
     */
    @Override
    public int deleteSysForumMessageById(Long id) {
        return sysForumMessageMapper.deleteSysForumMessageById(id);
    }

    /**
     * 标记消息为已读
     *
     * @param id 消息ID
     * @return 结果
     */
    @Override
    public int markMessageAsRead(Long id) {
        return sysForumMessageMapper.markMessageAsRead(id);
    }

    /**
     * 清空用户所有消息
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    public int clearUserMessages(Long userId) {
        return sysForumMessageMapper.clearUserMessages(userId);
    }

    /**
     * 发送系统消息
     *
     * @param userId  接收用户ID
     * @param content 消息内容
     * @return 结果
     */
    @Override
    public int sendSystemMessage(Long userId, String content) {
        SysForumMessage message = new SysForumMessage();
        message.setUserId(userId);
        message.setFromUserId(0L); // 系统消息发送者ID为0
        message.setFromUserName("系统");
        message.setType("4"); // 系统消息
        message.setContent(content);
        message.setIsRead("0");
        return insertSysForumMessage(message);
    }

    /**
     * 发送评论消息
     *
     * @param userId       接收用户ID
     * @param fromUserId   发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content      消息内容
     * @param targetId     目标ID
     * @return 结果
     */
    @Override
    public int sendCommentMessage(Long userId, Long fromUserId, String fromUserName, String content, Long targetId) {
        SysForumMessage message = new SysForumMessage();
        message.setUserId(userId);
        message.setFromUserId(fromUserId);
        message.setFromUserName(fromUserName);
        message.setType("1"); // 评论消息
        message.setContent(content);
        message.setTargetId(targetId);
        message.setIsRead("0");
        return insertSysForumMessage(message);
    }

    /**
     * 发送点赞消息
     *
     * @param userId       接收用户ID
     * @param fromUserId   发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content      消息内容
     * @param targetId     目标ID
     * @return 结果
     */
    @Override
    public int sendLikeMessage(Long userId, Long fromUserId, String fromUserName, String content, Long targetId) {
        SysForumMessage message = new SysForumMessage();
        message.setUserId(userId);
        message.setFromUserId(fromUserId);
        message.setFromUserName(fromUserName);
        message.setType("2"); // 点赞消息
        message.setContent(content);
        message.setTargetId(targetId);
        message.setIsRead("0");
        return insertSysForumMessage(message);
    }

    /**
     * 发送关注消息
     *
     * @param userId       接收用户ID
     * @param fromUserId   发送用户ID
     * @param fromUserName 发送用户昵称
     * @param content      消息内容
     * @return 结果
     */
    @Override
    public int sendFollowMessage(Long userId, Long fromUserId, String fromUserName, String content) {
        SysForumMessage message = new SysForumMessage();
        message.setUserId(userId);
        message.setFromUserId(fromUserId);
        message.setFromUserName(fromUserName);
        message.setType("3"); // 关注消息
        message.setContent(content);
        message.setIsRead("0");
        return insertSysForumMessage(message);
    }

    @Override
    public List<SysForumMessage> selectMessageList(Long userId) {
        Boolean isAdmin = SecurityUtils.isAdmin(userId);
        return sysForumMessageMapper.selectMessageList(userId, isAdmin);
    }
} 