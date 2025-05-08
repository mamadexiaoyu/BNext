<template>
  <div class="my-messages-page">
    <div class="content-section">
      <h2>我的消息</h2>
      
      <div class="messages-header">
        <el-tabs v-model="activeTab">
          <el-tab-pane label="全部消息" name="all"></el-tab-pane>
          <el-tab-pane label="未读消息" name="unread"></el-tab-pane>
          <el-tab-pane label="已读消息" name="read"></el-tab-pane>
        </el-tabs>
        
        <div class="message-actions">
          <el-button size="small" type="text" @click="markAllAsRead" :disabled="unreadCount === 0">
            全部标为已读
          </el-button>
          <el-button size="small" type="text" @click="deleteAllMessages" :disabled="messages.length === 0">
            清空消息
          </el-button>
        </div>
      </div>
      
      <div class="message-list">
        <div v-if="filteredMessages.length === 0" class="no-messages">
          <i class="el-icon-message"></i>
          <p>{{ activeTab === 'unread' ? '没有未读消息' : '暂无消息' }}</p>
        </div>
        
        <div v-else class="message-items">
          <div 
            v-for="message in filteredMessages" 
            :key="message.id" 
            class="message-item"
            :class="{ 'message-unread': !message.read }"
            @click="viewMessage(message)"
          >
            <div class="message-item-header">
              <div>
                <span class="message-sender">{{ message.from }}</span>
                <el-tag size="mini" type="info" v-if="!message.read" class="unread-tag">未读</el-tag>
              </div>
              <span class="message-date">{{ message.date }}</span>
            </div>
            
            <div class="message-content">{{ message.content }}</div>
            
            <div class="message-footer">
              <router-link :to="`/home?postId=${message.postId}`" class="post-link">
                相关帖子: {{ message.postTitle }}
              </router-link>
              
              <div class="message-actions">
                <el-button type="text" size="mini" @click.stop="replyMessage(message)">
                  回复 <i class="el-icon-chat-dot-round"></i>
                </el-button>
                <el-button type="text" size="mini" @click.stop="deleteMessage(message)">
                  删除 <i class="el-icon-delete"></i>
                </el-button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 回复对话框 -->
    <el-dialog title="回复消息" :visible.sync="replyDialogVisible" width="50%">
      <div class="reply-dialog">
        <div class="original-message">
          <h4>原消息:</h4>
          <div v-if="currentMessage">
            <div class="message-meta">
              <span>{{ currentMessage.from }}</span>
              <span>{{ currentMessage.date }}</span>
            </div>
            <div class="message-quote">{{ currentMessage.content }}</div>
          </div>
        </div>
        
        <el-form :model="replyForm">
          <el-form-item>
            <el-input
              type="textarea"
              :rows="4"
              placeholder="请输入回复内容..."
              v-model="replyForm.content"
            ></el-input>
          </el-form-item>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="replyDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="sendReply">发送回复</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'MyMessagesPage',
  data() {
    return {
      activeTab: 'all',
      replyDialogVisible: false,
      currentMessage: null,
      replyForm: {
        content: ''
      }
    }
  },
  computed: {
    ...mapState({
      messages: state => state.messages
    }),
    filteredMessages() {
      // 为演示目的，给每条消息随机添加一个已读/未读状态
      const processedMessages = this.messages.map(msg => ({
        ...msg,
        read: Math.random() > 0.3 // 随机标记一些消息为已读，仅用于演示
      }))
      
      if (this.activeTab === 'unread') {
        return processedMessages.filter(msg => !msg.read)
      } else if (this.activeTab === 'read') {
        return processedMessages.filter(msg => msg.read)
      }
      
      return processedMessages
    },
    unreadCount() {
      return this.filteredMessages.filter(msg => !msg.read).length
    }
  },
  methods: {
    ...mapActions(['fetchMessages']),
    viewMessage(message) {
      // 这里应该有标记消息为已读的逻辑
      message.read = true
    },
    replyMessage(message) {
      this.currentMessage = message
      this.replyDialogVisible = true
    },
    deleteMessage(message) {
      this.$confirm('确定要删除这条消息吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 这里应该有删除消息的逻辑
        this.$message.success('消息已删除')
      }).catch(() => {
        // 取消删除
      })
    },
    markAllAsRead() {
      this.$confirm('确定要将所有消息标记为已读吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'info'
      }).then(() => {
        // 这里应该有全部标记为已读的逻辑
        this.filteredMessages.forEach(msg => {
          msg.read = true
        })
        this.$message.success('所有消息已标记为已读')
      }).catch(() => {
        // 取消操作
      })
    },
    deleteAllMessages() {
      this.$confirm('确定要清空所有消息吗? 此操作不可恢复!', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 这里应该有清空消息的逻辑
        this.$message.success('所有消息已清空')
      }).catch(() => {
        // 取消操作
      })
    },
    sendReply() {
      if (this.replyForm.content.trim()) {
        // 这里应该有发送回复的逻辑
        this.$message.success('回复已发送')
        this.replyDialogVisible = false
        this.replyForm.content = ''
      } else {
        this.$message.error('回复内容不能为空')
      }
    }
  },
  created() {
    this.fetchMessages()
  }
}
</script>

<style scoped>
.my-messages-page {
  max-width: 900px;
  margin: 0 auto 30px;
}

.messages-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #EBEEF5;
  margin-bottom: 20px;
}

.message-list {
  margin-top: 20px;
}

.no-messages {
  text-align: center;
  padding: 40px 0;
  color: #909399;
}

.no-messages i {
  font-size: 48px;
  margin-bottom: 10px;
}

.message-items {
  display: flex;
  flex-direction: column;
}

.message-item {
  padding: 20px;
  border-bottom: 1px solid #EBEEF5;
  cursor: pointer;
  transition: background-color 0.3s;
}

.message-item:hover {
  background-color: #f5f7fa;
}

.message-item:last-child {
  border-bottom: none;
}

.message-unread {
  background-color: #ecf5ff;
}

.message-item-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.message-sender {
  font-weight: bold;
  margin-right: 10px;
}

.message-date {
  color: #909399;
  font-size: 13px;
}

.message-content {
  line-height: 1.6;
  margin-bottom: 15px;
}

.message-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
}

.post-link {
  color: #409EFF;
  text-decoration: none;
}

.post-link:hover {
  text-decoration: underline;
}

.unread-tag {
  margin-left: 10px;
}

.original-message {
  background-color: #f5f7fa;
  border-radius: 4px;
  padding: 15px;
  margin-bottom: 20px;
}

.message-meta {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  color: #606266;
  font-size: 13px;
}

.message-quote {
  color: #606266;
  border-left: 4px solid #dcdfe6;
  padding-left: 10px;
  font-style: italic;
}
</style> 