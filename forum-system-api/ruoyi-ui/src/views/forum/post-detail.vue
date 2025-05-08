<template>
  <div class="post-detail" v-loading="loading">
    <div v-if="post">
      <el-card class="post-card">
        <div class="post-header">
          <h1 class="post-title">{{ post.title }}</h1>
          <div class="post-meta">
            <el-avatar :size="40" :src="post.avatar || defaultAvatar" @click="goToUserProfile(post.userId)"></el-avatar>
            <div class="post-info">
              <div class="author">{{ post.userName }}</div>
              <div class="time">发表于 {{ formatDate(post.createTime) }}</div>
            </div>
          </div>
          <div class="post-tags" v-if="post.tags">
            <el-tag 
              v-for="(tag, index) in getTagArray(post.tags)" 
              :key="index" 
              size="small" 
              effect="plain"
              class="post-tag">
              {{ tag }}
            </el-tag>
          </div>
        </div>
        
        <div class="post-content">
          <div class="content-text">{{ post.content }}</div>
          
          <div class="post-images" v-if="post.images">
            <el-image 
              v-for="(image, index) in getImageArray(post.images)"
              :key="index"
              :src="image"
              :preview-src-list="getImageArray(post.images)"
              class="post-image"
              fit="cover">
            </el-image>
          </div>
        </div>
        
        <div class="post-actions">
          <div class="post-stats">
            <!-- <span class="views"><i class="el-icon-view"></i> {{ post.viewCount || 0 }} 浏览</span> -->
            <span class="comments"><i class="el-icon-chat-line-square"></i> {{ commentTotal || 0 }} 评论</span>
            <!-- <span class="likes"><i class="el-icon-star-off"></i> {{ post.likeCount || 0 }} 点赞</span> -->
          </div>
          <!-- <div class="action-buttons">
            <el-button :type="isLiked ? 'primary' : 'text'" @click="handleLike">
              <i :class="isLiked ? 'el-icon-star-on' : 'el-icon-star-off'"></i> 点赞
            </el-button>
            <el-button type="text" @click="focusCommentInput">
              <i class="el-icon-chat-line-square"></i> 评论
            </el-button>
            <el-button type="text" @click="handleCollect">
              <i :class="isCollected ? 'el-icon-collection-tag' : 'el-icon-collection'"></i> 收藏
            </el-button>
            <el-button type="text" @click="handleShare">
              <i class="el-icon-share"></i> 分享
            </el-button>
          </div> -->
        </div>
      </el-card>
      
      <div class="comment-section">
        <h3 class="section-title">
          评论 ({{ commentTotal }})
        </h3>
        
        <div class="comment-editor">
          <el-input
            ref="commentInput"
            type="textarea"
            :rows="4"
            placeholder="写下你的评论..."
            v-model="commentContent"
          ></el-input>
          <div class="comment-actions">
            <el-button type="primary" @click="submitComment" :disabled="!commentContent.trim()">发表评论</el-button>
            <el-button v-if="replyTo" @click="cancelReply">取消回复</el-button>
          </div>
        </div>
        
        <div class="comment-list" v-loading="commentsLoading">
          <div v-if="comments.length > 0">
            <div v-for="comment in comments" :key="comment.id" class="comment-item">
              <div class="comment-avatar">
                <el-avatar :size="40" :src="comment.avatar || defaultAvatar" @click="goToUserProfile(comment.userId)"></el-avatar>
              </div>
              <div class="comment-content">
                <div class="comment-header">
                  <span class="comment-author">{{ comment.userName }}</span>
                  <span class="comment-time">{{ formatDate(comment.createTime) }}</span>
                </div>
                <div class="comment-text">
                  <span v-if="comment.replyUserName" class="reply-to">回复 <span class="reply-user">@{{ comment.replyUserName }}：</span></span>
                  {{ comment.content }}
                </div>
                <div class="comment-footer">
                  <el-button type="text" size="mini" @click="handleReply(comment)">
                    <i class="el-icon-chat-square"></i> 回复
                  </el-button>
                  <!-- <el-button :type="comment.isLiked ? 'text' : 'text'" size="mini" @click="handleLikeComment(comment)">
                    <i :class="comment.isLiked ? 'el-icon-star-on' : 'el-icon-star-off'"></i> 
                    {{ comment.likeCount || 0 }}
                  </el-button> -->
                  <el-button v-if="comment.userId === userId" type="text" size="mini" @click="handleDeleteComment(comment)">
                    <i class="el-icon-delete"></i> 删除
                  </el-button>
                </div>
                
                <div class="reply-list" v-if="comment.children && comment.children.length > 0">
                  <div v-for="reply in comment.children" :key="reply.id" class="reply-item">
                    <div class="reply-avatar">
                      <el-avatar :size="32" :src="reply.avatar || defaultAvatar" @click="goToUserProfile(reply.userId)"></el-avatar>
                    </div>
                    <div class="reply-content">
                      <div class="reply-header">
                        <span class="reply-author">{{ reply.userName }}</span>
                        <span class="reply-time">{{ formatDate(reply.createTime) }}</span>
                      </div>
                      <div class="reply-text">
                        <span v-if="reply.replyUserName" class="reply-to">回复 <span class="reply-user">@{{ reply.replyUserName }}：</span></span>
                        {{ reply.content }}
                      </div>
                      <div class="reply-footer">
                        <el-button type="text" size="mini" @click="handleReply(reply, comment)">
                          <i class="el-icon-chat-square"></i> 回复
                        </el-button>
                        <el-button :type="reply.isLiked ? 'text' : 'text'" size="mini" @click="handleLikeComment(reply)">
                          <i :class="reply.isLiked ? 'el-icon-star-on' : 'el-icon-star-off'"></i> 
                          {{ reply.likeCount || 0 }}
                        </el-button>
                        <el-button v-if="reply.userId === userId" type="text" size="mini" @click="handleDeleteComment(reply)">
                          <i class="el-icon-delete"></i> 删除
                        </el-button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div v-else-if="!commentsLoading" class="empty-comments">
            <i class="el-icon-chat-dot-square empty-icon"></i>
            <p>暂无评论，快来发表第一条评论吧</p>
          </div>
          
          <div class="comment-pagination" v-if="commentTotal > 0">
            <el-pagination
              background
              layout="prev, pager, next"
              :total="commentTotal"
              :page-size="queryParams.pageSize"
              :current-page.sync="queryParams.pageNum"
              @current-change="getComments">
            </el-pagination>
          </div>
        </div>
      </div>
    </div>
    
    <div v-else-if="!loading" class="post-not-found">
      <i class="el-icon-warning-outline"></i>
      <h2>帖子不存在或已被删除</h2>
      <el-button type="primary" @click="$router.push('/forum/home')">返回首页</el-button>
    </div>
  </div>
