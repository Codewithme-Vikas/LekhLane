import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.setCategory,
  });

  final bool isSelected;
  final String text;
  final void Function(String) setCategory;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.setCategory(widget.text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isSelected
            ? AppPallete.tagText
            : AppPallete.tagBackground,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.isSelected
              ? AppPallete.textPrimary
              : AppPallete.tagText,
          fontWeight: FontWeight.w600,
          letterSpacing: .3,
        ),
      ),
    );
  }
}
