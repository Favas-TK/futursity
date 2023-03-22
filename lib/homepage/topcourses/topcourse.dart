import 'package:flutter/material.dart';
import 'package:futursity/models/coursemodel.dart';
import 'package:futursity/services/courseremoteservice.dart';

class TopCourse extends StatefulWidget {
  const TopCourse({super.key});

  @override
  State<TopCourse> createState() => _TopCourseState();
}

class _TopCourseState extends State<TopCourse> {
  List<TopCourses>? courses;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    courses = await RemoteService().getCourses();
    if (courses != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: courses!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
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
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(courses![index].thumbnail),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      courses![index].title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(courses![index].price),
                  ],
                )),
          );
        },
      ),
    );
  }
}
