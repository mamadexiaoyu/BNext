package com.ruoyi.system.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.core.utils.file.FileTypeUtils;
import com.ruoyi.common.core.utils.file.MimeTypeUtils;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.api.RemoteFileService;
import com.ruoyi.system.api.domain.SysFile;
import com.ruoyi.system.api.domain.SysUser;
import com.ruoyi.system.api.model.LoginUser;
import com.ruoyi.system.domain.SysForumComment;
import com.ruoyi.system.domain.SysForumPost;
import com.ruoyi.system.domain.SysForumStatistics;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 论坛管理Controller
 */
@RestController
@RequestMapping("/forum")
public class SysForumController extends BaseController {
    @Autowired
    private ISysForumPostService forumPostService;
    @Autowired
    private ISysForumMessageService forumMessageService;
    @Autowired
    private ISysForumCommentService forumCommentService;
    @Autowired
    private ISysForumStatisticsService forumStatisticsService;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private RemoteFileService remoteFileService;
    @Autowired
    private IPyDetectionRecordService pyDetectionRecordService;

    /**
     * 获取用户个人信息
     */
    @GetMapping("/user/info")
    public AjaxResult getUserInfo() {
        Long userId = SecurityUtils.getUserId();
        SysUser user = userService.selectUserById(userId);
        return success(user);
    }

    /**
     * 修改用户个人资料
     */
    @Log(title = "论坛用户", businessType = BusinessType.UPDATE)
    @PutMapping("/user/profile")
    public AjaxResult updateUserProfile(@RequestBody SysUser user) {
        Long userId = SecurityUtils.getUserId();
        user.setUserId(userId);
        // 不允许修改关键信息
        user.setUserName(null);
        user.setPassword(null);
        user.setStatus(null);
        user.setDelFlag(null);

        if (userService.updateUser(user) > 0) {
            return success();
        }
        return error("修改个人资料失败");
    }

