import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../service/firebase_auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.signIn(event.email, event.password);
        emit(Authenticated(user?.email ?? ''));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.register(event.email, event.password);
        emit(Authenticated(user?.email ?? ''));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authService.signOut();
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
