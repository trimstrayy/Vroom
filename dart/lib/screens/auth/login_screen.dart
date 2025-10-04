import 'package:flutter/material.dart';
import '../../services/supabase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text('Welcome to Vroom', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : () async {
                  setState(() => _loading = true);
                  try {
                    await SupabaseService.signIn(_emailCtrl.text.trim(), _passCtrl.text.trim());
                    Navigator.of(context).pushReplacementNamed('/feed');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
                  } finally {
                    setState(() => _loading = false);
                  }
                },
                child: _loading ? const CircularProgressIndicator() : const Text('Login'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () async {
                  // Simple signup for demo
                  setState(() => _loading = true);
                  try {
                    await SupabaseService.signUp(_emailCtrl.text.trim(), _passCtrl.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signed up, check email to confirm')));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
                  } finally {
                    setState(() => _loading = false);
                  }
                },
                child: const Text('Sign up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
