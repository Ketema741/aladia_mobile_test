import 'package:aladia_flutter_test/bloc_observer.dart';
import 'package:aladia_flutter_test/core/constants/size_config.dart';
import 'package:aladia_flutter_test/core/routes/routes.dart';
import 'package:aladia_flutter_test/core/utils/shard_preference.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/otp_bloc/otp_page_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dependency_injection.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  //* Flutter Initialization
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: "assets/config/.env");
  } catch (e) {
    print("Could not load .env file: $e");
  }

  di.init();
  await ShardPrefHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Locale _locale = const Locale('en', '');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<OtpBloc>(
              create: (context) => di.sl<OtpBloc>(),
            ),
            BlocProvider<LoginBloc>(
              create: (context) => di.sl<LoginBloc>(),
            ),
            BlocProvider<RegisterBloc>(
              create: (context) => di.sl<RegisterBloc>(),
            ),
          ],
          child: MaterialApp.router(
            // locale: const Locale('am', ''), // Default language set to Amharic
            locale: _locale, // Set the locale here
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('am', ''), // Amharic
            ],
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily: 'Poppins',
            ),
            debugShowCheckedModeBanner: false,
            title: 'Aladia',
            routerConfig: router,
          ),
        );
      },
    );
  }
}
