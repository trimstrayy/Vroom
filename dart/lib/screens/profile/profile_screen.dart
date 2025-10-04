import 'package:flutter/material.dart';
import '../../services/supabase_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _profile;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final user = SupabaseService.currentUser();
    if (user == null) {
      Navigator.of(context).pushReplacementNamed('/login');
      return;
    }
    final profile = await SupabaseService.fetchProfile(user.id);
    setState(() {
      _profile = profile;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CircleAvatar(radius: 36, backgroundImage: _profile?['avatar_url'] != null ? NetworkImage(_profile!['avatar_url']) : null),
                  const SizedBox(height: 12),
                  Text(_profile?['username'] ?? 'No username', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(_profile?['bio'] ?? '', style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () async { await SupabaseService.signOut(); Navigator.of(context).pushReplacementNamed('/login'); }, child: const Text('Logout')),
                ]),
              ),
      ),
    );
  }
}
