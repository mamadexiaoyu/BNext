<template>
  <div class="login-page">
    <div class="login-container">
      <div class="login-header">
        <h2>登录社区论坛</h2>
        <p>欢迎回来，请登录您的账号</p>
      </div>

      <el-form :model="loginForm" :rules="rules" ref="loginForm" class="login-form" label-width="0px">
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            prefix-icon="el-icon-user"
            placeholder="用户名/邮箱"
          ></el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            prefix-icon="el-icon-lock"
            placeholder="密码"
            show-password
            type="password"
          ></el-input>
        </el-form-item>

        <div class="login-options">
          <el-checkbox v-model="loginForm.remember">记住我</el-checkbox>
<!--          <el-button type="text">忘记密码?</el-button>-->
        </div>

        <el-form-item>
          <el-button type="primary" class="login-button" @click="submitForm('loginForm')">
            登录
          </el-button>
        </el-form-item>
      </el-form>

      <div class="register-link">
        <p>
          还没有账号?
          <router-link to="/register">立即注册</router-link>
        </p>
      </div>

      <div class="back-home">
        <router-link to="/forum/home">
          <i class="el-icon-arrow-left"></i> 返回首页
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'LoginPage',
  data() {
    return {
      loginForm: {
        username: '',
        password: '',
        remember: false
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名或邮箱', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, message: '密码长度不能少于6个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    ...mapActions(['login']),
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // 模拟登录过程
          const loadingInstance = this.$loading({
            lock: true,
            text: '登录中...',
            spinner: 'el-icon-loading',
            background: 'rgba(0, 0, 0, 0.7)'
          })

          // 模拟API请求延迟
          setTimeout(() => {
            loadingInstance.close()

            this.login({
              id: 1,
              username: this.loginForm.username,
              nickname: this.loginForm.username,
              avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'
            })

            this.$message.success('登录成功！')
            this.$router.push('/forum/home')
          }, 1500)
        } else {
          return false
        }
      })
    }
  }
}
</script>

<style scoped>
.login-page {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f7fa;
}

.login-container {
  width: 400px;
  padding: 40px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.login-header {
  text-align: center;
  margin-bottom: 30px;
}

.login-header h2 {
  margin-bottom: 10px;
  color: #303133;
}

.login-header p {
  color: #606266;
  font-size: 14px;
}

.login-form {
  margin-bottom: 20px;
}

.login-options {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  color: #606266;
  font-size: 14px;
}

.login-button {
  width: 100%;
  margin-top: 10px;
}

.other-login {
  text-align: center;
  margin-top: 30px;
  border-top: 1px solid #EBEEF5;
  padding-top: 20px;
}

.other-login p {
  color: #909399;
  font-size: 14px;
  margin-bottom: 15px;
}

.social-logins {
  display: flex;
  justify-content: center;
  gap: 20px;
}

.social-btn {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: none;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: opacity 0.3s;
}

.social-btn:hover {
  opacity: 0.8;
}

.social-btn i {
  font-size: 20px;
}

.wechat {
  background-color: #1AAD19;
}

.qq {
  background-color: #12B7F5;
}

.weibo {
  background-color: #E6162D;
}

.register-link {
  margin-top: 20px;
  text-align: center;
  font-size: 14px;
}

.register-link a {
  color: #409EFF;
  text-decoration: none;
}

.back-home {
  margin-top: 15px;
  text-align: center;
}

.back-home a {
  color: #909399;
  text-decoration: none;
  font-size: 14px;
  display: inline-flex;
  align-items: center;
}

.back-home a:hover {
  color: #409EFF;
}
</style>
