class Chat {
  final String name;
  final String imageUrl;
  final String message;

  Chat(
    this.name,
    this.imageUrl,
    this.message,
  );

  factory Chat.fromJson(Map json) {
    return Chat(json['name'], json['imageUrl'], json['message']);
  }
}
