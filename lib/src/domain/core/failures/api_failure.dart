class ApiFailure implements Exception {
  ApiFailure(this.error);
  final String? error;
}
