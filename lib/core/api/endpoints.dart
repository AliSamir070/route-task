class Endpoints{
  static const String postsEndpoint = "posts";
  static String postCommentsEndpoint(int id) => "posts/$id/comments";
  static String postUserEndpoint(int id) => "users/$id";
}