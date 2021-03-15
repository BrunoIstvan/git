import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_profile_bloc_flutter/data/models/profile_model.dart';
import 'package:github_profile_bloc_flutter/data/profile_repository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //
  final ProfileRepository _profileRepo;
  //
  ProfileBloc(this._profileRepo) : super(ProfileInitial());

  //
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    //
    try {
      //
      if (event is GetUser) {
        yield ProfileLoading();
        final profile = await _profileRepo.fetchUser(event.userName);
        yield ProfileLoaded(profile);
      } else if (event is CleanData) {
        yield ProfileInitial();
      }
      //
    } on UserNotFoundException {
      yield ProfileError('This User was Not Found!');
    }
    //
  }
  //
}
