class ApiEndPointUrls {
  static String? blogid;

  static const String login = 'login';
  static const String register = 'register';

  //================BLOGS================\\
  static const String getAllBlogs = 'get-all-blogs';
  static const String createBlog = 'create-blog';
  static const String myBlogs = 'get-blogs';
  static const String deleteMyBlog = 'delete-blog';
  static const String updateBlog = 'update-blog';
  static String get getBlogbyId => 'get-blog/$blogid';
}
// router.put('/update-blog/:userId/:blogId',