import "dart:convert";
import "dart:developer";
import "package:assignment/models/data/api_model.dart";
import "package:http/http.dart" as http;

class DataAPIProvider {
  String baseUrl =
      //"https://raw.githubusercontent.com/Emmanuel-Whings/test/refs/heads/main";
      "https://raw.githubusercontent.com/paadevelopments/Windows_Notification_Daemon/refs/heads/main";
  Future<APIResponse> fetchUsers() async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse("$baseUrl/sample.json"));
      if (response.statusCode != 200) {
        throw Exception("Server returned error");
      }
      return APIResponse(isError: false, data: jsonDecode(response.body));
    } catch (error) {
      log(error.toString());
      return APIResponse(isError: true, errorMessage: "Unable to load users");
    }
  }
}
