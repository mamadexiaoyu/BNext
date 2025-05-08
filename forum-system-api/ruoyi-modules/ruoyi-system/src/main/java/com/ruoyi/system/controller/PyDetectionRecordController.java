package com.ruoyi.system.controller;

import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.PyDetectionRecord;
import com.ruoyi.system.service.IPyDetectionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 图像检测记录Controller
 *
 * @author ruoyi
 * @date 2025-03-20
 */
@RestController
@RequestMapping("/record")
public class PyDetectionRecordController extends BaseController {
    @Autowired
    private IPyDetectionRecordService pyDetectionRecordService;

    /**
     * 查询图像检测记录列表
     */
    @GetMapping("/list")
    public TableDataInfo list(PyDetectionRecord pyDetectionRecord) {
        startPage();
        List<PyDetectionRecord> list = pyDetectionRecordService.selectPyDetectionRecordList(pyDetectionRecord);
        return getDataTable(list);
    }

    /**
     * 导出图像检测记录列表
     */
    @RequiresPermissions("system:record:export")
    @Log(title = "图像检测记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PyDetectionRecord pyDetectionRecord) {
        List<PyDetectionRecord> list = pyDetectionRecordService.selectPyDetectionRecordList(pyDetectionRecord);
        ExcelUtil<PyDetectionRecord> util = new ExcelUtil<PyDetectionRecord>(PyDetectionRecord.class);
        util.exportExcel(response, list, "图像检测记录数据");
    }

    /**
     * 获取图像检测记录详细信息
     */
    @RequiresPermissions("system:record:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(pyDetectionRecordService.selectPyDetectionRecordById(id));
    }

    /**
     * 新增图像检测记录
     */
    @RequiresPermissions("system:record:add")
    @Log(title = "图像检测记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PyDetectionRecord pyDetectionRecord) {
        return toAjax(pyDetectionRecordService.insertPyDetectionRecord(pyDetectionRecord));
    }

    /**
     * 修改图像检测记录
     */
    @RequiresPermissions("system:record:edit")
    @Log(title = "图像检测记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PyDetectionRecord pyDetectionRecord) {
        return toAjax(pyDetectionRecordService.updatePyDetectionRecord(pyDetectionRecord));
    }

    /**
     * 删除图像检测记录
     */
    @RequiresPermissions("system:record:remove")
    @Log(title = "图像检测记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(pyDetectionRecordService.deletePyDetectionRecordByIds(ids));
    }
}
