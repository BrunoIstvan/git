import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profile_bloc_flutter/bloc/profile_bloc.dart';
import 'package:github_profile_bloc_flutter/pages/git_user_data_view.dart';
import 'package:github_profile_bloc_flutter/pages/widgets/git_user_name_field_widget.dart';

class GitView extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2BE1C8),
      appBar: AppBar(
        backgroundColor: Color(0xFF188991),
        centerTitle: true,
        elevation: 0,
        title: Text("GitHub Profile", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<ProfileBloc>(context, listen: false)
                    .add(CleanData());
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 650,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileInitial)
                  return GitUserNameField();
                else if (state is ProfileLoading)
                  return buildLoadingState();
                else if (state is ProfileLoaded)
                  return GitUserDataView(state.profile);
                else
                  return GitUserNameField();
              },
              listener: (context, state) {
                if (state is ProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  //
  Widget buildLoadingState() {
    return Center(child: CircularProgressIndicator());
  }
  //
}
