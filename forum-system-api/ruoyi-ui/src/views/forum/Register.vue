<template>
  <div class="register-page">
    <div class="register-container">
      <div class="register-header">
        <h2>注册社区论坛</h2>
        <p>创建您的账号，加入我们的社区</p>
      </div>
      
      <el-form :model="registerForm" :rules="rules" ref="registerForm" class="register-form" label-width="0px">
        <el-form-item prop="username">
          <el-input 
            v-model="registerForm.username" 
            prefix-icon="el-icon-user" 
            placeholder="用户名（4-16个字符）"
          ></el-input>
        </el-form-item>
        
        <el-form-item prop="email">
          <el-input 
            v-model="registerForm.email" 
            prefix-icon="el-icon-message" 
            placeholder="邮箱"
          ></el-input>
        </el-form-item>
        
        <el-form-item prop="password">
          <el-input 
            v-model="registerForm.password" 
            prefix-icon="el-icon-lock" 
            placeholder="密码（至少6个字符）" 
            show-password
            type="password"
          ></el-input>
        </el-form-item>
        
        <el-form-item prop="confirmPassword">
          <el-input 
            v-model="registerForm.confirmPassword" 
            prefix-icon="el-icon-lock" 
            placeholder="确认密码" 
            show-password
            type="password"
          ></el-input>
        </el-form-item>
        
        <el-form-item prop="agreement">
          <el-checkbox v-model="registerForm.agreement">
            我已阅读并同意 <el-button type="text">用户协议</el-button> 和 <el-button type="text">隐私政策</el-button>
          </el-checkbox>
        </el-form-item>
        
        <el-form-item>
          <el-button type="primary" class="register-button" @click="submitForm('registerForm')">
            注册账号
          </el-button>
        </el-form-item>
      </el-form>
      
      <div class="login-link">
        <p>
          已有账号? 
          <router-link to="/login">立即登录</router-link>
        </p>
      </div>
      
      <div class="back-home">
        <router-link to="/">
          <i class="el-icon-arrow-left"></i> 返回首页
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'RegisterPage',
  data() {
    // 确认密码验证
    const validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.registerForm.password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    
    return {
      registerForm: {
        username: '',
        email: '',
        password: '',
        confirmPassword: '',
        agreement: false
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 4, max: 16, message: '长度在 4 到 16 个字符', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入邮箱', trigger: 'blur' },
          { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, message: '密码长度不能少于6个字符', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请确认密码', trigger: 'blur' },
          { validator: validatePass, trigger: 'blur' }
        ],
        agreement: [
          { 
            validator: (rule, value, callback) => {
              if (value === false) {
                callback(new Error('请阅读并同意用户协议'));
              } else {
                callback();
              }
            }, 
            trigger: 'change' 
          }
        ]
      }
    }
  },
  methods: {
    ...mapActions(['login']),
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // 模拟注册过程
          const loadingInstance = this.$loading({
            lock: true,
            text: '注册中...',
            spinner: 'el-icon-loading',
            background: 'rgba(0, 0, 0, 0.7)'
          })
          
          // 模拟API请求延迟
          setTimeout(() => {
            loadingInstance.close()
            
            // 注册成功后自动登录
            this.login({
              id: Date.now(),
              username: this.registerForm.username,
              nickname: this.registerForm.username,
              email: this.registerForm.email,
              avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'
            })
            
            this.$message.success('注册成功！')
            this.$router.push('/home')
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
.register-page {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f7fa;
}

.register-container {
  width: 400px;
  padding: 40px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.register-header {
  text-align: center;
  margin-bottom: 30px;
}

.register-header h2 {
  margin-bottom: 10px;
  color: #303133;
}

.register-header p {
  color: #606266;
  font-size: 14px;
}

.register-form {
  margin-bottom: 20px;
}

.register-button {
  width: 100%;
  margin-top: 10px;
}

.login-link {
  margin-top: 20px;
  text-align: center;
  font-size: 14px;
}

.login-link a {
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