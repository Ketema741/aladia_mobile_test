import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/features/customs/app_theme.dart';

class SocialMediaBtn extends StatelessWidget {
  final Color? color;
  final String? text;
  final Widget icon;
  final VoidCallback? onTapListener;
  const SocialMediaBtn({
    super.key,
    this.color,
    this.text,
    this.onTapListener,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
      final theme = AppTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.color.withOpacity(0.3),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 34,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
             alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 86.w),
                icon,
                SizedBox(width: 24.w),
                text == ""
                    ? const CircularProgressIndicator()
                    : Text(
                        "$text",
                        style:  TextStyle(
                          color: theme.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


@widgetbook.UseCase(name: 'Default', type: SocialMediaBtn)
Widget buildCoolButtonUseCase(BuildContext context) {

  return MaterialApp(
    theme: ThemeData.light(),
    home: const SocialMediaBtn(
      icon: Icon(Icons.apple),
      color: Colors.red,
      text :'Google',
    ),
  );
}