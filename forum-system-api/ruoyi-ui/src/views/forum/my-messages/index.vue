<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>我的消息</span>
        <!-- <el-button
          style="float: right; padding: 3px 0"
          type="text"
          @click="handleClearAll">清空所有</el-button> -->
      </div>
      
      <el-table
        v-loading="loading"
        :data="messageList"
        style="width: 100%">
        <el-table-column
          prop="fromUserName"
          label="发送者"
          width="120">
        </el-table-column>
        <el-table-column
          prop="type"
          label="类型"
          width="100">
          <template slot-scope="scope">
            <el-tag :type="getMessageTypeTag(scope.row.type)">
              {{ getMessageTypeText(scope.row.type) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="content"
          label="内容"
          min-width="300">
        </el-table-column>
        <el-table-column
          prop="createTime"
          label="时间"
          width="180">
        </el-table-column>
        <!-- <el-table-column
          prop="isRead"
          label="状态"
          width="100">
          <template slot-scope="scope">
            <el-tag :type="scope.row.isRead === '1' ? 'info' : 'success'">
              {{ scope.row.isRead === '1' ? '已读' : '未读' }}
            </el-tag>
          </template>
        </el-table-column> -->
        <el-table-column
          label="操作"
          width="150">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="handleView(scope.row)">查看</el-button>
            <!-- <el-button
              size="mini"
              type="text"
              @click="handleDelete(scope.row)">删除</el-button> -->
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>

    <!-- 消息详情对话框 -->
    <el-dialog title="消息详情" :visible.sync="dialogVisible" width="500px" append-to-body>
      <div v-if="selectedMessage">
        <p><strong>发送者：</strong>{{ selectedMessage.fromUserName }}</p>
        <p><strong>类型：</strong>{{ getMessageTypeText(selectedMessage.type) }}</p>
        <p><strong>内容：</strong>{{ selectedMessage.content }}</p>
        <p><strong>时间：</strong>{{ selectedMessage.createTime }}</p>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMessages, delMessage, clearMessages, markMessageAsRead } from "@/api/forum/message";

export default {
  name: "MyMessages",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 消息列表
      messageList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      // 对话框显示状态
      dialogVisible: false,
      // 选中的消息
      selectedMessage: null
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询消息列表 */
    getList() {
      this.loading = true;
      listMessages(this.queryParams).then(response => {
        this.messageList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.selectedMessage = row;
      this.dialogVisible = true;
      // 如果消息未读，标记为已读
      if (row.isRead === '0') {
        markMessageAsRead(row.id).then(() => {
          row.isRead = '1';
        });
      }
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$modal.confirm('是否确认删除该消息？').then(function() {
        return delMessage(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 清空所有消息 */
    handleClearAll() {
      this.$modal.confirm('是否确认清空所有消息？').then(function() {
        return clearMessages();
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("清空成功");
      }).catch(() => {});
    },
    /** 获取消息类型标签样式 */
    getMessageTypeTag(type) {
      const typeMap = {
        '1': 'primary',   // 评论
        '2': 'success',   // 点赞
        '3': 'warning',   // 关注
        '4': 'info'       // 系统
      };
      return typeMap[type] || 'info';
    },
    /** 获取消息类型文本 */
    getMessageTypeText(type) {
      const typeMap = {
        '1': '评论',
        '2': '点赞',
        '3': '关注',
        '4': '系统'
      };
      return typeMap[type] || '未知';
    }
  }
};
</script> 