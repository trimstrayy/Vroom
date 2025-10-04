import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseClient get client => Supabase.instance.client;

  // Auth
  static Future<GotrueSessionResponse> signUp(String email, String password) async {
    return await client.auth.signUp(email: email, password: password);
  }

  static Future<GotrueSessionResponse> signIn(String email, String password) async {
    return await client.auth.signInWithPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static User? currentUser() {
    return client.auth.currentUser;
  }

  // Posts
  static Future<List<Map<String, dynamic>>> fetchFeed({int limit = 20}) async {
    final res = await client.from('posts').select('id, content, media_url, author, inserted_at').order('inserted_at', ascending: false).limit(limit).execute();
    if (res.error != null) {
      debugPrint('fetchFeed error: ${res.error}');
      return [];
    }
    return List<Map<String, dynamic>>.from(res.data as List);
  }

  static Future<PostgrestResponse> createPost(String content, {String? mediaUrl}) async {
    final res = await client.from('posts').insert({
      'content': content,
      'media_url': mediaUrl,
    }).execute();
    return res;
  }

  // Profiles
  static Future<Map<String, dynamic>?> fetchProfile(String userId) async {
    final res = await client.from('profiles').select('*').eq('id', userId).single().execute();
    if (res.error != null) {
      debugPrint('fetchProfile error: ${res.error}');
      return null;
    }
    return Map<String, dynamic>.from(res.data as Map);
  }

  static Future<PostgrestResponse> updateProfile(String userId, Map<String, dynamic> changes) async {
    final res = await client.from('profiles').update(changes).eq('id', userId).execute();
    return res;
  }
}

