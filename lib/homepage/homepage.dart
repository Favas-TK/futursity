import 'package:flutter/material.dart';
import 'package:futursity/catogories/categories.dart';
import 'package:futursity/homepage/topcourses/topcourse.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.format_line_spacing_outlined),
      ),
      // body: Container(
      //   child: TopCourse(),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Courses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const Text('All Courses'))
              ],
            ),
           const TopCourse(),
            Padding(
              padding: const EdgeInsets.only(right: 210),
              child: const Text(
                'Catogories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Category(),
          ],
        ),
      ),
    );
  }
}
