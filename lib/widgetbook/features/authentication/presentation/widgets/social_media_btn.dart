import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class SocialMediaBtn extends StatefulWidget {
  final String? text;
  final VoidCallback? onTapListener;
  final String iconPath;
  const SocialMediaBtn({
    super.key,
    this.text,
    this.onTapListener,
    required this.iconPath,
  });

  @override
  State<SocialMediaBtn> createState() => _SocialMediaBtnState();
}

class _SocialMediaBtnState extends State<SocialMediaBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 86),
                Image(
                  image: AssetImage(widget.iconPath),
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 24),
                widget.text == ""
                    ? const CircularProgressIndicator()
                    : Text(
                        "${widget.text}",
                        style: const TextStyle(
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

@widgetbook.UseCase(name: 'Google', type: SocialMediaBtn)
SocialMediaBtn buildgoogleButtonUseCase(BuildContext context) {
  return const SocialMediaBtn(
    text: 'Google',
    iconPath: "assets/icons/google.png",
  );
}

@widgetbook.UseCase(name: 'Facebook', type: SocialMediaBtn)
SocialMediaBtn builFacebookButtonUseCase(BuildContext context) {
  return const SocialMediaBtn(
    text: 'Facebook',
    iconPath: "assets/icons/facebook.png",
  );
}

@widgetbook.UseCase(name: 'Apple', type: SocialMediaBtn)
SocialMediaBtn buildAppleButtonUseCase(BuildContext context) {
  return const SocialMediaBtn(
    text: 'Apple',
    iconPath: "assets/icons/apple.png",
  );
}
