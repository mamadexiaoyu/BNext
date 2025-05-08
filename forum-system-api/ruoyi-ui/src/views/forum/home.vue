<template>
  <div class="forum-home">
    <div class="forum-header">
      <p>欢迎来到我们的图像检测(Python)论坛社区，在这里您可以发表帖子、参与讨论</p>
      <div class="header-buttons">
        <el-button v-if="token" type="primary" @click="$router.push('/forum/create-post')">发布新帖</el-button>
        <el-button v-else type="primary" @click="$router.push('/forum/login')">登录发布</el-button>
        <el-button type="success" @click="$router.push('/forum/image-detection')">
          <i class="el-icon-camera"></i> 图像检测
        </el-button>
      </div>
    </div>
    
    <el-card v-loading="forumLoading" class="filter-card">
      <div class="filter-container">
        <el-input v-model="searchQuery" placeholder="搜索帖子" class="search-input" @keyup.enter.native="handleSearch"></el-input>
        <el-select v-model="sortBy" placeholder="排序方式" @change="handleSortChange">
          <el-option label="最新发布" value="newest"></el-option>
          <el-option label="最多评论" value="comments"></el-option>
          <el-option label="最多点赞" value="likes"></el-option>
        </el-select>
        <el-button type="primary" @click="handleSearch">搜索</el-button>
      </div>
    </el-card>
    
    <div class="post-list">
      <el-card v-for="post in forumPosts" :key="post.id" class="post-card" shadow="hover">
        <div class="post-layout">
          <!-- 左侧用户信息区域 -->
          <div class="post-user-info">
            <el-avatar :size="60" :src="post.avatar || defaultAvatar" @click.stop="goToUserProfile(post.userId)"></el-avatar>
            <div class="author-info">
              <div class="author-name">{{ post.userName || '匿名用户' }}</div>
              <div class="post-time">{{ formatDate(post.createTime) }}</div>
            </div>
          </div>
          
          <!-- 右侧内容区域 -->
          <div class="post-content-area">
            <!-- 标题 -->
            <div class="post-header" @click="goToPostDetail(post.id)">
              <h3 class="post-title">{{ post.title }}</h3>
            </div>
            
            <!-- 图片 -->
            <div class="post-images-container" v-if="post.images && post.images.length" @click="goToPostDetail(post.id)">
              <el-image 
                v-for="(image, index) in getImageArray(post.images).slice(0, 3)"
                :key="index"
                :src="image"
                :preview-src-list="getImageArray(post.images)"
                class="post-image"
                fit="cover">
              </el-image>
              <div v-if="getImageArray(post.images).length > 3" class="more-images">
                +{{ getImageArray(post.images).length - 3 }} 张图片
              </div>
            </div>
            
            <!-- 内容 -->
            <div class="post-content" @click="goToPostDetail(post.id)">
              {{ post.content && post.content.length > 150 ? post.content.substring(0, 150) + '...' : post.content }}
            </div>
            
            <!-- 标签 -->
            <div class="post-tags" v-if="post.tags && post.tags.length" @click="goToPostDetail(post.id)">
              <el-tag 
                v-for="(tag, index) in getTagArray(post.tags)" 
                :key="index" 
                size="small" 
                type="info" 
                effect="plain">
                {{ tag }}
              </el-tag>
            </div>
          </div>
        </div>
        
        <div class="post-stats">
          <!-- <span class="views">
            <i class="el-icon-view"></i> {{ post.viewCount || 0 }} 浏览
          </span> -->
          <span class="comments">
            <i class="el-icon-chat-line-square"></i> {{ post.commentCount || 0 }} 评论
          </span>
          <!-- <span class="likes">
            <i class="el-icon-star-off"></i> {{ post.likeCount || 0 }} 点赞
          </span> -->
        </div>
      </el-card>
      
      <div v-if="forumPosts.length === 0 && !forumLoading" class="empty-posts">
        <i class="el-icon-chat-dot-square empty-icon"></i>
        <p>暂无帖子</p>
      </div>
    </div>
    
    <div class="pagination">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="pageSize"
        :current-page.sync="currentPage"
        @current-change="handlePageChange">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import { parseTime } from '@/utils/ruoyi';
import { listPost } from '@/api/forum/post';
import { getToken } from '@/utils/auth';

