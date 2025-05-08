package com.ruoyi.system.controller;

import java.util.Date;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.PyDetectionRecord;
import com.ruoyi.system.service.IPyDetectionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.PyDetectionImage;
import com.ruoyi.system.service.IPyDetectionImageService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 检测图片记录Controller
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
@RestController
@RequestMapping("/image")
public class PyDetectionImageController extends BaseController
{
    @Autowired
    private IPyDetectionImageService pyDetectionImageService;
    @Autowired
    private IPyDetectionRecordService pyDetectionRecordService;

    /**
     * 查询检测图片记录列表
     */
    @RequiresPermissions("system:image:list")
    @GetMapping("/list")
    public TableDataInfo list(PyDetectionImage pyDetectionImage)
    {
        startPage();
        List<PyDetectionImage> list = pyDetectionImageService.selectPyDetectionImageList(pyDetectionImage);
        return getDataTable(list);
    }

    /**
     * 导出检测图片记录列表
     */
    @RequiresPermissions("system:image:export")
    @Log(title = "检测图片记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PyDetectionImage pyDetectionImage)
    {
        List<PyDetectionImage> list = pyDetectionImageService.selectPyDetectionImageList(pyDetectionImage);
        ExcelUtil<PyDetectionImage> util = new ExcelUtil<PyDetectionImage>(PyDetectionImage.class);
        util.exportExcel(response, list, "检测图片记录数据");
    }

    /**
     * 获取检测图片记录详细信息
     */
    @RequiresPermissions("system:image:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(pyDetectionImageService.selectPyDetectionImageById(id));
    }

    /**
     * 新增检测图片记录
     */
    @Log(title = "检测图片记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PyDetectionImage pyDetectionImage)
    {

        pyDetectionImageService.insertPyDetectionImage(pyDetectionImage);
        // 新增历史记录
        PyDetectionRecord pyDetectionRecord = new PyDetectionRecord();
        pyDetectionRecord.setOriginalImageId(pyDetectionImage.getId());
        pyDetectionRecord.setResultImageUrl(pyDetectionImage.getUrl());
        pyDetectionRecord.setStatus(0L);
        pyDetectionRecord.setCreateTime(new Date());
        pyDetectionRecordService.insertPyDetectionRecord(pyDetectionRecord);

        return toAjax(pyDetectionImageService.insertPyDetectionImage(pyDetectionImage));
    }

    /**
     * 修改检测图片记录
     */
    @RequiresPermissions("system:image:edit")
    @Log(title = "检测图片记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PyDetectionImage pyDetectionImage)
    {
        return toAjax(pyDetectionImageService.updatePyDetectionImage(pyDetectionImage));
    }

    /**
     * 删除检测图片记录
     */
    @RequiresPermissions("system:image:remove")
    @Log(title = "检测图片记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(pyDetectionImageService.deletePyDetectionImageByIds(ids));
    }
}
