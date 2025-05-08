import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import dict from './modules/dict'
import user from './modules/user'
import tagsView from './modules/tagsView'
import permission from './modules/permission'
import settings from './modules/settings'
import forum from './modules/forum'
import getters from './getters'
import createPersistedState from 'vuex-persistedstate'; // 确保正确导入
Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    dict,
    user,
    tagsView,
    permission,
    settings,
    forum
  },
  getters,
  plugins: [
    createPersistedState({
      key: 'vuex', // 存储到 localStorage 中的 key
      paths: ['user'] // 只持久化 user 模块的状态
    })
  ]
})

export default store
