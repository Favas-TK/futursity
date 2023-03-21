import 'package:flutter/material.dart';
import 'package:futursity/services/courseremoteservice.dart';

class TopCourses extends StatefulWidget {
  const TopCourses({super.key});

  @override
  State<TopCourses> createState() => _TopCoursesState();
}

class _TopCoursesState extends State<TopCourses> {
  List<TopCourses>? courses;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
     //courses = await RemoteService().getCourses() ;
    if (courses != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            // childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              //margin: const EdgeInsets.only(top: 18, bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.network(''),
                  ),
                  Text('sslc (malayalam)'),
                  Text('1000 INR +Gst'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
