class AuthResponse {
  AuthResponse(this.accessToken, this.refreshToken, this.tokenType, this.expireIn);

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expireIn;

  // factory CompleteResponse fromJson() {
  //
  // }
}