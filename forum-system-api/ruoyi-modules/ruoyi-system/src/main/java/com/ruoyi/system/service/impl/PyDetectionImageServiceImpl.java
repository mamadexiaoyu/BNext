package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PyDetectionImageMapper;
import com.ruoyi.system.domain.PyDetectionImage;
import com.ruoyi.system.service.IPyDetectionImageService;

import javax.annotation.Resource;

/**
 * 检测图片记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
@Service
public class PyDetectionImageServiceImpl implements IPyDetectionImageService 
{
    @Resource
    private PyDetectionImageMapper pyDetectionImageMapper;

    /**
     * 查询检测图片记录
     * 
     * @param id 检测图片记录主键
     * @return 检测图片记录
     */
    @Override
    public PyDetectionImage selectPyDetectionImageById(Long id)
    {
        return pyDetectionImageMapper.selectPyDetectionImageById(id);
    }

    /**
     * 查询检测图片记录列表
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 检测图片记录
     */
    @Override
    public List<PyDetectionImage> selectPyDetectionImageList(PyDetectionImage pyDetectionImage)
    {
        return pyDetectionImageMapper.selectPyDetectionImageList(pyDetectionImage);
    }

    /**
     * 新增检测图片记录
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 结果
     */
    @Override
    public int insertPyDetectionImage(PyDetectionImage pyDetectionImage)
    {
        pyDetectionImage.setCreateBy(String.valueOf(SecurityUtils.getUserId()));
        pyDetectionImage.setCreateTime(DateUtils.getNowDate());
        return pyDetectionImageMapper.insertPyDetectionImage(pyDetectionImage);
    }

    /**
     * 修改检测图片记录
     * 
     * @param pyDetectionImage 检测图片记录
     * @return 结果
     */
    @Override
    public int updatePyDetectionImage(PyDetectionImage pyDetectionImage)
    {
        return pyDetectionImageMapper.updatePyDetectionImage(pyDetectionImage);
    }

    /**
     * 批量删除检测图片记录
     * 
     * @param ids 需要删除的检测图片记录主键
     * @return 结果
     */
    @Override
    public int deletePyDetectionImageByIds(Long[] ids)
    {
        return pyDetectionImageMapper.deletePyDetectionImageByIds(ids);
    }

    /**
     * 删除检测图片记录信息
     * 
     * @param id 检测图片记录主键
     * @return 结果
     */
    @Override
    public int deletePyDetectionImageById(Long id)
    {
        return pyDetectionImageMapper.deletePyDetectionImageById(id);
    }
}
