<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>个人资料</span>
        <el-button
          style="float: right; padding: 3px 0"
          type="text"
          @click="handleEdit">编辑资料</el-button>
      </div>

      <el-row :gutter="20">
        <el-col :span="6">
          <div class="avatar-container">
            <el-avatar :size="120" :src="displayAvatar">
              {{ userInfo.nickName ? userInfo.nickName.charAt(0) : 'U' }}
            </el-avatar>
            <div class="upload-btn">
              <el-upload
                class="avatar-uploader"
                :action="upload.url"
                :headers="upload.headers"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload">
                <el-button size="small" type="primary">更换头像</el-button>
              </el-upload>
            </div>
          </div>
        </el-col>
        <el-col :span="18">
          <el-descriptions :column="2" border>
            <el-descriptions-item label="用户名">{{ userInfo.userName }}</el-descriptions-item>
            <el-descriptions-item label="昵称">{{ userInfo.nickName }}</el-descriptions-item>
            <el-descriptions-item label="邮箱">{{ userInfo.email }}</el-descriptions-item>
            <el-descriptions-item label="手机号">{{ userInfo.phonenumber }}</el-descriptions-item>
            <el-descriptions-item label="性别">
              <el-tag :type="userInfo.sex === '1' ? 'success' : 'info'">
                {{ userInfo.sex === '1' ? '男' : '女' }}
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="注册时间">{{ userInfo.createTime }}</el-descriptions-item>
            <el-descriptions-item label="个人简介" :span="2">{{ userInfo.remark || '这个人很懒，什么都没写~' }}</el-descriptions-item>
            <el-descriptions-item label="密码">
              <el-button type="text" @click="handleChangePwd">修改密码</el-button>
            </el-descriptions-item>
          </el-descriptions>
        </el-col>
      </el-row>

      <el-divider content-position="left"></el-divider>
    
    </el-card>

    <!-- 编辑资料对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入昵称" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="手机号" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="个人简介" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入个人简介" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 修改密码对话框 -->
    <el-dialog title="修改密码" :visible.sync="pwdOpen" width="400px" append-to-body>
      <el-form ref="pwdForm" :model="pwdForm" :rules="pwdRules" label-width="100px">
        <el-form-item label="旧密码" prop="oldPassword">
          <el-input v-model="pwdForm.oldPassword" type="password" placeholder="请输入旧密码" />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="pwdForm.newPassword" type="password" placeholder="请输入新密码" />
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input v-model="pwdForm.confirmPassword" type="password" placeholder="请再次输入新密码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitPwdForm">确 定</el-button>
        <el-button @click="cancelPwd">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getInfo, updateUserProfile, updateUserPwd } from "@/api/forum/user";
import { getToken } from "@/utils/auth";
import { getStatistics } from "@/api/forum/statistics";
import { mapGetters, mapActions } from 'vuex'
import { uploadAvatar } from "@/api/system/user";

