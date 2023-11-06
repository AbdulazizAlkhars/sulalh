import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class PrimarySearchBar extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String hintText;
  final TextEditingController? controller;

  const PrimarySearchBar({
    Key? key,
    required this.onChange,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  State<PrimarySearchBar> createState() => _PrimarySearchBarState();
}

class _PrimarySearchBarState extends State<PrimarySearchBar> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.controller != null) {
      _textEditingController.addListener(_onControllerChange);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onControllerChange() {
    widget.onChange(_textEditingController.text);
    setState(() {});
  }

  void _onChanged(String value) {
    if (widget.controller == null) {
      widget.onChange(value);
    } else {
      widget.controller!.text = value;
    }
    setState(() {});
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isTyping = _textEditingController.text.isNotEmpty;

    final Color hintTextColor =
        isTyping ? AppColors.grayscale90 : AppColors.grayscale50;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayscale0,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isFocused ? AppColors.primary30 : AppColors.grayscale20,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: _onChanged,
              focusNode: _focusNode,
              onTap: () {
                _focusNode.requestFocus();
              },
              onEditingComplete: () {
                _focusNode.unfocus();
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppFonts.body2(
                  color: hintTextColor,
                ),
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.grayscale90,
                ),
              ),
              style: AppFonts.body2(
                color: AppColors.grayscale90,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ],
      ),
    );
  }
}
