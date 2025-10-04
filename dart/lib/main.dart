import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lib/config.dart' as config;
import 'navigation/app_router.dart';
import 'providers/auth_provider.dart';
import 'providers/feed_provider.dart';
import 'providers/chat_provider.dart';
import 'providers/ride_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await config.initConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FeedProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => RideProvider()),
      ],
      child: MaterialApp(
        title: 'Vroom',
        theme: ThemeData.light(),
        initialRoute: '/feed',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
