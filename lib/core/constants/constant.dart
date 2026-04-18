class Constant {
  //static const baseUrl = "http://127.0.0.1:3000";
  static const String baseUrl = 'http://192.168.1.48:3000/api/v1';
}

class EndPoint {}

class UserEndPoint extends EndPoint {
  static const sendOtp = "${Constant.baseUrl}/sendOTP"; // post
  static const signUp = "${Constant.baseUrl}/signup"; // post
  static const login = "${Constant.baseUrl}/login"; // post
  static const forgetPassword = "${Constant.baseUrl}/password/forget"; // post
  static const resetPassword =
      "${Constant.baseUrl}/password/reset/:token"; // put
  static const updatePassword = "${Constant.baseUrl}/password/update"; // put
  static const getUserDetials = "${Constant.baseUrl}/user/:id"; // get
  static const updateProfile = "${Constant.baseUrl}/me/update"; // put
}

class BlogEndPoint extends EndPoint {
  static const create = "${Constant.baseUrl}/post/create"; // post
  static const getAll = "${Constant.baseUrl}/post/all"; // get
  static const getDetail = "${Constant.baseUrl}/post/:id"; // get
  static const update = "${Constant.baseUrl}/post/:id"; // put
  static const delete = "${Constant.baseUrl}/post/:id"; // delete
  static const upVote = "${Constant.baseUrl}/post/:id/upvote"; // get
  static const downVote = "${Constant.baseUrl}/post/:id/downvote"; // get

  // Admin
  static const deleteByAdmin = "${Constant.baseUrl}/admin/post/:id"; // delete
}

class CommentEndPoint extends EndPoint {
  static const create = "${Constant.baseUrl}/post/comment/create"; // post
  static const getBlogAllComments =
      "${Constant.baseUrl}/post/:postId/comment/all"; // get
  static const update = "${Constant.baseUrl}/post/comment/:id"; // put
  static const delete = "${Constant.baseUrl}/post/comment/:id"; // delete
  static const upVote = "${Constant.baseUrl}/post/comment/:id/upvote"; // get
  static const downVote = "${Constant.baseUrl}/post/comment/:downvote"; // get

  // Admin
  static const deleteByAdmin =
      "${Constant.baseUrl}/admin/post/comment/:id"; // delete
}
