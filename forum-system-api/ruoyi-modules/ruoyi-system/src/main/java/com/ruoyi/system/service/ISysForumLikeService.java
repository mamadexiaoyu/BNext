package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysForumLike;

/**
 * 论坛点赞Service接口
 */
public interface ISysForumLikeService 
{
    /**
     * 查询点赞列表
     * 
     * @param like 点赞信息
     * @return 点赞集合
     */
    public List<SysForumLike> selectLikeList(SysForumLike like);

    /**
     * 查询点赞详细信息
     * 
     * @param id 点赞ID
     * @return 点赞信息
     */
    public SysForumLike selectLikeById(Long id);

    /**
     * 新增点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    public int insertLike(SysForumLike like);

    /**
     * 修改点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    public int updateLike(SysForumLike like);

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的点赞ID
     * @return 结果
     */
    public int deleteLikeByIds(Long[] ids);

    /**
     * 删除点赞信息
     * 
     * @param id 点赞ID
     * @return 结果
     */
    public int deleteLikeById(Long id);

    /**
     * 检查用户是否已点赞
     * 
     * @param userId 用户ID
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 是否已点赞
     */
    public boolean hasLiked(Long userId, String type, Long targetId);

    /**
     * 获取用户点赞列表
     * 
     * @param userId 用户ID
     * @param type 点赞类型
     * @return 点赞列表
     */
    public List<SysForumLike> selectUserLikes(Long userId, String type);

    /**
     * 获取目标点赞数量
     * 
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 点赞数量
     */
    public int getLikeCount(String type, Long targetId);
} 