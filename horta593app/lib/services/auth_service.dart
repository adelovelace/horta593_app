import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:horta593app/exceptions/form_exceptions.dart';
import 'package:horta593app/exceptions/secure_storage_exceptions.dart';
import 'package:horta593app/model/user_model.dart';
import 'package:horta593app/services/secure_storage_service.dart';
import 'package:horta593app/services/helper_service.dart';

class AuthService {
  static const String loginPath = 'token/';
  static const String registerPath = 'users/';
  static const String refreshPath = 'token/refresh/';
  static const String verifyPath = 'token/verify/';

  static Future<User> loadUser() async {
    final json = await SecureStorageService.storage.read(
      key: SecureStorageService.userKey,
    );
    if (json != null) {
      return User.fromJson(jsonDecode(json));
    } else {
      throw SecureStorageNotFoundException();
    }
  }

  static void saveUser(User user) async {
    await SecureStorageService.storage.write(
      key: SecureStorageService.userKey,
      value: user.toJson(),
    );
  }

  static Future<User> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        final user = User.fromJson(json);

        saveUser(user);

        return user;
      case 400:
        final json = jsonDecode(response.body);
        throw handleFormErrors(json);
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: 'Error contacting the server!');
    }
  }

  static Future<void> logout() async {
    await SecureStorageService.storage.delete(
      key: SecureStorageService.userKey,
    );
  }

  static Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        final user = User.fromJson(json);

        saveUser(user);

        return user;
      case 400:
        final json = jsonDecode(response.body);
        throw handleFormErrors(json);
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: 'Error contacting the server!');
    }
  }
}
