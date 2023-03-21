import 'package:futursity/models/coursemodel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<TopCourses>?> getCourses() async {
    var client = http.Client();

    var uri = Uri.parse('https://futursity.com/course/api/top_courses');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return topCoursesFromJson(json);
    }
  
  }
}
 