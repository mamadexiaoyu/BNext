package com.ruoyi.system.controller;

import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.domain.SysForumMessage;
import com.ruoyi.system.service.ISysForumMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 论坛消息Controller
 */
@RestController
@RequestMapping("/message")
public class SysForumMessageController extends BaseController {
    @Autowired
    private ISysForumMessageService sysForumMessageService;

    /**
     * 查询论坛消息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysForumMessage sysForumMessage) {
        startPage();
        // 设置当前用户ID，确保普通用户只能看到自己的消息
        Long userId = SecurityUtils.getUserId();
        if (!SecurityUtils.isAdmin(userId)) {
            sysForumMessage.setUserId(userId);
        }
        List<SysForumMessage> list = sysForumMessageService.selectSysForumMessageList(sysForumMessage);
        return getDataTable(list);
    }


    /**
     * 获取论坛消息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysForumMessageService.selectSysForumMessageById(id));
    }

    /**
     * 新增论坛消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysForumMessage sysForumMessage) {
        return toAjax(sysForumMessageService.insertSysForumMessage(sysForumMessage));
    }

    /**
     * 修改论坛消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysForumMessage sysForumMessage) {
        return toAjax(sysForumMessageService.updateSysForumMessage(sysForumMessage));
    }

    /**
     * 删除论坛消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysForumMessageService.deleteSysForumMessageByIds(ids));
    }

    /**
     * 标记消息为已读
     */
    @Log(title = "论坛消息", businessType = BusinessType.UPDATE)
    @PutMapping("/read/{id}")
    public AjaxResult markAsRead(@PathVariable("id") Long id) {
        return toAjax(sysForumMessageService.markMessageAsRead(id));
    }

    /**
     * 清空用户所有消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.DELETE)
    @DeleteMapping("/clear/{userId}")
    public AjaxResult clearUserMessages(@PathVariable("userId") Long userId) {
        return toAjax(sysForumMessageService.clearUserMessages(userId));
    }

    /**
     * 发送系统消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.INSERT)
    @PostMapping("/system/{userId}")
    public AjaxResult sendSystemMessage(@PathVariable("userId") Long userId, @RequestBody String content) {
        return toAjax(sysForumMessageService.sendSystemMessage(userId, content));
    }

    /**
     * 发送评论消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.INSERT)
    @PostMapping("/comment")
    public AjaxResult sendCommentMessage(@RequestBody SysForumMessage message) {
        return toAjax(sysForumMessageService.sendCommentMessage(
                message.getUserId(),
                message.getFromUserId(),
                message.getFromUserName(),
                message.getContent(),
                message.getTargetId()
        ));
    }

    /**
     * 发送点赞消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.INSERT)
    @PostMapping("/like")
    public AjaxResult sendLikeMessage(@RequestBody SysForumMessage message) {
        return toAjax(sysForumMessageService.sendLikeMessage(
                message.getUserId(),
                message.getFromUserId(),
                message.getFromUserName(),
                message.getContent(),
                message.getTargetId()
        ));
    }

    /**
     * 发送关注消息
     */
    @Log(title = "论坛消息", businessType = BusinessType.INSERT)
    @PostMapping("/follow")
    public AjaxResult sendFollowMessage(@RequestBody SysForumMessage message) {
        return toAjax(sysForumMessageService.sendFollowMessage(
                message.getUserId(),
                message.getFromUserId(),
                message.getFromUserName(),
                message.getContent()
        ));
    }
} 