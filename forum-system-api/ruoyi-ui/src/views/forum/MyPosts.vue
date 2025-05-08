<template>
  <div class="my-posts-page">
    <div class="content-section">
      <h2>我的帖子</h2>
      
      <div class="my-posts-header">
        <el-input
          placeholder="搜索我的帖子"
          v-model="searchQuery"
          class="search-input"
          prefix-icon="el-icon-search"
        ></el-input>
        <el-button type="primary" @click="$router.push('/create-post')">
          <i class="el-icon-plus"></i> 发布新帖子
        </el-button>
      </div>
      
      <el-tabs v-model="activeTab" @tab-click="handleTabClick">
        <el-tab-pane label="全部帖子" name="all"></el-tab-pane>
        <el-tab-pane label="已发布" name="published"></el-tab-pane>
        <el-tab-pane label="草稿" name="draft"></el-tab-pane>
      </el-tabs>
      
      <div class="post-list">
        <div v-if="filteredPosts.length === 0" class="no-posts">
          <i class="el-icon-document"></i>
          <p>您还没有发布任何帖子</p>
          <el-button type="primary" @click="$router.push('/create-post')">
            现在发布
          </el-button>
        </div>
        
        <el-table
          v-else
          :data="filteredPosts"
          style="width: 100%"
          @row-click="viewPost"
        >
          <el-table-column prop="title" label="标题">
            <template slot-scope="scope">
              <div class="post-title-cell">
                <span class="post-title">{{ scope.row.title }}</span>
                <el-tag size="mini" v-if="scope.row.isDraft" type="info">草稿</el-tag>
              </div>
            </template>
          </el-table-column>
          <el-table-column prop="date" label="发布时间" width="150"></el-table-column>
          <!-- <el-table-column prop="views" label="浏览量" width="100"></el-table-column> -->
          <el-table-column prop="comments" label="评论数" width="100">
            <template slot-scope="scope">
              {{ scope.row.comments ? scope.row.comments.length : 0 }}
            </template>
          </el-table-column>
          <el-table-column label="操作" width="200">
            <template slot-scope="scope">
              <el-button size="mini" @click.stop="editPost(scope.row)">
                编辑
              </el-button>
              <el-button size="mini" type="danger" @click.stop="confirmDelete(scope.row)">
                删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
    
    <!-- 查看帖子对话框 -->
    <el-dialog :title="currentPost.title" :visible.sync="postDetailVisible" width="70%">
      <div class="post-detail" v-if="currentPost">
        <div class="post-meta">
          <span>{{ currentPost.author }}</span>
          <span>{{ currentPost.date }}</span>
          <span>浏览量: {{ currentPost.views || 0 }}</span>
        </div>
        
        <div class="post-content">{{ currentPost.content }}</div>
        
        <div class="comment-section" v-if="currentPost.comments && currentPost.comments.length > 0">
          <h4>评论 ({{ currentPost.comments.length }})</h4>
          <div v-for="comment in currentPost.comments" :key="comment.id" class="comment-item">
            <div class="comment-meta">
              <span>{{ comment.author }}</span>
              <span>{{ comment.date }}</span>
            </div>
            <div class="comment-content">{{ comment.content }}</div>
          </div>
        </div>
      </div>
    </el-dialog>
    
    <!-- 确认删除对话框 -->
    <el-dialog
      title="确认删除"
      :visible.sync="deleteConfirmVisible"
      width="30%"
    >
      <p>确定要删除帖子"{{ postToDelete ? postToDelete.title : '' }}"吗？此操作不可恢复。</p>
      <span slot="footer" class="dialog-footer">
        <el-button @click="deleteConfirmVisible = false">取消</el-button>
        <el-button type="danger" @click="deletePost">确定删除</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'MyPostsPage',
  data() {
    return {
      searchQuery: '',
      activeTab: 'all',
      postDetailVisible: false,
      currentPost: {},
      deleteConfirmVisible: false,
      postToDelete: null
    }
  },
  computed: {
    ...mapState({
      myPosts: state => state.myPosts
    }),
    filteredPosts() {
      let result = this.myPosts

      // 模拟一些帖子标记为草稿
      result = result.map(post => ({
        ...post,
        isDraft: post.id % 2 === 0, // 仅为演示，实际应该从API获取
        views: Math.floor(Math.random() * 100) + 1 // 模拟随机浏览量
      }))

      // 按标签过滤
      if (this.activeTab === 'published') {
        result = result.filter(post => !post.isDraft)
      } else if (this.activeTab === 'draft') {
        result = result.filter(post => post.isDraft)
      }

      // 按搜索词过滤
      if (this.searchQuery) {
        const query = this.searchQuery.toLowerCase()
        result = result.filter(post =>
          post.title.toLowerCase().includes(query) || 
          post.content.toLowerCase().includes(query)
        )
      }

      return result
    }
  },
  methods: {
    ...mapActions(['fetchMyPosts']),
    handleTabClick(tab) {
      // 标签切换处理
    },
    viewPost(row) {
      this.currentPost = row
      this.postDetailVisible = true
    },
    editPost(post) {
      // 在实际应用中，这里会跳转到编辑页面
      this.$message.info(`编辑帖子: ${post.title}`)
    },
    confirmDelete(post) {
      this.postToDelete = post
      this.deleteConfirmVisible = true
    },
    deletePost() {
      // 在实际应用中，这里会调用删除API
      this.$message.success(`帖子"${this.postToDelete.title}"已删除`)
      this.deleteConfirmVisible = false
    }
  },
  created() {
    this.fetchMyPosts()
  }
}
</script>

<style scoped>
.my-posts-page {
  margin-bottom: 30px;
}

.my-posts-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.search-input {
  width: 250px;
}

.post-list {
  margin-top: 20px;
}

.no-posts {
  text-align: center;
  padding: 30px;
  color: #909399;
}

.no-posts i {
  font-size: 48px;
  margin-bottom: 10px;
}

.post-title-cell {
  display: flex;
  align-items: center;
}

.post-title {
  margin-right: 10px;
}

.post-detail {
  padding: 20px 0;
}

.post-meta {
  display: flex;
  color: #909399;
  font-size: 14px;
  margin-bottom: 15px;
}

.post-meta span {
  margin-right: 15px;
}

.post-content {
  line-height: 1.6;
  margin-bottom: 20px;
  white-space: pre-wrap;
}

.comment-section {
  margin-top: 20px;
  background-color: #f9f9f9;
  border-radius: 4px;
  padding: 15px;
}

.comment-item {
  padding: 10px 0;
  border-bottom: 1px solid #EBEEF5;
}

.comment-item:last-child {
  border-bottom: none;
}

.comment-meta {
  display: flex;
  justify-content: space-between;
  color: #909399;
  font-size: 13px;
  margin-bottom: 5px;
}

.comment-content {
  font-size: 14px;
  line-height: 1.5;
}
</style> 