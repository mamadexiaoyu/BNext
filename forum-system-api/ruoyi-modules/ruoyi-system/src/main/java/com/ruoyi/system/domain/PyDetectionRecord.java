package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 图像检测记录对象 py_detection_record
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
public class PyDetectionRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检测ID */
    private Long id;

    /** 原始图片ID */
    @Excel(name = "原始图片ID")
    private Long originalImageId;

    /** 检测结果图片URL */
    @Excel(name = "检测结果图片URL")
    private String resultImageUrl;

    /** 处理时间(毫秒) */
    @Excel(name = "处理时间(毫秒)")
    private Long processingTime;

    /** 检测模型名称 */
    @Excel(name = "检测模型名称")
    private String modelName;

    /** 检测对象数量 */
    @Excel(name = "检测对象数量")
    private Long objectCount;

    /** 图片宽度 */
    @Excel(name = "图片宽度")
    private Long imageWidth;

    /** 图片高度 */
    @Excel(name = "图片高度")
    private Long imageHeight;

    /** 检测对象详情JSON数组 */
    @Excel(name = "检测对象详情JSON数组")
    private String detectionItems;

    /** 状态(0:处理中 1:完成 2:失败) */
    @Excel(name = "状态(0:处理中 1:完成 2:失败)")
    private Long status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setOriginalImageId(Long originalImageId) 
    {
        this.originalImageId = originalImageId;
    }

    public Long getOriginalImageId() 
    {
        return originalImageId;
    }

    public void setResultImageUrl(String resultImageUrl) 
    {
        this.resultImageUrl = resultImageUrl;
    }

    public String getResultImageUrl() 
    {
        return resultImageUrl;
    }

    public void setProcessingTime(Long processingTime) 
    {
        this.processingTime = processingTime;
    }

    public Long getProcessingTime() 
    {
        return processingTime;
    }

    public void setModelName(String modelName) 
    {
        this.modelName = modelName;
    }

    public String getModelName() 
    {
        return modelName;
    }

    public void setObjectCount(Long objectCount) 
    {
        this.objectCount = objectCount;
    }

    public Long getObjectCount() 
    {
        return objectCount;
    }

    public void setImageWidth(Long imageWidth) 
    {
        this.imageWidth = imageWidth;
    }

    public Long getImageWidth() 
    {
        return imageWidth;
    }

    public void setImageHeight(Long imageHeight) 
    {
        this.imageHeight = imageHeight;
    }

    public Long getImageHeight() 
    {
        return imageHeight;
    }

    public void setDetectionItems(String detectionItems) 
    {
        this.detectionItems = detectionItems;
    }

    public String getDetectionItems() 
    {
        return detectionItems;
    }

    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("originalImageId", getOriginalImageId())
            .append("resultImageUrl", getResultImageUrl())
            .append("processingTime", getProcessingTime())
            .append("modelName", getModelName())
            .append("objectCount", getObjectCount())
            .append("imageWidth", getImageWidth())
            .append("imageHeight", getImageHeight())
            .append("detectionItems", getDetectionItems())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
