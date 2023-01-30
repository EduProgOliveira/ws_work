// ignore_for_file: public_member_api_docs, sort_constructors_first
enum SplashStatus { loading, authenticated, unauthenticated }

class SplashState {
  final SplashStatus status;

  SplashState({
    required this.status,
  });

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
