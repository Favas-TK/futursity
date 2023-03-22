import 'package:flutter/material.dart';
import 'package:futursity/models/categorymodel.dart';
import 'package:futursity/services/catogorymodel.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late List<Categories>? categories;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    categories = await CategoryRemoteService().getCategories();
    if (categories != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 200,
          //childAspectRatio: 0.90,
        ),
        itemCount: categories!.length,
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
                    child:
                        Image.network(categories![index].thumbnail.toString()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    categories![index].name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(categories![index].numberOfCourses.toString()),
                      const Text('  Courses')
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
