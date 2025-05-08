<template>
  <div class="home-page">
    <el-row :gutter="20">
      <el-col :span="18">
        <div class="content-section">
          <div class="section-header">
            <h2>最新帖子</h2>
            <el-input
              placeholder="搜索帖子"
              v-model="searchQuery"
              class="search-input"
              prefix-icon="el-icon-search"
            ></el-input>
          </div>
          
          <div class="post-filter">
            <el-radio-group v-model="filter" size="medium">
              <el-radio-button label="all">全部</el-radio-button>
              <el-radio-button label="hot">热门</el-radio-button>
              <el-radio-button label="latest">最新</el-radio-button>
            </el-radio-group>
          </div>
          
          <div class="post-list">
            <div v-for="post in filteredPosts" :key="post.id" class="post-item">
              <h3 class="post-title">{{ post.title }}</h3>
              <div class="post-meta">
                <span>{{ post.author }}</span>
                <span>{{ post.date }}</span>
                <span>{{ post.comments ? post.comments.length : 0 }} 评论</span>
              </div>
              <div class="post-content">{{ post.content }}</div>
              <div class="post-actions">
                <el-button type="text" @click="showComments(post)">
                  查看评论 <i class="el-icon-chat-dot-round"></i>
                </el-button>
              </div>
              
              <!-- 评论区域 -->
              <div v-if="post.showComments" class="comment-section">
                <h4>评论 ({{ post.comments ? post.comments.length : 0 }})</h4>
                
                <div v-if="post.comments && post.comments.length > 0">
                  <div v-for="comment in post.comments" :key="comment.id" class="comment-item">
                    <div class="comment-meta">
                      <span>{{ comment.author }}</span>
                      <span>{{ comment.date }}</span>
                    </div>
                    <div class="comment-content">{{ comment.content }}</div>
                  </div>
                </div>
                <div v-else class="no-comments">
                  暂无评论
                </div>
                
                <div class="add-comment">
                  <el-input
                    type="textarea"
                    :rows="2"
                    placeholder="添加评论..."
                    v-model="newComments[post.id]"
                  ></el-input>
                  <div class="button-group">
                    <el-button type="primary" size="small" @click="addComment(post.id)">
                      发表评论
                    </el-button>
                  </div>
                </div>
              </div>
            </div>
            
            <div v-if="filteredPosts.length === 0" class="no-posts">
              <i class="el-icon-document"></i>
              <p>暂无帖子</p>
            </div>
          </div>
        </div>
      </el-col>
      
      <el-col :span="6">
        <div class="sidebar">
          <div class="content-section">
            <h3>欢迎来到社区论坛</h3>
            <p>这里是大家交流分享的地方，请遵守社区规则。</p>
            <el-button type="primary" @click="goToCreatePost">
              <i class="el-icon-edit"></i> 发布新帖子
            </el-button>
          </div>
          
          <div class="content-section">
            <h3>热门标签</h3>
            <div class="tag-cloud">
              <el-tag v-for="tag in popularTags" :key="tag.name" :type="tag.type" class="tag-item">
                {{ tag.name }}
              </el-tag>
            </div>
          </div>
          
          <div class="content-section">
            <h3>在线用户</h3>
            <div class="online-users">
              <div v-for="user in onlineUsers" :key="user.id" class="user-item">
                <el-avatar :size="32" :src="user.avatar"></el-avatar>
                <span>{{ user.name }}</span>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'home',
  data() {
    return {
      searchQuery: '',
      filter: 'all',
      newComments: {},
      popularTags: [
        { name: '技术分享', type: '' },
        { name: '问答', type: 'success' },
        { name: '活动', type: 'warning' },
        { name: '公告', type: 'danger' },
        { name: '讨论', type: 'info' },
        { name: '教程', type: 'success' }
      ],
      onlineUsers: [
        { id: 1, name: '用户001', avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png' },
        { id: 2, name: '用户002', avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png' },
        { id: 3, name: '用户003', avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png' },
        { id: 4, name: '用户004', avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png' }
      ]
    }
  },
  computed: {
    ...mapState({
      posts: state => state.posts
    }),
    filteredPosts() {
      let result = this.posts

      // 搜索过滤
      if (this.searchQuery) {
        const query = this.searchQuery.toLowerCase()
        result = result.filter(post => 
          post.title.toLowerCase().includes(query) || 
          post.content.toLowerCase().includes(query)
        )
      }

      // 类型过滤
      if (this.filter === 'hot') {
        result = [...result].sort((a, b) => 
          (b.comments ? b.comments.length : 0) - (a.comments ? a.comments.length : 0)
        )
      } else if (this.filter === 'latest') {
        result = [...result].sort((a, b) => 
          new Date(b.date) - new Date(a.date)
        )
      }

      return result
    }
  },
  methods: {
    ...mapActions(['fetchPosts', 'addComment']),
    showComments(post) {
      this.$set(post, 'showComments', !post.showComments)
    },
    goToCreatePost() {
      this.$router.push('/create-post')
    },
    addComment(postId) {
      if (this.newComments[postId] && this.newComments[postId].trim()) {
        this.addComment({ 
          postId, 
          content: this.newComments[postId] 
        })
        this.newComments[postId] = ''
      }
    }
  },
  created() {
    this.fetchPosts()
  }
}
</script>

<style scoped>
.home-page {
  margin-bottom: 30px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.section-header h2 {
  margin: 0;
}

.search-input {
  width: 250px;
}

.post-filter {
  margin-bottom: 20px;
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

.sidebar {
  position: sticky;
  top: 20px;
}

.sidebar .content-section {
  margin-bottom: 20px;
}

.sidebar h3 {
  margin-top: 0;
  margin-bottom: 15px;
  border-bottom: 1px solid #EBEEF5;
  padding-bottom: 10px;
}

.tag-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.tag-item {
  margin-right: 5px;
  margin-bottom: 5px;
}

.online-users {
  display: flex;
  flex-direction: column;
}

.user-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.user-item span {
  margin-left: 10px;
}

.no-comments {
  text-align: center;
  color: #909399;
  padding: 10px;
}

.add-comment {
  margin-top: 15px;
}
</style> 