    /**
     * 修改用户头像
     */
    @Log(title = "论坛用户", businessType = BusinessType.UPDATE)
    @PostMapping("/user/avatar")
    public AjaxResult avatar(@RequestParam MultipartFile file) {
        if (!file.isEmpty()) {
            LoginUser loginUser = SecurityUtils.getLoginUser();
            String extension = FileTypeUtils.getExtension(file);
            if (!StringUtils.equalsAnyIgnoreCase(extension, MimeTypeUtils.IMAGE_EXTENSION)) {
                return error("文件格式不正确，请上传" + Arrays.toString(MimeTypeUtils.IMAGE_EXTENSION) + "格式");
            }
            R<SysFile> fileResult = remoteFileService.upload(file);
            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData())) {
                return error("文件服务异常，请联系管理员");
            }
            String url = fileResult.getData().getUrl();
            if (userService.updateUserAvatar(loginUser.getUsername(), url)) {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("imgUrl", url);
                // 更新缓存用户头像
                loginUser.getSysUser().setAvatar(url);
                return ajax;
            }
        }
        return error("上传图片异常，请联系管理员");
    }

    /**
     * 修改用户密码
     */
    @Log(title = "论坛用户", businessType = BusinessType.UPDATE)
    @PutMapping("/user/updatePwd")
    public AjaxResult updatePwd(String oldPassword, String newPassword) {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        SysUser user = loginUser.getSysUser();
        String userName = user.getUserName();
        String password = user.getPassword();
        if (!SecurityUtils.matchesPassword(oldPassword, password)) {
            return error("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(newPassword, password)) {
            return error("新密码不能与旧密码相同");
        }
        if (userService.resetUserPwd(userName, SecurityUtils.encryptPassword(newPassword)) > 0) {
            // 更新缓存用户密码
            user.setPassword(SecurityUtils.encryptPassword(newPassword));
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 获取帖子列表
     */
    @GetMapping("/post/list")
    public TableDataInfo list(SysForumPost post) {
        startPage();
        List<SysForumPost> list = forumPostService.selectPostList(post);
        return getDataTable(list);
    }

    /**
     * 获取我的帖子列表
     */
    @GetMapping("/post/my")
    public TableDataInfo myPosts(SysForumPost post) {
        startPage();
        post.setUserId(SecurityUtils.getUserId());
        List<SysForumPost> list = forumPostService.selectPostList(post);
        return getDataTable(list);
    }

    /**
     * 获取帖子详细信息
     */
    @GetMapping("/post/{id}")
    public AjaxResult getPost(@PathVariable("id") Long id) {
        return success(forumPostService.selectPostById(id));
    }

    /**
     * 新增帖子
     */
    @Log(title = "论坛帖子", businessType = BusinessType.INSERT)
    @PostMapping("/post")
    public AjaxResult add(@RequestBody JSONObject object) {
        //获取tags
        JSONArray tags = object.getJSONArray("tags");
        //获取images
        JSONArray images = object.getJSONArray("images");
        //获取post
        SysForumPost post = object.toJavaObject(SysForumPost.class);
        //将tags和images转换为字符串
        post.setImages(images.stream().map(String::valueOf).reduce((a, b) -> a + "," + b).orElse(""));
        //将tagsStr和imagesStr设置到post中
        post.setTags(tags.stream().map(String::valueOf).reduce((a, b) -> a + "," + b).orElse(""));
        //设置用户id
        post.setUserId(SecurityUtils.getUserId());
        post.setCreateBy(SecurityUtils.getUsername());
        post.setCreateTime(new Date());
        return toAjax(forumPostService.insertPost(post));
    }

    /**
     * 修改帖子
     */
    @Log(title = "论坛帖子", businessType = BusinessType.UPDATE)
    @PutMapping("/post")
    public AjaxResult edit(@RequestBody SysForumPost post) {
        // 验证是否是帖子作者
        SysForumPost oldPost = forumPostService.selectPostById(post.getId());
        if (!oldPost.getUserId().equals(SecurityUtils.getUserId())) {
            return error("无权修改他人的帖子");
        }
        return toAjax(forumPostService.updatePost(post));
    }

    /**
     * 删除帖子
     */
    @Log(title = "论坛帖子", businessType = BusinessType.DELETE)
    @DeleteMapping("/post/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        // 验证是否是帖子作者
        SysForumPost post = forumPostService.selectPostById(id);
        if (!post.getUserId().equals(SecurityUtils.getUserId())) {
            return error("无权删除他人的帖子");
        }
        return toAjax(forumPostService.deletePostById(id));
    }

    /**
     * 清空所有消息
     */
    @DeleteMapping("/message/clear")
    public AjaxResult clearMessages() {
        return toAjax(forumMessageService.clearUserMessages(SecurityUtils.getUserId()));
    }

    /**
     * 获取用户统计数据
     */
    @GetMapping("/statistics/user")
    public AjaxResult getUserStatistics() {
        SysForumStatistics statistics = forumStatisticsService.selectUserStatistics(SecurityUtils.getUserId());
        // 如果没有统计数据，则创建一个默认的统计对象
        if (statistics == null) {
            statistics = new SysForumStatistics();
            statistics.setUserId(SecurityUtils.getUserId());
            statistics.setPostCount(0L);
            statistics.setCommentCount(0L);
            statistics.setLikeCount(0L);
            statistics.setViewCount(0L);
            statistics.setType("user");
            // 可以选择在此处插入新的统计记录
            // forumStatisticsService.insertStatistics(statistics);
        }
        return success(statistics);
    }

    /**
     * 获取论坛总体统计数据
     */
    @GetMapping("/statistics/forum")
    public AjaxResult getForumStatistics() {
        SysForumStatistics statistics = forumStatisticsService.selectForumStatistics();
        // 如果没有总体统计数据，则创建一个默认的统计对象
        if (statistics == null) {
            statistics = new SysForumStatistics();
            statistics.setType("forum");
            statistics.setPostCount(0L);
            statistics.setCommentCount(0L);
            statistics.setLikeCount(0L);
            statistics.setViewCount(0L);
            // 可以选择在此处插入新的总体统计记录
            // forumStatisticsService.insertStatistics(statistics);
        }
        return success(statistics);
    }

    /**
     * 点赞帖子
     */
    @PutMapping("/post/like/{id}")
    public AjaxResult likePost(@PathVariable Long id) {
//        return toAjax(forumLikeService.selectUserLikes(id, SecurityUtils.getUserId()));
        return AjaxResult.error("点赞功能暂未实现");
    }

    /**
     * 取消点赞
     */
    @PutMapping("/post/unlike/{id}")
    public AjaxResult unlikePost(@PathVariable Long id) {
//        return toAjax(forumLikeService.unlikePost(id, SecurityUtils.getUserId()));
        return AjaxResult.error("取消点赞功能暂未实现");
    }

    /**
     * 发表评论
     */
    @PostMapping("/post/comment")
    public AjaxResult addComment(@RequestBody SysForumComment comment) {
        comment.setUserId(SecurityUtils.getUserId());
        if (comment.getParentId() == null) {
            comment.setParentId(0L);
        }
        int rows = forumCommentService.insertComment(comment);
        if (rows > 0) {
            // 增加帖子评论数
            forumPostService.incrementCommentCount(comment.getPostId());
            // 发送评论消息
            forumMessageService.sendCommentMessage(comment.getUserId(), SecurityUtils.getUserId(), SecurityUtils.getUsername(), comment.getContent(), comment.getPostId());
        }
        return toAjax(rows);
    }

    /**
     * 删除评论
     */
    @DeleteMapping("/post/comment/{id}")
    public AjaxResult deleteComment(@PathVariable Long id) {
        // 验证是否是评论作者
        SysForumComment comment = forumCommentService.selectCommentById(id);
        if (!comment.getUserId().equals(SecurityUtils.getUserId())) {
            return error("无权删除他人的评论");
        }
        int rows = forumCommentService.deleteCommentById(id);
        if (rows > 0) {
            // 减少帖子评论数
            forumPostService.decrementCommentCount(comment.getPostId());
        }
        return toAjax(rows);
    }

    /**
     * 获取帖子评论列表
     */
    @GetMapping("/post/comment/list/{postId}")
    public TableDataInfo getCommentList(@PathVariable Long postId) {
        startPage();
        Long userId = SecurityUtils.getUserId();
        List<SysForumComment> list = forumCommentService.selectCommentsByPostId(postId);
        return getDataTable(list);
    }

    /**
     * 批量检测图像检测记录
     */
    @PostMapping("/record/batchDetect")
    public AjaxResult batchDetect(@RequestBody List<Long> ids) {
        return pyDetectionRecordService.batchDetect(ids) > 0 ? AjaxResult.success() : AjaxResult.error();
    }

}
