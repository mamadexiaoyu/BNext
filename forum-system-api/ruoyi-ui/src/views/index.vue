<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24" style="padding-left: 20px; padding-right: 20px">
        <h2>Python图像检测-论坛系统</h2>
        <p>
          欢迎使用，论坛系统，分享知识、讨论问题和交流经验。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-tag type="primary" style="margin-left: 8px">资源共享</el-tag>
          <el-tag type="warning" style="margin-left: 8px">问答互动</el-tag>
        </p>
      </el-col>
    </el-row>
    <el-divider />
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "1.0.0",
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul, ol {
    padding-left: 20px;
    margin: 15px 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #555;
  overflow-x: hidden;

  ul {
    list-style-type: disc;
  }
  
  ol {
    list-style-type: decimal;
  }

  h4 {
    margin-top: 0px;
    margin-bottom: 10px;
    font-weight: 600;
    color: #333;
  }

  h2 {
    margin-top: 10px;
    font-size: 28px;
    font-weight: 300;
    color: #333;
  }

  p {
    margin-top: 10px;
    line-height: 1.5;

    b {
      font-weight: 700;
    }
  }
  
  .el-image {
    display: block;
    margin-bottom: 15px;
    width: 100%;
    border-radius: 4px;
  }
  
  .el-card {
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
    
    .el-card__header {
      padding: 15px 20px;
      font-size: 16px;
      font-weight: 600;
    }
  }
  
  .body {
    padding: 10px 0;
    
    li {
      margin-bottom: 8px;
      line-height: 1.6;
    }
  }
  
  .feature-item {
    padding: 15px;
    margin-bottom: 15px;
    background-color: #f9f9f9;
    border-radius: 6px;
    height: 130px;
    
    h4 {
      color: #409EFF;
    }
    
    p {
      font-size: 13px;
      margin-top: 8px;
    }
  }
}
</style>