export default {
  name: 'ForumHome',
  data() {
    return {
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderByColumn: 'create_time',
        isAsc: 'desc'
      },
      token: getToken(),
      total: 0,
      pageSize: 10,
      currentPage: 1,
      searchQuery: '',
      sortBy: 'newest',
      forumPosts: [],
      forumLoading: false,
      defaultAvatar: require('@/assets/images/profile.jpg')
    };
  },
  created() {
    this.getList();
  },
  mounted() {
    // 监听登录状态变化
    window.addEventListener('storage', this.handleStorageChange);
  },
  beforeDestroy() {
    window.removeEventListener('storage', this.handleStorageChange);
  },
  methods: {
    /** 查询帖子列表 */
    getList() {
      this.forumLoading = true;
      listPost(this.queryParams).then(response => {
        // 确保帖子列表数据结构一致
        if (response.rows && Array.isArray(response.rows)) {
          this.forumPosts = response.rows;
          // 修复默认头像路径
          this.forumPosts.forEach(post => {
            if (post.avatar) {
              if (!post.avatar.startsWith('http') && !post.avatar.startsWith('/')) {
                post.avatar = process.env.VUE_APP_BASE_API + post.avatar + '?t=' + new Date().getTime();
              } else {
                post.avatar = post.avatar + '?t=' + new Date().getTime();
              }
            }
          });
        } else {
          this.forumPosts = [];
        }
        this.total = response.total || 0;
        this.forumLoading = false;
      }).catch(error => {
        console.error('获取帖子列表失败:', error);
        this.forumPosts = [];
        this.total = 0;
        this.forumLoading = false;
      });
    },
    /** 搜索帖子 */
    handleSearch() {
      this.queryParams.pageNum = 1;
      this.queryParams.title = this.searchQuery;
      this.getList();
    },
    /** 排序方式改变 */
    handleSortChange() {
      this.queryParams.pageNum = 1;
      switch (this.sortBy) {
        case 'newest':
          this.queryParams.orderByColumn = 'create_time';
          this.queryParams.isAsc = 'desc';
          break;
        case 'comments':
          this.queryParams.orderByColumn = 'comment_count';
          this.queryParams.isAsc = 'desc';
          break;
        case 'likes':
          this.queryParams.orderByColumn = 'like_count';
          this.queryParams.isAsc = 'desc';
          break;
      }
      this.getList();
    },
    /** 页码改变 */
    handlePageChange(page) {
      this.queryParams.pageNum = page;
      this.getList();
    },
    /** 跳转到帖子详情 */
    goToPostDetail(postId) {
      this.$router.push(`/forum/post/${postId}`);
    },
    /** 跳转到用户资料 */
    goToUserProfile(userId) {
      // 暂时先跳转到自己的资料页
      this.$router.push('/forum/profile');
    },
    /** 格式化日期 */
    formatDate(time) {
      if (!time) return '';
      return parseTime(time, '{y}-{m}-{d} {h}:{i}');
    },
    /** 将逗号分隔的图片字符串转为数组 */
    getImageArray(images) {
      if (!images) return [];
      const timestamp = new Date().getTime();
      return images.split(',').filter(item => item).map(img => {
        if (img.startsWith('http://') || img.startsWith('https://')) {
          return img + '?t=' + timestamp;
        }
        return process.env.VUE_APP_BASE_API + img + '?t=' + timestamp;
      });
    },
    /** 将逗号分隔的标签字符串转为数组 */
    getTagArray(tags) {
      if (!tags) return [];
      return tags.split(',').filter(item => item);
    },
    // 监听登录状态变化
    handleStorageChange(e) {
      if (e.key === 'token') {
        this.token = getToken();
      }
    }
  }
};
</script>

<style scoped>
.forum-home {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 15px;
}

.forum-header {
  text-align: center;
  padding: 40px 0;
}

.forum-header h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  color: #409EFF;
}

.forum-header p {
  font-size: 1.2rem;
  color: #666;
  margin-bottom: 1.5rem;
}

.header-buttons {
  display: flex;
  gap: 10px;
  justify-content: center;
}

.filter-card {
  margin-bottom: 20px;
}

.filter-container {
  display: flex;
  gap: 15px;
}

.search-input {
  flex: 1;
}

.post-list {
  margin-top: 20px;
}

.post-card {
  margin-bottom: 20px;
  transition: transform 0.2s, box-shadow 0.2s;
  overflow: hidden;
}

.post-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* 新布局样式 */
.post-layout {
  display: flex;
  margin-bottom: 15px;
  padding: 5px 0;
}

.post-user-info {
  width: 90px;
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-right: 15px;
  border-right: 1px solid #ebeef5;
}

.post-content-area {
  flex: 1;
  padding-left: 20px;
  display: flex;
  flex-direction: column;
}

.author-info {
  text-align: center;
  margin-top: 10px;
  width: 100%;
}

.author-name {
  font-weight: bold;
  color: #303133;
  margin-bottom: 5px;
  word-break: break-all;
  font-size: 0.9rem;
}

.post-time {
  font-size: 0.75rem;
  color: #909399;
}

.post-header {
  cursor: pointer;
  margin-bottom: 15px;
}

.post-title {
  margin: 0;
  font-size: 1.3rem;
  color: #409EFF;
  line-height: 1.3;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.post-images-container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 15px;
  cursor: pointer;
  text-align: center;
}

.post-image {
  width: 160px;
  height: 160px;
  border-radius: 4px;
  object-fit: cover;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s;
}

.post-image:hover {
  transform: scale(1.03);
}

.more-images {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 160px;
  height: 160px;
  background-color: rgba(0, 0, 0, 0.03);
  border-radius: 4px;
  color: #909399;
  font-size: 14px;
}

.post-content {
  color: #606266;
  margin: 15px 0;
  line-height: 1.6;
  cursor: pointer;
  padding: 0 10px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.post-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 10px;
  cursor: pointer;
}

.post-stats {
  display: flex;
  color: #909399;
  border-top: 1px solid #ebeef5;
  padding-top: 15px;
  justify-content: flex-end;
}

.post-stats span {
  margin-right: 20px;
  display: flex;
  align-items: center;
}

.post-stats i {
  margin-right: 5px;
}

.empty-posts {
  text-align: center;
  padding: 50px 0;
  color: #909399;
}

.empty-icon {
  font-size: 60px;
  color: #DCDFE6;
  margin-bottom: 20px;
}

.pagination {
  text-align: center;
  margin-top: 30px;
  margin-bottom: 50px;
}

.el-avatar {
  cursor: pointer;
}
</style> 