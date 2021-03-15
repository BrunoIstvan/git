import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profile_bloc_flutter/bloc/profile_bloc.dart';

class GitUserNameField extends StatelessWidget {
  //
  final TextEditingController _controller = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    submitGitSearch(context, _controller.text);
                  }
                },
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search User Here',
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
    //
  }

  //
  submitGitSearch(BuildContext context, String userName) {
    BlocProvider.of<ProfileBloc>(context, listen: false).add(GetUser(userName));
  }
  //
}
