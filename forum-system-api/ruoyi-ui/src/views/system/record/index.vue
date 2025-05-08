<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="检测ID" prop="id">
        <el-input v-model="queryParams.id" placeholder="请输入检测ID" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!-- 批量检测 -->
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="bacthDetect"
          v-hasPermi="['system:record:detect']">批量检测</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:record:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:record:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:record:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="检测ID" align="center" prop="id" />
      <el-table-column label="原始图片ID" align="center" prop="originalImageId" />
      <el-table-column label="检测结果图片URL" align="center" prop="resultImageUrl">
        <template slot-scope="scope">
          <el-image style="width: 80px; height: 60px" :src="scope.row.resultImageUrl"
            :preview-src-list="[scope.row.resultImageUrl]" fit="contain"></el-image>
        </template>
      </el-table-column>
      <el-table-column label="处理时间(毫秒)" align="center" prop="processingTime" />
      <el-table-column label="检测模型名称" align="center" prop="modelName" />
      <el-table-column label="检测对象数量" align="center" prop="objectCount" />
      <el-table-column label="图片宽度" align="center" prop="imageWidth" />
      <el-table-column label="图片高度" align="center" prop="imageHeight" />
      <el-table-column label="检测对象详情JSON数组" align="center" prop="detectionItems" />
      <el-table-column label="状态(0:处理中 1:完成 2:失败)" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['system:record:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:record:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改图像检测记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="原始图片ID" prop="originalImageId">
          <el-input v-model="form.originalImageId" placeholder="请输入原始图片ID" />
        </el-form-item>
        <el-form-item label="检测结果图片URL" prop="resultImageUrl">
          <el-input v-model="form.resultImageUrl" placeholder="请输入检测结果图片URL" />
        </el-form-item>
        <el-form-item label="处理时间(毫秒)" prop="processingTime">
          <el-input v-model="form.processingTime" placeholder="请输入处理时间(毫秒)" />
        </el-form-item>
        <el-form-item label="检测模型名称" prop="modelName">
          <el-input v-model="form.modelName" placeholder="请输入检测模型名称" />
        </el-form-item>
        <el-form-item label="检测对象数量" prop="objectCount">
          <el-input v-model="form.objectCount" placeholder="请输入检测对象数量" />
        </el-form-item>
        <el-form-item label="图片宽度" prop="imageWidth">
          <el-input v-model="form.imageWidth" placeholder="请输入图片宽度" />
        </el-form-item>
        <el-form-item label="图片高度" prop="imageHeight">
          <el-input v-model="form.imageHeight" placeholder="请输入图片高度" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRecord, getRecord, delRecord, addRecord, updateRecord, batchDetect } from "@/api/system/record";

export default {
  name: "Record",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 图像检测记录表格数据
      recordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        originalImageId: null,
        resultImageUrl: null,
        processingTime: null,
        modelName: null,
        objectCount: null,
        imageWidth: null,
        imageHeight: null,
        detectionItems: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        originalImageId: [
          { required: true, message: "原始图片ID不能为空", trigger: "blur" }
        ],
        resultImageUrl: [
          { required: true, message: "检测结果图片URL不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 批量检测 */
    bacthDetect() {
      const ids = this.ids;
      if (ids.length === 0) {
        this.$modal.msgError("请选择需要检测的记录");
        return;
      }
      this.$modal.confirm('是否确认批量检测选中的图像检测记录？').then(function() {
        return batchDetect(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("批量检测成功");
      }).catch(() => {});
    },
    /** 查询图像检测记录列表 */
    getList() {
      this.loading = true;
      listRecord(this.queryParams).then(response => {
        this.recordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        originalImageId: null,
        resultImageUrl: null,
        processingTime: null,
        modelName: null,
        objectCount: null,
        imageWidth: null,
        imageHeight: null,
        detectionItems: null,
        status: null,
        createTime: null,
        updateTime: null,
        createBy: null,
        updateBy: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加图像检测记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改图像检测记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecord(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除图像检测记录编号为"' + ids + '"的数据项？').then(function () {
        return delRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/record/export', {
        ...this.queryParams
      }, `record_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
