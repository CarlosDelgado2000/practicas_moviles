import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String userEmail;

  Authenticated(this.userEmail);

  @override
  List<Object?> get props => [userEmail];
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class Unauthenticated extends AuthState {}