</template>

<script>
import { getPost, likePost, unlikePost } from '@/api/forum/post';
import { listComments, addComment, replyComment, deleteComment, likeComment, unlikeComment } from '@/api/forum/comment';
import { parseTime } from '@/utils/ruoyi';
import { getToken } from '@/utils/auth';
import { mapGetters } from 'vuex';

export default {
  name: 'PostDetail',
  data() {
    return {
      defaultAvatar: require('@/assets/images/profile.jpg'),
      post: null,
      commentContent: '',
      postId: null,
      loading: false,
      commentsLoading: false,
      comments: [],
      commentTotal: 0,
      replyTo: null,
      parentComment: null,
      isLiked: false,
      isCollected: false,
      queryParams: {
        // pageNum: 1,
        // pageSize: 10
      }
    };
  },
  computed: {
    ...mapGetters([
      'userId'
    ])
  },
  created() {
    this.postId = parseInt(this.$route.params.id);
    this.getPostDetail();
    this.getComments();
  },
  methods: {
    getPostDetail() {
      this.loading = true;
      getPost(this.postId).then(response => {
        if (response.code === 200 && response.data) {
          this.post = response.data;
          
          // 修复头像URL
          if (this.post.avatar) {
            if (!this.post.avatar.startsWith('http') && !this.post.avatar.startsWith('/')) {
              this.post.avatar = process.env.VUE_APP_BASE_API + this.post.avatar;
            }
          }
          
          document.title = this.post.title + ' - 社区论坛';
          // 模拟点赞和收藏状态，实际应从后端获取
          this.isLiked = false;
          this.isCollected = false;
        } else {
          this.$message.error(response.msg || '获取帖子详情失败');
          this.post = null;
        }
        this.loading = false;
      }).catch(error => {
        this.$message.error('获取帖子详情失败：' + (error.message || '未知错误'));
        this.post = null;
        this.loading = false;
      });
    },
    
    getComments() {
      this.commentsLoading = true;
      listComments(this.postId, this.queryParams).then(response => {
        // 处理后端可能返回的不同数据格式
        let commentList = [];
        if (response.data) {
          commentList = Array.isArray(response.data) ? response.data : [];
        } else if (response.rows) {
          commentList = Array.isArray(response.rows) ? response.rows : [];
        }
        
        // 处理头像URL
        commentList.forEach(comment => {
          if (comment.avatar) {
            if (!comment.avatar.startsWith('http') && !comment.avatar.startsWith('/')) {
              comment.avatar = process.env.VUE_APP_BASE_API + comment.avatar;
            }
          }
        });
        
        // 整理评论的父子关系
        const parentComments = [];
        const childrenMap = {};
        
        // 先将所有评论按父子关系分类
        commentList.forEach(comment => {
          comment.children = [];
          // 如果是顶层评论
          if (!comment.parentId || comment.parentId === 0) {
            parentComments.push(comment);
          } else {
            // 如果还没有这个父评论的子数组，创建一个
            if (!childrenMap[comment.parentId]) {
              childrenMap[comment.parentId] = [];
            }
            // 将回复添加到对应的父评论子数组中
            childrenMap[comment.parentId].push(comment);
          }
        });
        
        // 将子评论添加到父评论的children数组中
        parentComments.forEach(comment => {
          if (childrenMap[comment.id]) {
            comment.children = childrenMap[comment.id];
          }
        });
        
        this.comments = parentComments;
        this.commentTotal = commentList.length;
        this.commentsLoading = false;
      }).catch(() => {
        this.commentsLoading = false;
        this.comments = [];
        this.commentTotal = 0;
      });
    },
    
    submitComment() {
      if (!this.commentContent.trim()) return;
      
      // 检查用户是否登录
      if (!this.userId) {
        this.$message.warning('请先登录后再评论');
        return;
      }
      
      const data = {
        postId: this.postId,
        content: this.commentContent.trim()
      };
      
      // 如果是回复评论
      if (this.replyTo) {
        data.parentId = this.parentComment ? this.parentComment.id : this.replyTo.id;
        data.replyUserId = this.replyTo.userId;
        data.replyUserName = this.replyTo.userName;
      }
      
      addComment(this.postId, data).then(response => {
        if (response.code === 200) {
          this.$message.success(this.replyTo ? '回复成功' : '评论发表成功');
          this.commentContent = '';
          this.replyTo = null;
          this.parentComment = null;
          this.getComments();
          // 更新帖子评论数
          if (this.post) {
            this.post.commentCount = (this.post.commentCount || 0) + 1;
          }
        } else {
          this.$message.error(response.msg || (this.replyTo ? '回复失败' : '评论发表失败'));
        }
      }).catch(error => {
        this.$message.error((this.replyTo ? '回复' : '评论发表') + '失败：' + (error.message || '未知错误'));
      });
    },
    
    handleReply(comment, parent = null) {
      this.replyTo = comment;
      this.parentComment = parent;
      this.commentContent = `@${comment.userName} `;
      this.focusCommentInput();
    },
    
    cancelReply() {
      this.replyTo = null;
      this.parentComment = null;
      this.commentContent = '';
    },
    
    handleDeleteComment(comment) {
      // 判断是否能删除评论（管理员或自己的评论）
      const isOwner = comment.userId === this.userId;
      const isAdmin = this.$store.getters.roles && this.$store.getters.roles.includes('admin');
      
      if (!isOwner && !isAdmin) {
        this.$message.warning('只能删除自己的评论');
        return;
      }
      
      this.$confirm('确认删除该评论吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteComment(comment.id).then(response => {
          if (response.code === 200) {
            this.$message.success('删除成功');
            this.getComments();
            // 更新帖子评论数
            if (this.post && this.post.commentCount > 0) {
              // 如果删除的是父评论，还需要减去子评论的数量
              const decreaseCount = comment.children ? comment.children.length + 1 : 1;
              this.post.commentCount = Math.max(0, this.post.commentCount - decreaseCount);
            }
          } else {
            this.$message.error(response.msg || '删除失败');
          }
        }).catch(error => {
          this.$message.error('删除失败：' + (error.message || '未知错误'));
        });
      }).catch(() => {});
    },
    
    handleLikeComment(comment) {
      // 模拟点赞/取消点赞
      comment.isLiked = !comment.isLiked;
      if (comment.isLiked) {
        comment.likeCount = (comment.likeCount || 0) + 1;
        this.$message.success('点赞成功');
      } else {
        comment.likeCount = Math.max(0, (comment.likeCount || 1) - 1);
        this.$message.success('已取消点赞');
      }
    },
    
    handleLike() {
      if (!this.userId) {
        this.$message.warning('请先登录后再点赞');
        return;
      }
      
      if (this.isLiked) {
        // 模拟取消点赞操作
        this.isLiked = false;
        if (this.post.likeCount > 0) {
          this.post.likeCount--;
        }
        this.$message.success('已取消点赞');
        
        // 实际的API调用暂时注释掉，等后端实现
        /*
        unlikePost(this.postId).then(response => {
          if (response.code === 200) {
            this.isLiked = false;
            this.post.likeCount--;
            this.$message.success('已取消点赞');
          } else {
            this.$message.error(response.msg || '取消点赞失败');
          }
        });
        */
      } else {
        // 模拟点赞操作
        this.isLiked = true;
        this.post.likeCount = (this.post.likeCount || 0) + 1;
        this.$message.success('点赞成功');
        
        // 实际的API调用暂时注释掉，等后端实现
        /*
        likePost(this.postId).then(response => {
          if (response.code === 200) {
            this.isLiked = true;
            this.post.likeCount = (this.post.likeCount || 0) + 1;
            this.$message.success('点赞成功');
          } else {
            this.$message.error(response.msg || '点赞失败');
          }
        });
        */
      }
    },
    
    handleCollect() {
      this.isCollected = !this.isCollected;
      this.$message.success(this.isCollected ? '收藏成功' : '已取消收藏');
    },
    
    handleShare() {
      const url = window.location.href;
      
      if (navigator.clipboard) {
        navigator.clipboard.writeText(url).then(() => {
          this.$message.success('链接已复制到剪贴板');
        }).catch(() => {
          this.$message.error('复制失败，请手动复制');
        });
      } else {
        const input = document.createElement('input');
        input.value = url;
        document.body.appendChild(input);
        input.select();
        document.execCommand('copy');
        document.body.removeChild(input);
        this.$message.success('链接已复制到剪贴板');
      }
    },
    
    focusCommentInput() {
      this.$nextTick(() => {
        this.$refs.commentInput.focus();
      });
    },
    
    goToUserProfile(userId) {
      this.$router.push('/forum/profile');
    },
    
    formatDate(time) {
      if (!time) return '';
      return parseTime(time, '{y}-{m}-{d} {h}:{i}');
    },
    
    getImageArray(images) {
      if (!images) return [];
      return images.split(',').filter(item => item).map(img => {
        if (img.startsWith('http://') || img.startsWith('https://')) {
          return img;
        }
        return process.env.VUE_APP_BASE_API + img;
      });
    },
    
    getTagArray(tags) {
      if (!tags) return [];
      return tags.split(',').filter(item => item);
    }
  }
};
</script>