export default {
  name: "ForumProfile",
  data() {
    const validateConfirmPassword = (rule, value, callback) => {
      if (value !== this.pwdForm.newPassword) {
        callback(new Error('两次输入的密码不一致'));
      } else {
        callback();
      }
    };
    return {
      // 遮罩层
      loading: true,
      // 弹出层标题
      title: "编辑资料",
      // 是否显示弹出层
      open: false,
      // 是否显示密码弹出层
      pwdOpen: false,
      // 用户信息
      userInfo: {},
      // 统计数据
      statistics: {},
      // 表单参数
      form: {},
      // 密码表单参数
      pwdForm: {
        oldPassword: '',
        newPassword: '',
        confirmPassword: ''
      },
      // 表单校验
      rules: {
        nickName: [
          { required: true, message: "昵称不能为空", trigger: "blur" }
        ],
        email: [
          { required: true, message: "邮箱不能为空", trigger: "blur" },
          { type: "email", message: "请输入正确的邮箱地址", trigger: "blur" }
        ],
        phonenumber: [
          { required: true, message: "手机号不能为空", trigger: "blur" },
          { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
        ]
      },
      // 密码表单校验
      pwdRules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          { min: 6, message: "密码长度不能小于6位", trigger: "blur" }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { validator: validateConfirmPassword, trigger: "blur" }
        ]
      },
      // 上传相关
      upload: {
        url: process.env.VUE_APP_BASE_API + "/system/forum/user/avatar",
        headers: { Authorization: "Bearer " + getToken() }
      }
    };
  },
  computed: {
    ...mapGetters([
      'avatar'
    ]),
    displayAvatar() {
      // 优先使用userInfo中的头像
      const avatarUrl = this.userInfo.avatar || this.avatar;
      
      if (!avatarUrl) {
        return require('@/assets/images/profile.jpg');
      }
      
      if (avatarUrl.startsWith('http') || avatarUrl.startsWith('https')) {
        return avatarUrl;
      } else if (avatarUrl.startsWith('/')) {
        return avatarUrl;
      } else {
        return process.env.VUE_APP_BASE_API + avatarUrl;
      }
    }
  },
  created() {
    this.getUser();
    // this.getStatistics();
  },
  methods: {
    /** 查询用户信息 */
    getUser() {
      getInfo().then(response => {
        this.userInfo = response.data;
        // 处理头像URL，确保能正确显示
        if (this.userInfo.avatar) {
          const avatar = this.userInfo.avatar;
          if (!avatar.startsWith('http') && !avatar.startsWith('https') && !avatar.startsWith('/')) {
            this.userInfo.avatar = process.env.VUE_APP_BASE_API + avatar;
          }
        }
        this.form = { ...this.userInfo };
        this.loading = false;
      });
    },
    /** 查询用户统计数据 */
    getStatistics() {
      getStatistics().then(response => {
        this.statistics = response.data;
      });
    },
    /** 编辑按钮操作 */
    handleEdit() {
      this.open = true;
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    },
    /** 表单重置 */
    reset() {
      this.form = this.userInfo;
      this.$refs["form"] && this.$refs["form"].resetFields();
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUserProfile(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getUser();
          });
        }
      });
    },
    /** 头像上传成功处理 */
    handleAvatarSuccess(res, file) {
      if (res.code === 200) {
        // 更新头像URL
        const url = res.imgUrl;
        if (url.startsWith('http') || url.startsWith('https')) {
          this.userInfo.avatar = url;
        } else if (url.startsWith('/')) {
          this.userInfo.avatar = url;
        } else {
          this.userInfo.avatar = process.env.VUE_APP_BASE_API + url;
        }
      
        // 将新头像更新到Vuex存储，确保整个应用的头像一致性
        this.$store.commit('SET_AVATAR',  url);
        this.$modal.msgSuccess("头像更新成功");
      } else {
        this.$modal.msgError(res.msg || "上传失败");
      }
    },
    /** 上传前图片格式校验 */
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg' || file.type === 'image/png' || file.type === 'image/gif';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG/PNG/GIF 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    /** 修改密码按钮操作 */
    handleChangePwd() {
      this.pwdOpen = true;
    },
    /** 取消密码修改按钮 */
    cancelPwd() {
      this.pwdOpen = false;
      this.resetPwd();
    },
    /** 重置密码表单 */
    resetPwd() {
      this.pwdForm = {
        oldPassword: '',
        newPassword: '',
        confirmPassword: ''
      };
      this.$refs["pwdForm"] && this.$refs["pwdForm"].resetFields();
    },
    /** 提交密码修改 */
    submitPwdForm() {
      this.$refs["pwdForm"].validate(valid => {
        if (valid) {
          updateUserPwd(this.pwdForm.oldPassword, this.pwdForm.newPassword).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.pwdOpen = false;
            this.resetPwd();
          });
        }
      });
    }
  }
};
</script>

<style scoped>
.avatar-container {
  text-align: center;
  padding: 20px;
}
.upload-btn {
  margin-top: 10px;
}
.stat-number {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  color: #409EFF;
  padding: 10px 0;
}
</style> 