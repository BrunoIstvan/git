import 'package:flutter/material.dart';
import 'package:github_profile_bloc_flutter/data/models/profile_model.dart';
import 'package:github_profile_bloc_flutter/pages/widgets/git_user_name_field_widget.dart';

class GitUserDataView extends StatelessWidget {
  //
  final ProfileModel model;
  GitUserDataView(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GitUserNameField(),
        // SizedBox(height: 100),
        Column(
          children: [
            _buildUserAvatar(),
            SizedBox(height: 20),
            _buildUserName(),
            SizedBox(height: 20),
            _buildUserBio(),
          ],
        ),
        // SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2a2a2a).withOpacity(0.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFollowers(),
                  _buildFollowing(),
                  _buildRepository(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildRepository() {
    return Column(
      children: [
        Text(
          (model.publicRepos ?? 0).toString(),
          style: TextStyle(color: Color(0xff2BE1C8), fontSize: 30),
        ),
        Text("REPOSITORIES", style: TextStyle(fontSize: 15)),
      ],
    );
  }

  Column _buildFollowing() {
    return Column(
      children: [
        Text(
          (model.following ?? 0).toString(),
          style: TextStyle(color: Color(0xff2BE1C8), fontSize: 30),
        ),
        Text("FOLLOWING", style: TextStyle(fontSize: 15)),
      ],
    );
  }

  Column _buildFollowers() {
    return Column(
      children: [
        Text(
          (model.followers ?? 0).toString(),
          style: TextStyle(color: Color(0xff2BE1C8), fontSize: 30),
        ),
        Text("FOLLOWERS", style: TextStyle(fontSize: 15)),
      ],
    );
  }

  Padding _buildUserBio() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        model.bio ?? '',
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _buildUserName() {
    return Text(
      model.name ?? '',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container _buildUserAvatar() {
    return Container(
      width: 150,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: NetworkImage(
              model.image ?? 'https://source.unsplash.com/600x600'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
