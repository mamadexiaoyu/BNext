package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.PyDetectionImage;

/**
 * 检测图片记录Service接口
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
public interface IPyDetectionImageService 
{
    /**
     * 查询检测图片记录
     * 
     * @param id 检测图片记录主键
     * @return 检测图片记录
     */
    public PyDetectionImage selectPyDetectionImageById(Long id);

    /**
     * 查询检测图片记录列表
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 检测图片记录集合
     */
    public List<PyDetectionImage> selectPyDetectionImageList(PyDetectionImage pyDetectionImage);

    /**
     * 新增检测图片记录
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 结果
     */
    public int insertPyDetectionImage(PyDetectionImage pyDetectionImage);

    /**
     * 修改检测图片记录
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 结果
     */
    public int updatePyDetectionImage(PyDetectionImage pyDetectionImage);

    /**
     * 批量删除检测图片记录
     * 
     * @param ids 需要删除的检测图片记录主键集合
     * @return 结果
     */
    public int deletePyDetectionImageByIds(Long[] ids);

    /**
     * 删除检测图片记录信息
     * 
     * @param id 检测图片记录主键
     * @return 结果
     */
    public int deletePyDetectionImageById(Long id);
}
