import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextInputType keyboardType;
  final String? labelText;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.keyboardType,
    this.labelText,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController _controller = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkShowClearIcon);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkShowClearIcon() {
    setState(() {
      _showClearIcon = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _controller.clear();
      _showClearIcon = false;
    });
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _showClearIcon
              ? GestureDetector(
                  onTap: _clearText,
                  child: Icon(Icons.clear),
                )
              : null,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
