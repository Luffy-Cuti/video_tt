part of 'auth_bloc.dart';

enum AuthStatus { unauthenticated, loading, authenticated }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.username = '',
  });

  final AuthStatus status;
  final String username;

  AuthState copyWith({AuthStatus? status, String? username}) {
    return AuthState(
      status: status ?? this.status,
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [status, username];
}