package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.system.domain.PyDetectionRecord;
import com.ruoyi.system.mapper.PyDetectionRecordMapper;
import com.ruoyi.system.service.IPyDetectionRecordService;
import com.ruoyi.system.service.ISysForumMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

/**
 * 图像检测记录Service业务层处理
 *
 * @author ruoyi
 * @date 2025-03-20
 */
@Service
public class PyDetectionRecordServiceImpl implements IPyDetectionRecordService {
    @Autowired
    private PyDetectionRecordMapper pyDetectionRecordMapper;
    @Autowired
    private ISysForumMessageService iSysForumMessageService;

    /**
     * 查询图像检测记录
     *
     * @param id 图像检测记录主键
     * @return 图像检测记录
     */
    @Override
    public PyDetectionRecord selectPyDetectionRecordById(Long id) {
        return pyDetectionRecordMapper.selectPyDetectionRecordById(id);
    }

    /**
     * 查询图像检测记录列表
     *
     * @param pyDetectionRecord 图像检测记录
     * @return 图像检测记录
     */
    @Override
    public List<PyDetectionRecord> selectPyDetectionRecordList(PyDetectionRecord pyDetectionRecord) {
        return pyDetectionRecordMapper.selectPyDetectionRecordList(pyDetectionRecord);
    }

    /**
     * 新增图像检测记录
     *
     * @param pyDetectionRecord 图像检测记录
     * @return 结果
     */
    @Override
    public int insertPyDetectionRecord(PyDetectionRecord pyDetectionRecord) {
        pyDetectionRecord.setCreateTime(DateUtils.getNowDate());
        return pyDetectionRecordMapper.insertPyDetectionRecord(pyDetectionRecord);
    }

    /**
     * 修改图像检测记录
     *
     * @param pyDetectionRecord 图像检测记录
     * @return 结果
     */
    @Override
    public int updatePyDetectionRecord(PyDetectionRecord pyDetectionRecord) {
        pyDetectionRecord.setUpdateTime(DateUtils.getNowDate());
        return pyDetectionRecordMapper.updatePyDetectionRecord(pyDetectionRecord);
    }

    /**
     * 批量删除图像检测记录
     *
     * @param ids 需要删除的图像检测记录主键
     * @return 结果
     */
    @Override
    public int deletePyDetectionRecordByIds(Long[] ids) {
        return pyDetectionRecordMapper.deletePyDetectionRecordByIds(ids);
    }

    /**
     * 删除图像检测记录信息
     *
     * @param id 图像检测记录主键
     * @return 结果
     */
    @Override
    public int deletePyDetectionRecordById(Long id) {
        return pyDetectionRecordMapper.deletePyDetectionRecordById(id);
    }

    /**
     * 批量检测图像检测记录-调用Python接口
     *
     * @param ids 需要检测的记录ID
     * @return 结果
     */
    @Override
    public int batchDetect(List<Long> ids) {
        //根据ids获取记录
        List<PyDetectionRecord> pyDetectionRecord = pyDetectionRecordMapper.selectPyDetectionRecordByIds(ids);
        pyDetectionRecord.forEach(item -> {
            //获取用户id
            Long userId = Long.valueOf(item.getCreateBy());
            //获取消息内容
            String content = "您有新的图像检测记录，请及时查看";

            // 调用Python接口,http调用
            String url = "http://localhost:8080/detect";
            RestTemplate restTemplate = new RestTemplate();
// 发送POST请求
            HttpEntity<List<Long>> requestEntity = new HttpEntity<>(ids);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);
// 获取响应结果
            String result = response.getBody();
// 将打印结果
            System.out.println(result);

            //发送通知消息
            iSysForumMessageService.sendSystemMessage(userId, content);
        });

        return 1;
    }
}
