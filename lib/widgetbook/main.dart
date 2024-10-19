// lib/widgetbook.dart
import 'package:aladia_flutter_test/core/theme/dartk_theme.dart';
import 'package:aladia_flutter_test/core/theme/light_theme.dart';
import 'package:aladia_flutter_test/widgetbook/main.directories.g.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;


void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: darkTheme
            ),
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        LocalizationAddon(
          locales: [
            const Locale('en'),
            const Locale('it'),
          ],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
          ],
        ),
        AlignmentAddon(),
        ZoomAddon(),


      ],
    );
  }
}