package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 检测图片记录对象 py_detection_image
 * 
 * @author ruoyi
 * @date 2025-03-20
 */
public class PyDetectionImage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片ID */
    private Long id;

    /** 图片URL路径 */
    @Excel(name = "图片URL路径")
    private String url;

    /** 原始文件名 */
    @Excel(name = "原始文件名")
    private String fileName;

    /** 文件大小(字节) */
    @Excel(name = "文件大小(字节)")
    private Long fileSize;

    /** 图片宽度 */
    @Excel(name = "图片宽度")
    private Long width;

    /** 图片高度 */
    @Excel(name = "图片高度")
    private Long height;

    /** 图片MIME类型 */
    @Excel(name = "图片MIME类型")
    private String mimeType;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }

    public void setFileName(String fileName) 
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }

    public void setFileSize(Long fileSize) 
    {
        this.fileSize = fileSize;
    }

    public Long getFileSize() 
    {
        return fileSize;
    }

    public void setWidth(Long width) 
    {
        this.width = width;
    }

    public Long getWidth() 
    {
        return width;
    }

    public void setHeight(Long height) 
    {
        this.height = height;
    }

    public Long getHeight() 
    {
        return height;
    }

    public void setMimeType(String mimeType) 
    {
        this.mimeType = mimeType;
    }

    public String getMimeType() 
    {
        return mimeType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("url", getUrl())
            .append("fileName", getFileName())
            .append("fileSize", getFileSize())
            .append("width", getWidth())
            .append("height", getHeight())
            .append("mimeType", getMimeType())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .toString();
    }
}
