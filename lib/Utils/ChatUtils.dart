import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:math';
import '../Page/Message/Chat.dart';


List<types.Message> make_message_list(chat_id) {
  List<types.Message> _messages = [];
  final author_id_1 = '82091008-a484-4a89-ae75-a22bf8d6f3ac';
  final author_id_2 = '82091008-a484-4a89-ae75-a22bf88563ac';
  for (var i = 0; i < 5; i++) {
    var j=i+Random().nextInt(2);
    var authorId = j % 2 == 0 ? author_id_1 : author_id_2;
    _messages.add(types.TextMessage(
      author: types.User(id: authorId),
      createdAt: DateTime.now().subtract(Duration(minutes: Random().nextInt(600))).millisecondsSinceEpoch,
      id: randomString(),
      text: generateAnimalConversations()[chat_id][i],));
  }
  return _messages;
}
List<List<String>> generateAnimalConversations() {
  return [
    [
      "Hey, how have you been feeling lately? Is your flying training going well?",
      "Hi, I've been feeling great, and my flying training has been smooth. How about you?",
      "I've been feeling good too! I've been eating more bamboo lately and feeling energetic. But I still need to do more exercise.",
      "That's great! Eating healthy food is a good idea. I can teach you some flying tricks so you can get more exercise too.",
      "Awesome! We can practice together and help each other out. That way, we can both stay healthy!"
    ],
    [
      "Hey, how's it going? Have you been doing your water exercises?",
      "Hi there! I've been doing well! My water exercises have been going smoothly. Have you tried any new workouts lately?",
      "I've been feeling great too! I tried some yoga recently and felt more flexible. But I need to add some more cardio.",
      "That sounds good! Yoga is really beneficial. I can take you swimming so you can get some cardio in.",
      "Great! We can plan our workouts together and keep each other motivated. That way, we'll both be healthier!"
    ],
    [
      "Hey, have you been watching your diet lately?",
      "Hi, definitely! I've been focusing on healthy eating lately, adding more fruits and vegetables.",
      "Me too! Fruits and vegetables are so important for health. Have you tried any new healthy ingredients?",
      "Yes, I've tried some fresh salad ingredients recently, it feels refreshing. You should give it a try too.",
      "Sounds good! We can share healthy recipes and keep each other on track. That way, we can both maintain good health!"
    ],
    [
      "Have you been getting enough rest lately?",
      "Yes, I make sure to get enough sleep every day.",
      "Sleep is crucial for health. I've been trying to maintain a good sleep schedule too.",
      "That's great! Keeping a regular sleep schedule is very beneficial.",
      "Absolutely, we should both make sure to get enough rest so our bodies can stay in top condition!"
    ],
    [
      "Hey, did you go for a check-up last week?",
      "Yes, I had a health check-up last week, everything's normal.",
      "Regular check-ups are a good habit. I plan to go for regular check-ups too.",
      "Regular check-ups can help detect health issues early. We should both make sure to go for regular check-ups.",
      "Exactly! Health is paramount, regular check-ups ensure we maintain good health!"
    ]
  ];
}






