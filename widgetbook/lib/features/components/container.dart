import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'with green color',
  type: Container,
  path: '[widgets]/containers',
)
Widget greenContainerUseCase(BuildContext context) {
  return Column(
    children: [
      Container(
        color: Colors.green,
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'with different title',
  type: Container,
  path: '[widgets]/containers',
)
Widget myWidget(BuildContext context) {
  return const ButtonContainerWidget(
    text: "Enter",
  );
}

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
          color: Colors.white.withOpacity(0.5),
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
