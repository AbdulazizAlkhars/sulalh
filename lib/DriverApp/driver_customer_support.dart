import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipe_to/swipe_to.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale20,
      appBar: AppBar(
        backgroundColor: AppColors.grayscale20,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        title: Text(
          'Customer Support',
          style: AppFonts.headline3(
            color: AppColors.grayscale90,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final List<Message> _messages = List.generate(
    0,
    (index) => Message(
      sender: 'Sender $index',
      text: 'Message $index',
      time: DateTime.now(),
    ),
  );

  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return SwipeTo(
                onLeftSwipe: (details) {
                  _showSwipeDialog(_messages[index], 'Left Swipe');
                },
                onRightSwipe: (details) {
                  _showSwipeDialog(_messages[index], 'Right Swipe');
                },
                child: MessageBubble(
                  message: _messages[index],
                  isMe:
                      index % 3 == 0, // Alternating messages for demonstration
                ),
              );
            },
          ),
        ),
        _buildInputField(),
      ],
    );
  }

  void _showSwipeDialog(Message message, String direction) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You swiped $direction.'),
              SizedBox(height: 8),
              Text('Message: ${message.text}'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showReplyField(message);
                    },
                    child: Text('Reply'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showReplyField(Message message) {
    // Implement logic to show reply field or any other action to reply to the message
  }
  Widget _buildInputField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: AppColors.grayscale20), // Outline color
              color: Colors.white, // Background color
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        maxLines: null,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: "Message",
                          hintStyle: TextStyle(
                              color: AppColors
                                  .grayscale60), // Change hint text color

                          border: InputBorder.none,
                        ),
                      )),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.primary50,
                  ),
                  onPressed: () {
                    _sendMessage(_textEditingController.text);
                    _scrollToBottom();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(
          Message(
            sender: 'You',
            text: text,
            time: DateTime.now(), // Set the current time
          ),
        );
        _textEditingController.clear();
      });
      // Scroll to the end after adding a new message
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime time;

  Message({required this.sender, required this.text, required this.time});
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * 0.8, // Set maximum width
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primary40 : AppColors.grayscale0,
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe ? const Radius.circular(25) : const Radius.circular(0),
              topRight: const Radius.circular(25),
              bottomLeft: const Radius.circular(25),
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: AppFonts.body1(
                    color: isMe ? AppColors.grayscale0 : AppColors.grayscale90,
                  ),
                ),
                Text(
                  _formatTime(message.time),
                  style: AppFonts.caption2(
                    color: isMe ? AppColors.grayscale20 : AppColors.grayscale60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inDays > 0) {
      return '${time.day}/${time.month}/${time.year}';
    } else {
      return '${time.hour}:${time.minute}';
    }
  }
}
