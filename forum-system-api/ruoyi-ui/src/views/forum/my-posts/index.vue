<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>我的帖子</span>
      </div>
      
      <el-table
        v-loading="loading"
        :data="postList"
        style="width: 100%">
        <el-table-column
          prop="title"
          label="标题"
          min-width="200">
        </el-table-column>
        <el-table-column
          prop="createTime"
          label="发布时间"
          width="180">
          <template slot-scope="scope">
            {{ parseTime(scope.row.createTime) }}
          </template>
        </el-table-column>
        <!-- <el-table-column
          prop="viewCount"
          label="浏览数"
          width="100">
          <template slot-scope="scope">
            {{ scope.row.viewCount || 0 }}
          </template>
        </el-table-column> -->
        <el-table-column
          prop="commentCount"
          label="评论数"
          width="100">
          <template slot-scope="scope">
            {{ scope.row.commentCount || 0 }}
          </template>
        </el-table-column>
        <el-table-column
          label="操作"
          width="">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleView(scope.row)">查看</el-button>
            <el-button
              size="mini"
              type="primary"
              @click="handleEdit(scope.row)">编辑</el-button>
            <!-- <el-button
              size="mini"
              type="danger"
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
  </div>
</template>

<script>
import { listMyPosts, delPost } from "@/api/forum/post";
import { parseTime } from "@/utils/ruoyi";

export default {
  name: "MyPosts",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 帖子列表
      postList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询帖子列表 */
    getList() {
      this.loading = true;
      listMyPosts(this.queryParams).then(response => {
        console.log('My posts response:', response);
        // Transform the data to ensure all fields are present
        this.postList = response.rows.map(post => {
          return {
            ...post,
            createTime: post.createTime || new Date(),
            viewCount: post.viewCount || 0,
            commentCount: post.commentCount || 0
          };
        });
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.$router.push(`/forum/post/${row.id}`);
    },
    /** 编辑按钮操作 */
    handleEdit(row) {
      this.$router.push(`/forum/create-post?id=${row.id}`);
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$modal.confirm('是否确认删除帖子编号为"' + row.id + '"的数据项？').then(function() {
        return delPost(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script> 