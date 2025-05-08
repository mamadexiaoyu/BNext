package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysForumLikeMapper;
import com.ruoyi.system.domain.SysForumLike;
import com.ruoyi.system.service.ISysForumLikeService;

import javax.annotation.Resource;

/**
 * 论坛点赞Service业务层处理
 */
@Service
public class SysForumLikeServiceImpl implements ISysForumLikeService 
{
    @Resource
    private SysForumLikeMapper likeMapper;

    /**
     * 查询点赞列表
     * 
     * @param like 点赞信息
     * @return 点赞
     */
    @Override
    public List<SysForumLike> selectLikeList(SysForumLike like)
    {
        return likeMapper.selectLikeList(like);
    }

    /**
     * 查询点赞详细信息
     * 
     * @param id 点赞ID
     * @return 点赞
     */
    @Override
    public SysForumLike selectLikeById(Long id)
    {
        return likeMapper.selectLikeById(id);
    }

    /**
     * 新增点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    @Override
    public int insertLike(SysForumLike like)
    {
        return likeMapper.insertLike(like);
    }

    /**
     * 修改点赞
     * 
     * @param like 点赞信息
     * @return 结果
     */
    @Override
    public int updateLike(SysForumLike like)
    {
        return likeMapper.updateLike(like);
    }

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的点赞ID
     * @return 结果
     */
    @Override
    public int deleteLikeByIds(Long[] ids)
    {
        return likeMapper.deleteLikeByIds(ids);
    }

    /**
     * 删除点赞信息
     * 
     * @param id 点赞ID
     * @return 结果
     */
    @Override
    public int deleteLikeById(Long id)
    {
        return likeMapper.deleteLikeById(id);
    }

    /**
     * 检查用户是否已点赞
     * 
     * @param userId 用户ID
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 是否已点赞
     */
    @Override
    public boolean hasLiked(Long userId, String type, Long targetId)
    {
        return likeMapper.hasLiked(userId, type, targetId) > 0;
    }

    /**
     * 获取用户点赞列表
     * 
     * @param userId 用户ID
     * @param type 点赞类型
     * @return 点赞列表
     */
    @Override
    public List<SysForumLike> selectUserLikes(Long userId, String type)
    {
        return likeMapper.selectUserLikes(userId, Integer.parseInt(type));
    }

    /**
     * 获取目标点赞数量
     * 
     * @param type 点赞类型
     * @param targetId 目标ID
     * @return 点赞数量
     */
    @Override
    public int getLikeCount(String type, Long targetId)
    {
        return likeMapper.getLikeCount(type, targetId);
    }
} 