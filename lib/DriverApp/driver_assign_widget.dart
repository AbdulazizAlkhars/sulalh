import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:slide_action/slide_action.dart';

import '../Theme/Fonts.dart';

class SwipeToConfirm extends StatefulWidget {
  const SwipeToConfirm({
    Key? key,
  }) : super(key: key);

  @override
  _SwipeToConfirmState createState() => _SwipeToConfirmState();
}

class _SwipeToConfirmState extends State<SwipeToConfirm> {
  bool _swipeCompleted = false;

  @override
  Widget build(BuildContext context) {
    return _swipeCompleted
        ? Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.secondary50,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Assigned To Me',
                style: AppFonts.body1(color: AppColors.grayscale90),
              ),
            ),
          )
        : SlideAction(
            thumbHitTestBehavior: HitTestBehavior.translucent,
            trackHeight: 55,
            trackBuilder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primary30,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Assign To Me",
                    style: AppFonts.body1(color: AppColors.grayscale0),
                  ),
                ),
              );
            },
            thumbBuilder: (context, state) {
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.grayscale0,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(
                    Icons.delivery_dining,
                    color: Colors.black,
                  ),
                ),
              );
            },
            action: () {
              setState(() {
                _swipeCompleted = true;
              });
              debugPrint("Hello World");
            },
          );
  }
}
