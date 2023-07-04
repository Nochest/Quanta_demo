import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:quanta_demo_app/main.dart';

class DemoService {
  Account account = Account(client);

  Future<Session?> emailSession(String user, String password) async {
    try {
      final value =
          await account.createEmailSession(email: user, password: password);

      inspect(value);
      return value;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> getAccount() async {
    try {
      final value = await account.get();
      return value;
    } catch (e) {
      throw Exception(e);
    }
  }
}
