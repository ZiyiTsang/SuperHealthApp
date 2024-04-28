class RecentContact {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final String status;

  RecentContact(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl,
      required this.status});

  static List<RecentContact> get_all_contact() {
    List<RecentContact> list = [];
    list.add(RecentContact(
        name: 'John Doe',
        message: 'Hello',
        time: '10:00',
        avatarUrl: 'https://th.bing.com/th/id/R.0511fb8723c167a3e9c6e2d6c9fdfbe2?rik=g1qfO6KoXZqnkA&riu=http%3a%2f%2fimg.zcool.cn%2fcommunity%2f0121f756dea7b232f875520fe1a758.jpg&ehk=%2fKtwCiwq1KR%2bXYo%2b4fzBI%2boziqWYL7VbOWEcGj%2f0fCk%3d&risl=&pid=ImgRaw&r=0',
        status: 'online'));
    list.add(RecentContact(
        name: 'Jane Coconut',
        message: 'Hi',
        time: '11:00',
        avatarUrl: 'https://th.bing.com/th/id/R.0511fb8723c167a3e9c6e2d6c9fdfbe2?rik=g1qfO6KoXZqnkA&riu=http%3a%2f%2fimg.zcool.cn%2fcommunity%2f0121f756dea7b232f875520fe1a758.jpg&ehk=%2fKtwCiwq1KR%2bXYo%2b4fzBI%2boziqWYL7VbOWEcGj%2f0fCk%3d&risl=&pid=ImgRaw&r=0',
        status: 'offline'));
    list.add(RecentContact(
        name: 'John Smith',
        message: 'Hey',
        time: '12:00',
        avatarUrl: 'https://th.bing.com/th/id/R.0511fb8723c167a3e9c6e2d6c9fdfbe2?rik=g1qfO6KoXZqnkA&riu=http%3a%2f%2fimg.zcool.cn%2fcommunity%2f0121f756dea7b232f875520fe1a758.jpg&ehk=%2fKtwCiwq1KR%2bXYo%2b4fzBI%2boziqWYL7VbOWEcGj%2f0fCk%3d&risl=&pid=ImgRaw&r=0',
        status: 'online'));
    return list;
  }
}
