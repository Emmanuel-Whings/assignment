import "package:assignment/models/data/api_model.dart";
import "package:assignment/models/data/user_model.dart";
import "package:assignment/services/providers/data_provider.dart";

class DataRepository {
  final DataAPIProvider _dataAPIProvider = DataAPIProvider();

  Future<List<User>> getAllUsers() async {
    APIResponse response = await _dataAPIProvider.fetchUsers();
    if (response.isError) {
      throw Exception(response.errorMessage);
    }
    return response.data.map((element) => User.fromJson(element)).toList();
  }
}
