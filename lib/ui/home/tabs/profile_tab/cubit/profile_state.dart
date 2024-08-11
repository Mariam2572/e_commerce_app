part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {
  String errorMessage;
  ProfileError({required this.errorMessage});
}

final class ProfileSuccess extends ProfileState {
  final GetUserInfoEntity getUserInfoEntity;
  ProfileSuccess(this.getUserInfoEntity);
}