<style scoped>
.post-detail {
  overflow-y: auto;
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

html, body {
  overflow-y: auto !important;
  height: auto !important;
}

body {
  min-height: 100vh;
}

.post-card {
  margin-bottom: 30px;
}

.post-header {
  margin-bottom: 25px;
}

.post-title {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #303133;
  line-height: 1.4;
}

.post-meta {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.post-info {
  margin-left: 15px;
}

.author {
  font-weight: 600;
  color: #409EFF;
}

.time {
  font-size: 0.9rem;
  color: #909399;
  margin-top: 3px;
}

.post-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.post-tag {
  border-radius: 4px;
}

.post-content {
  font-size: 1.1rem;
  line-height: 1.8;
  color: #303133;
  margin-bottom: 30px;
  white-space: pre-line;
}

.content-text {
  margin-bottom: 20px;
}

.post-images {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
  margin-top: 20px;
}

.post-image {
  max-width: 100%;
  max-height: 400px;
  border-radius: 4px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.post-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: 1px solid #EBEEF5;
  padding-top: 20px;
}

.post-stats {
  display: flex;
  color: #909399;
}

.post-stats span {
  margin-right: 20px;
  display: flex;
  align-items: center;
}

.post-stats i {
  margin-right: 5px;
}

.action-buttons {
  display: flex;
}

.action-buttons .el-button {
  margin-left: 15px;
  font-size: 1rem;
}

.action-buttons i {
  margin-right: 5px;
}

.section-title {
  font-size: 1.5rem;
  margin-bottom: 20px;
  color: #303133;
  border-left: 4px solid #409EFF;
  padding-left: 10px;
}

.comment-editor {
  margin-bottom: 30px;
  background: #f9f9f9;
  padding: 20px;
  border-radius: 6px;
}

.comment-actions {
  margin-top: 15px;
  text-align: right;
}

.comment-list {
  margin-top: 20px;
}

.comment-item {
  display: flex;
  margin-bottom: 25px;
  padding-bottom: 25px;
  border-bottom: 1px solid #EBEEF5;
}

.comment-avatar {
  margin-right: 15px;
}

.comment-content {
  flex: 1;
}

.comment-header {
  margin-bottom: 8px;
}

.comment-author {
  font-weight: 600;
  color: #409EFF;
  margin-right: 10px;
}

.comment-time {
  font-size: 0.9rem;
  color: #909399;
}

.comment-text {
  line-height: 1.6;
  color: #303133;
  margin-bottom: 10px;
}

.comment-footer {
  display: flex;
  margin-top: 10px;
}

.comment-footer .el-button {
  margin-right: 15px;
}

.reply-list {
  margin-top: 15px;
  margin-left: 20px;
  padding: 10px 0;
  background: #f9f9f9;
  border-radius: 4px;
}

.reply-item {
  display: flex;
  padding: 10px 15px;
  border-bottom: 1px dashed #EBEEF5;
}

.reply-item:last-child {
  border-bottom: none;
}

.reply-avatar {
  margin-right: 10px;
}

.reply-content {
  flex: 1;
}

.reply-header {
  margin-bottom: 5px;
}

.reply-author {
  font-weight: 600;
  color: #409EFF;
  margin-right: 10px;
}

.reply-time {
  font-size: 0.8rem;
  color: #909399;
}

.reply-text {
  font-size: 0.95rem;
  line-height: 1.6;
  color: #303133;
  margin-bottom: 8px;
}

.reply-footer {
  display: flex;
  margin-top: 5px;
}

.reply-footer .el-button {
  margin-right: 10px;
  padding: 5px;
}

.reply-to {
  color: #909399;
}

.reply-user {
  color: #409EFF;
  font-weight: 600;
}

.empty-comments {
  text-align: center;
  padding: 40px 0;
  color: #909399;
}

.empty-icon {
  font-size: 60px;
  color: #DCDFE6;
  margin-bottom: 20px;
}

.post-not-found {
  text-align: center;
  padding: 60px 0;
}

.post-not-found i {
  font-size: 80px;
  color: #F56C6C;
  margin-bottom: 20px;
}

.post-not-found h2 {
  font-size: 1.8rem;
  color: #606266;
  margin-bottom: 30px;
}

.comment-pagination {
  text-align: center;
  margin-top: 30px;
}

.el-avatar {
  cursor: pointer;
  border: 2px solid #f5f7fa;
}
</style> 