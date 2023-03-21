import 'package:futursity/models/categorymodel.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteService {
  Future<List<Categories>?> getCategories() async {
    var client = http.Client();

    var uri = Uri.parse('https://futursity.com/course/api/categories');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return categoriesFromJson(json);
    }
    return null;
  }
}
