import 'package:flutter/material.dart';
import '../screens/feed/feed_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/community/community_screen.dart';
import '../screens/ride/ride_screen.dart';
import '../screens/auth/login_screen.dart';
import '../widgets/app_shell.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/feed':
        return MaterialPageRoute(builder: (_) => const AppShell());
      case '/chats':
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case '/communities':
        return MaterialPageRoute(builder: (_) => const CommunityScreen());
      case '/rides':
        return MaterialPageRoute(builder: (_) => const RideScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AppShell());
    }
  }
}
