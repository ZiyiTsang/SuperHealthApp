import 'dart:math';

import '../Utils/Func.dart';
import 'Contact.dart';

class RecentContact {
  final int id;
  final String message;
  final String time;
  final String avatarUrl;
  final String status;
  final String name;

  RecentContact({
    required this.id,
    required this.message,
    required this.time,
    required this.status,
  }) : name = getUserById(id).name,
       avatarUrl = getUserById(id).imagePath ?? "assets/images/people-1.jpg";
  // RecentContact({
  //   required this.id,
  //   required this.message,
  //   required this.time,
  //   required this.avatarUrl,
  //   required this.status,
  // }) : name = "6666";

  static String generateRandomMessage() {
    Random random = Random();
    List<String> messages = [
      'Did you exercise today?',
      'Hello, remember to drink plenty of water!',
      'Regular exercise is important for your health.',
      'How are you feeling lately? Have you been maintaining a healthy lifestyle?',
      'I want to share a health tip with you: Drinking a glass of warm water every morning is beneficial for your body.',
      'Health is wealth. Take care of yourself!',
      'I heard that regular exercise can boost your immune system. Have you been paying attention to it?',
      'Exercise not only strengthens your body but also relieves stress. Have you been exercising lately?',
      'Maintaining a healthy diet and sleep schedule is essential for good health.',
      'Early to bed and early to rise makes a man healthy, wealthy, and wise. Make sure to get enough sleep every day.'
    ];
    return messages[random.nextInt(messages.length)];
  }

  static String generateRandomTime() {
    Random random = Random();
    int hour = random.nextInt(24);
    int minute = random.nextInt(60);
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }



  static List<RecentContact> getRecentContact() {
    Random random = Random();
    List<RecentContact> list = [];
    for (int i = 1; i <= 10; i++) {
      list.add(RecentContact(
        id: i,
        message: generateRandomMessage(),
        time: generateRandomTime(),
        status: random.nextBool() ? 'online' : 'offline',
      ));
    }
    return list;
  }


}
