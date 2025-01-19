class APIResponse {
  final bool isError;
  final String errorMessage;
  final List data;

  APIResponse(
      {this.isError = false, this.errorMessage = "", this.data = const []});
}
