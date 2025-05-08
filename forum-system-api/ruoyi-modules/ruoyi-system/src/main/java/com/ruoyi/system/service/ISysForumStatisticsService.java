package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysForumStatistics;

/**
 * 论坛统计数据Service接口
 */
public interface ISysForumStatisticsService 
{
    /**
     * 查询统计数据列表
     * 
     * @param statistics 统计数据信息
     * @return 统计数据集合
     */
    public List<SysForumStatistics> selectStatisticsList(SysForumStatistics statistics);

    /**
     * 查询统计数据详细信息
     * 
     * @param id 统计数据ID
     * @return 统计数据信息
     */
    public SysForumStatistics selectStatisticsById(Long id);

    /**
     * 新增统计数据
     * 
     * @param statistics 统计数据信息
     * @return 结果
     */
    public int insertStatistics(SysForumStatistics statistics);

    /**
     * 修改统计数据
     * 
     * @param statistics 统计数据信息
     * @return 结果
     */
    public int updateStatistics(SysForumStatistics statistics);

    /**
     * 批量删除统计数据
     * 
     * @param ids 需要删除的统计数据ID
     * @return 结果
     */
    public int deleteStatisticsByIds(Long[] ids);

    /**
     * 删除统计数据信息
     * 
     * @param id 统计数据ID
     * @return 结果
     */
    public int deleteStatisticsById(Long id);

    /**
     * 获取用户统计数据
     * 
     * @param userId 用户ID
     * @return 统计数据
     */
    public SysForumStatistics selectUserStatistics(Long userId);

    /**
     * 获取论坛总体统计数据
     * 
     * @return 统计数据
     */
    public SysForumStatistics selectForumStatistics();

    /**
     * 更新用户统计数据
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int updateUserStatistics(Long userId);

    /**
     * 更新论坛总体统计数据
     * 
     * @return 结果
     */
    public int updateForumStatistics();
} 