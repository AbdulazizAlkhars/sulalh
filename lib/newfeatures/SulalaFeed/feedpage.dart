import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hathera_demo/newfeatures/SulalaFeed/breeding_request_modal_widget.dart';
import 'package:hathera_demo/newfeatures/SulalaFeed/add_images_modal_widget.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<String> _imagePaths = [];
  final Map<String, int> _likes = {};
  final Map<String, String> _captions = {}; // Add this map for captions
  final Map<String, bool> _liked = {};
  final Map<String, List<Map<String, dynamic>>> _comments = {};

  void _showImageGridBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.grayscale00,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: AddPhotosModalWidget(
            imagePaths: _imagePaths,
            captions: _captions,
            likes: _likes, // Pass likes map
            onImageAdded: (path, caption) {
              setState(() {
                _imagePaths.add(path);
                _captions[path] = caption;
                _likes[path] = 0;
                _liked[path] = false;
              });
            },
            onImageDeleted: (path) {
              setState(() {
                _imagePaths.remove(path);
                _captions.remove(path);
                _likes.remove(path);
                _liked.remove(path);
              });
            },
          ),
        );
      },
    );
  }

  void _showAddCommentModal(String imagePath) {
    final TextEditingController _commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.grayscale00,
      builder: (BuildContext context) {
        final comments = _comments[imagePath] ?? [];
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments',
                  style: AppFonts.title4(color: AppColors.grayscale90),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      final commentText = comment['text'];
                      final timestamp = comment['timestamp'] as DateTime;
                      final timeAgo = _formatTimeAgo(timestamp);

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.05,
                          backgroundColor: AppColors.primary20,
                        ),
                        title: Text(
                          'Tommy',
                          style: AppFonts.body1(
                            color: AppColors.grayscale90,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentText,
                              style:
                                  AppFonts.body2(color: AppColors.grayscale90),
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                            Text(
                              timeAgo,
                              style: AppFonts.caption2(
                                  color: AppColors.grayscale50),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: AppColors.grayscale20,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 14.0),
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write Comment',
                        hintStyle: AppFonts.body2(color: AppColors.grayscale50),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final comment = _commentController.text.trim();
                    if (comment.isNotEmpty) {
                      setState(() {
                        if (_comments[imagePath] == null) {
                          _comments[imagePath] = [];
                        }
                        _comments[imagePath]!.add({
                          'text': comment,
                          'timestamp': DateTime.now(),
                        });
                      });
                      Navigator.of(context).pop(); // Close the modal
                      _showAddCommentModal(
                          imagePath); // Reopen to refresh comments
                    }
                  },
                  child: Text(
                    'Post Comment',
                    style: AppFonts.body1(color: AppColors.grayscale00),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary30,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h ago';
    } else {
      return '${difference.inDays} d ago';
    }
  }

  void _toggleLike(String path) {
    setState(() {
      if (_liked[path] == true) {
        _likes[path] = (_likes[path] ?? 0) - 1;
      } else {
        _likes[path] = (_likes[path] ?? 0) + 1;
      }
      _liked[path] = !_liked[path]!;
    });
  }

  void _showFullScreenImage(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Dialog(
            backgroundColor: Colors.black,
            child: InteractiveViewer(
              maxScale: 5.0,
              minScale: 0.4,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBreedingRequestModal(String imagePath) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColors.grayscale00,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: BreedingRequestModal(imagePath: imagePath));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale0,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.047,
              backgroundImage: const AssetImage(
                'assets/Marketplace/sulala_only_logo.png',
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              'Sulala Feed',
              style: AppFonts.title3(color: AppColors.grayscale90),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            _imagePaths.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: _imagePaths.length,
                      itemBuilder: (context, index) {
                        final imagePath = _imagePaths[index];
                        final comments = _comments[imagePath] ?? [];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User info row
                            Row(
                              children: [
                                CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.05,
                                  backgroundColor: AppColors.primary20,
                                ),
                                const SizedBox(width: 5.0),
                                Expanded(
                                  child: Text(
                                    'Tommy',
                                    style: AppFonts.body1(
                                      color: AppColors.grayscale90,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Owned By: Suhail',
                                  style: AppFonts.body1(
                                    color: AppColors.primary30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            // Image section
                            GestureDetector(
                              onLongPress: () =>
                                  _showFullScreenImage(imagePath),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  File(imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Spacer
                            SizedBox(height: 8.0),
                            // Like and caption row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => _toggleLike(imagePath),
                                  child: Icon(
                                    _liked[imagePath] == true
                                        ? Icons.pets
                                        : Icons.favorite_border_outlined,
                                    color: _liked[imagePath] == true
                                        ? AppColors.primary20
                                        : Colors.black,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${_likes[imagePath] ?? 0} Likes',
                                  style: AppFonts.body1(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                              ],
                            ),
                            // Flexible caption section
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Suhail',
                                        style: AppFonts.body1(
                                          color: AppColors.grayscale100,
                                        ),
                                      ),
                                      Text(
                                        _captions[imagePath] ?? '',
                                        style: AppFonts.body2(
                                          color: AppColors.grayscale90,
                                        ),
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),
                                      comments.isEmpty
                                          ? InkWell(
                                              onTap: () => _showAddCommentModal(
                                                  imagePath),
                                              child: Text(
                                                'Add Comment..',
                                                style: AppFonts.caption2(
                                                  color: AppColors.primary50,
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () => _showAddCommentModal(
                                                  imagePath),
                                              child: Text(
                                                'View ${comments.length} comment${comments.length > 1 ? 's' : ''}',
                                                style: AppFonts.caption2(
                                                  color: AppColors.primary50,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 4),
                                ElevatedButton(
                                  onPressed: () =>
                                      _showBreedingRequestModal(imagePath),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppColors.primary30,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    'Req. for Breeding',
                                    style: AppFonts.caption2(
                                        color: AppColors.grayscale00),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          heightFactor: 3,
                          child: Image.asset(
                            'assets/illustrations/horse_love.png',
                          ),
                        ),
                      ],
                    ),
                  ),

            // Bottom navigation bar
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _showImageGridBottomSheet,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.secondary50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Add Image',
                    style: AppFonts.body1(color: AppColors.grayscale90),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
