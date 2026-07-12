class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.name, this.email, this.body});

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    postId: json['postId'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    body: json['body'] as String?,
  );
  
  // if u want to cache the data this map use the object to cache it
  Map<String, dynamic> toJson() => {
    'postId': postId,
    'id': id,
    'name': name,
    'email': email,
    'body': body,
  };
}
