class NotificationModel {
  final List<NotificationData> data;

  NotificationModel({required this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<NotificationData> dataList = list.map((i) => NotificationData.fromJson(i)).toList();

    return NotificationModel(data: dataList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((notification) => notification.toJson()).toList(),
    };
  }
}
class NotificationData {
  final int id;
  final String title;
  final String content;
  final String type;
  final int userId;
  final String createdAt;
  final String updatedAt;

  NotificationData({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      type: json['type'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
