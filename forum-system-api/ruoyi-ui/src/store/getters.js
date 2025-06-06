const getters = {
  sidebar: state => state.app.sidebar,
  size: state => state.app.size,
  device: state => state.app.device,
  dict: state => state.dict.dict,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  introduction: state => state.user.introduction,
  roles: state => state.user.roles,
  permissions: state => state.user.permissions,
  userId: state => state.user.id,
  permission_routes: state => state.permission.routes,
  topbarRouters:state => state.permission.topbarRouters,
  defaultRoutes:state => state.permission.defaultRoutes,
  sidebarRouters:state => state.permission.sidebarRouters,
  // 论坛模块
  forumPosts: state => state.forum.forumPosts,
  myForumPosts: state => state.forum.myForumPosts,
  forumMessages: state => state.forum.forumMessages,
  forumLoading: state => state.forum.loading,
  forumError: state => state.forum.error
}
export default getters
