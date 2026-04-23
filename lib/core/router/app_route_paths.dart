class AppRoutePaths {
  const AppRoutePaths._();

  static const users = '/users';
  static const postListPattern = '/users/:userId/posts';
  static const todoListPattern = '/users/:userId/todos';
  static const createPostPattern = '/users/:userId/posts/create';
  static const postDetailPattern = '/users/:userId/posts/:postId';
  static const editPostPattern = '/users/:userId/posts/:postId/edit';

  static String postList(int userId) => '/users/$userId/posts';

  static String todoList(int userId) => '/users/$userId/todos';

  static String postDetail(int userId, int postId) =>
      '/users/$userId/posts/$postId';

  static String createPost(int userId) => '/users/$userId/posts/create';

  static String editPost(int userId, int postId) =>
      '/users/$userId/posts/$postId/edit';
}
