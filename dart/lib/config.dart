import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initConfig() async {
  // Load .env
  await dotenv.load();

  final url = dotenv.env['SUPABASE_URL'] ?? '';
  final anon = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  if (url.isEmpty || anon.isEmpty) {
    if (kDebugMode) debugPrint('Supabase env vars not set.');
    return;
  }

  await Supabase.initialize(
    url: url,
    anonKey: anon,
    authCallbackUrlHostname: 'login-callback',
  );
}

