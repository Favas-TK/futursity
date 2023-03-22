import 'dart:convert';

import 'package:futursity/models/categorymodel.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteService {

   Uri url = Uri.parse("https://futursity.com/course/api/categories");
  Future<List<Categories>> getCategories() async {
    final response = await http.get(url);
//print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body).cast<Map<String, dynamic>>();
      // print(data[0]);
      var products =
          data.map<Categories>((json) => Categories.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('failed to laod products');
    }
  // Future<List<Categories>?> getCategories() async {
  //   var client = http.Client();

  //   var uri = Uri.parse('https://futursity.com/course/api/categories');
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     //var data = jsonDecode(response.body).cast<Map<String, dynamic>>();
  //     var json = response.body;
  //     return categoriesFromJson(json);
  //   }
  //   return null;
   }
}
