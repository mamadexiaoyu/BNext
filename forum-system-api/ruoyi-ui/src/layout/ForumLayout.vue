<template>
  <div id="forum-app">
    <header class="site-header">
      <div class="nav-container">
        <div class="nav-logo">
          <router-link to="/forum/home">图像检测-社区论坛</router-link>
        </div>
        <div class="nav-links">
          <router-link class="nav-link" to="/forum/home">首页</router-link>
   
          <router-link class="nav-link" to="/forum/image-detection">图像检测</router-link>
          <!-- <router-link class="nav-link" to="/forum/create-post">发帖</router-link> -->
          <template v-if="token">
            <router-link class="nav-link" to="/forum/my-posts">我的帖子</router-link>
            <router-link class="nav-link" to="/forum/my-messages">我的消息</router-link>
            <!-- 管理员 可以去后台 -->
            <el-dropdown>
              <span class="el-dropdown-link nav-link">
                <el-avatar size="small" :src="userAvatar" class="user-avatar"></el-avatar>
                {{ name || '账户' }} <i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item @click.native="goToProfile">个人资料</el-dropdown-item>
                <el-dropdown-item v-if="getRole" @click.native="goToAdmin">去后台</el-dropdown-item>
                <el-dropdown-item divided @click.native="handleLogout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </template>
          <template v-else>
            <router-link class="nav-link" to="/login?redirect=/forum/home">登录</router-link>
            <router-link class="nav-link" to="/register">注册</router-link>
          </template>
        </div>
      </div>
    </header>

    <div class="container">
      <router-view/>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import { getToken } from '@/utils/auth'

export default {
  name: 'ForumLayout',
  data() {
    return {
      token: getToken()
    }
  },
  computed: {
    ...mapGetters([
      'name',
      'avatar'
    ]),
    userAvatar() {
      console.log(this.$store.state.user.avatar);
      if (!this.avatar) {
        return require('@/assets/images/profile.jpg');
      }
      
      if (this.avatar.startsWith('http') || this.avatar.startsWith('https')) {
        return this.avatar + '?t=' + new Date().getTime();
      } else if (this.avatar.startsWith('/')) {
        return this.avatar + '?t=' + new Date().getTime();
      } else {
        return process.env.VUE_APP_BASE_API + this.avatar + '?t=' + new Date().getTime();
      }
    },
    getRole() {
      //是否包含admin角色 并且是登录状态
      console.log("22");
      console.log(this.$store.state.user.token);
      return this.$store.getters.roles.includes('admin') && this.$store.state.user.token;
    }
  },
  methods: {
    ...mapActions(['LogOut']),
    async handleLogout() {
      try {
        await this.LogOut()
        this.token = null
        this.$router.push(`/forum/home`)
      } catch (error) {
        console.error(error)
      }
    },
    goToProfile() {
      this.$router.push('/forum/profile')
    },
    goToAdmin() {
      this.$router.push('/')
    }
  },
  watch: {
    $route: {
      handler() {
        this.token = getToken()
      },
      immediate: true
    }
  }
}
</script>

<style scoped>
#forum-app {
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.site-header {
  background-color: #409EFF;
  color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 100;
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-logo {
  font-size: 1.5rem;
  font-weight: bold;
  letter-spacing: 1px;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 24px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  padding: 8px 0;
  position: relative;
  transition: all 0.2s;
}

.nav-link:hover {
  opacity: 0.9;
}

.nav-link.router-link-active::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 3px;
  background-color: white;
  border-radius: 2px;
}

.el-dropdown-link {
  cursor: pointer;
  display: flex;
  align-items: center;
}

.user-avatar {
  margin-right: 8px;
}

.container {
  max-width: 1200px;
  margin: 20px auto;
  padding: 0 20px;
}
</style> 