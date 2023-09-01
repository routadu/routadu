import 'package:flutter/material.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';

class AnimiatedFilledButton extends StatefulWidget {
  const AnimiatedFilledButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.hoverColor,
    this.onHoverTransform,
    this.padding,
    this.shape,
  });
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Matrix4? onHoverTransform;
  final Padding? padding;
  final OutlinedBorder? shape;
  @override
  State<AnimiatedFilledButton> createState() => _AnimiatedFilledButtonState();
}

class _AnimiatedFilledButtonState extends State<AnimiatedFilledButton> {
  bool isHovered = false;
  late final Matrix4 hoveredTransformed;

  void onHover(bool val) {
    isHovered = val;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    hoveredTransformed = widget.onHoverTransform ?? Matrix4.identity()
      ..scale(1.05)
      ..translate(-5);
  }

  @override
  Widget build(BuildContext context) {
    final transform = isHovered ? hoveredTransformed : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              // backgroundColor: isHovered
              //     ? widget.hoverColor ?? Colors.greenAccent.shade700
              //     : widget.backgroundColor ?? Colors.greenAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  kButtonTextStyle.copyWith(color: Colors.black87),
            )),
      ),
    );
  }
}
