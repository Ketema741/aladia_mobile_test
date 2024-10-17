// const kBaseUrl = "https://hakimhub.onrender.com/api";

import 'package:flutter_dotenv/flutter_dotenv.dart';

String kBaseUrl = dotenv.env['BASE_URL'] ?? "https://hakimhub.onrender.com/api";

