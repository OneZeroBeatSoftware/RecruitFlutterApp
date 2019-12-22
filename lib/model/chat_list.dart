class ChatData {
  static const _allChats = <Chat>[
    Chat(
        sender: 'images/avatar_2.png',
        content: '您好，我想了解下贵公司产品经理这个岗位。'),
    Chat(
        sender: 'images/avatar_1.png',
        content: '您好，您可以先查看我们这个招聘要求。'),
    Chat(
        sender: 'images/avatar_2.png',
        content: '好的，我看了要求，想发个简历，请您过目。'),
    Chat(
        sender: 'images/avatar_1.png',
        content: '好的'),
  ];

  static List<Chat> loadChats() {
    return _allChats;
  }
}

class Chat {
  final String content;
  final String sender;

  const Chat(
      {this.content,
      this.sender});
}
