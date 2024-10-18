import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonContainerWidget extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? onTapListener;
  final bool isActive;
  const ButtonContainerWidget({
    super.key,
    this.color,
    this.text,
    this.isActive = false,
    this.onTapListener,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: isActive ? onTapListener : null,
        child: Opacity(
          opacity: isActive ? 1 : 0.5,
          child: Center(
            child: text == ""
                ? const CircularProgressIndicator()
                : Text(
                    "$text",
                    style:  TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
