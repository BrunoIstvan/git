import 'dart:convert';

import 'package:github_profile_bloc_flutter/data/models/profile_model.dart';
import 'package:http/http.dart';

class ProfileRepository {
  //
  Future<ProfileModel> fetchUser(String userName) async {
    //
    final Uri api =
        Uri(scheme: 'https', host: 'api.github.com', path: '/users/$userName');
    //
    return await get(api).then((data) {
      //
      final jsonData = json.decode(data.body);

      if (jsonData['message'] == "Not Found") {
        throw UserNotFoundException();
      } else {
        final profile = ProfileModel(
          name: jsonData['login'],
          bio: jsonData['bio'] ?? "",
          followers: jsonData['followers'],
          following: jsonData['following'],
          image: jsonData['avatar_url'],
          publicRepos: jsonData['public_repos'],
        );
        return profile;
      }
    }).catchError((context) {
      throw UserNotFoundException();
    });
  }
}

class UserNotFoundException implements Exception {}
