import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.getProfile();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<UpdatePressed>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.updateProfile(
            name: event.name,
            birthday: event.birthday,
            height: event.height,
            weight: event.weight,
            interest: event.interest);
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<CreatePressed>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.createProfile(
          name: event.name,
          birthday: event.birthday,
          height: event.height,
          weight: event.weight,
        );
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
