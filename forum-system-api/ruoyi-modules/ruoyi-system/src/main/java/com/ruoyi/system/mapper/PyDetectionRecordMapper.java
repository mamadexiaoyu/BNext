package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.PyDetectionRecord;

/**
 * 图像检测记录Mapper接口
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
public interface PyDetectionRecordMapper 
{
    /**
     * 查询图像检测记录
     * 
     * @param id 图像检测记录主键
     * @return 图像检测记录
     */
    public PyDetectionRecord selectPyDetectionRecordById(Long id);

    /**
     * 查询图像检测记录列表
     * 
     * @param pyDetectionRecord 图像检测记录
     * @return 图像检测记录集合
     */
    public List<PyDetectionRecord> selectPyDetectionRecordList(PyDetectionRecord pyDetectionRecord);

    /**
     * 新增图像检测记录
     * 
     * @param pyDetectionRecord 图像检测记录
     * @return 结果
     */
    public int insertPyDetectionRecord(PyDetectionRecord pyDetectionRecord);

    /**
     * 修改图像检测记录
     * 
     * @param pyDetectionRecord 图像检测记录
     * @return 结果
     */
    public int updatePyDetectionRecord(PyDetectionRecord pyDetectionRecord);

    /**
     * 删除图像检测记录
     * 
     * @param id 图像检测记录主键
     * @return 结果
     */
    public int deletePyDetectionRecordById(Long id);

    /**
     * 批量删除图像检测记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyDetectionRecordByIds(Long[] ids);

    /**
     * 根据ids查询图像检测记录
     * 
     * @param ids 需要查询的数据主键集合
     * @return 图像检测记录集合
     */
    public List<PyDetectionRecord> selectPyDetectionRecordByIds(List<Long> ids);
}
