import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ButtonContainerWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTapListener;
  final bool isActive;
  const ButtonContainerWidget({
    super.key,
    this.text,
    this.isActive = false,
    this.onTapListener,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
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

@widgetbook.UseCase(name: 'Inactive', type: ButtonContainerWidget)
ButtonContainerWidget buildInactiveButtonUseCase(BuildContext context) {
  return const ButtonContainerWidget(
    text: 'In Active Enter',
  );
}

@widgetbook.UseCase(name: 'Active', type: ButtonContainerWidget)
ButtonContainerWidget buildActiveButtonUseCase(BuildContext context) {
  return const ButtonContainerWidget(
    text: 'Active Enter',
    isActive: true,
  );
}