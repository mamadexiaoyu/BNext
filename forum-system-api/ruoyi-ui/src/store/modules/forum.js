import { getForumPosts, getMyPosts, getForumMessages, createForumPost, addForumComment } from '@/api/forum'

const forum = {
  state: {
    forumPosts: [],
    myForumPosts: [],
    forumMessages: [],
    loading: false,
    error: null
  },

  mutations: {
    SET_FORUM_POSTS: (state, posts) => {
      state.forumPosts = posts
    },
    SET_MY_FORUM_POSTS: (state, posts) => {
      state.myForumPosts = posts
    },
    SET_FORUM_MESSAGES: (state, messages) => {
      state.forumMessages = messages
    },
    SET_LOADING: (state, loading) => {
      state.loading = loading
    },
    SET_ERROR: (state, error) => {
      state.error = error
    },
    ADD_FORUM_POST: (state, post) => {
      state.forumPosts.unshift(post)
      state.myForumPosts.unshift(post)
    },
    ADD_FORUM_COMMENT: (state, { postId, comment }) => {
      const post = state.forumPosts.find(p => p.postId === postId)
      if (post) {
        if (!post.comments) post.comments = []
        post.comments.push(comment)
      }
    }
  },

  actions: {
    // 获取论坛帖子列表
    GetForumPosts({ commit }) {
      commit('SET_LOADING', true)
      return new Promise((resolve, reject) => {
        getForumPosts().then(res => {
          commit('SET_FORUM_POSTS', res.rows)
          commit('SET_LOADING', false)
          resolve(res)
        }).catch(error => {
          commit('SET_ERROR', error.message)
          commit('SET_LOADING', false)
          reject(error)
        })
      })
    },

    // 获取我的帖子列表
    GetMyForumPosts({ commit }) {
      commit('SET_LOADING', true)
      return new Promise((resolve, reject) => {
        getMyPosts().then(res => {
          commit('SET_MY_FORUM_POSTS', res.data)
          commit('SET_LOADING', false)
          resolve(res)
        }).catch(error => {
          commit('SET_ERROR', error.message)
          commit('SET_LOADING', false)
          reject(error)
        })
      })
    },

    // 获取论坛消息列表
    GetForumMessages({ commit }) {
      commit('SET_LOADING', true)
      return new Promise((resolve, reject) => {
        getForumMessages().then(res => {
          commit('SET_FORUM_MESSAGES', res.data)
          commit('SET_LOADING', false)
          resolve(res)
        }).catch(error => {
          commit('SET_ERROR', error.message)
          commit('SET_LOADING', false)
          reject(error)
        })
      })
    },

    // 创建论坛帖子
    CreateForumPost({ commit }, postData) {
      commit('SET_LOADING', true)
      return new Promise((resolve, reject) => {
        createForumPost(postData).then(res => {
          commit('ADD_FORUM_POST', res.data)
          commit('SET_LOADING', false)
          resolve(res.data)
        }).catch(error => {
          commit('SET_ERROR', error.message)
          commit('SET_LOADING', false)
          reject(error)
        })
      })
    },

    // 添加论坛评论
    AddForumComment({ commit }, { postId, content }) {
      commit('SET_LOADING', true)
      return new Promise((resolve, reject) => {
        addForumComment(postId, content).then(res => {
          commit('ADD_FORUM_COMMENT', { postId, comment: res.data })
          commit('SET_LOADING', false)
          resolve(res.data)
        }).catch(error => {
          commit('SET_ERROR', error.message)
          commit('SET_LOADING', false)
          reject(error)
        })
      })
    }
  }
}

export default forum 