import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/Model/Category.dart';
import 'package:third/Model/Diet.dart';
import 'package:third/Model/PopularDiet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  List<categoryModel> Categories_list = [];
  List<dietModel> Diet_list = [];
  List<PopularDietModel> PopularDiet_list = [];

  void initState() {
    super.initState();
    this.Categories_list = categoryModel.getCatogories_fromHandWrite();
    this.Diet_list = dietModel.getDiet_fromHandWrite();
    this.PopularDiet_list = PopularDietModel.getPopularDiet_fromHandWrite();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(
        children: [
          _searchField(),
          _categoryField(),
          _dietField(),
          _popularDietField(),
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      padding: EdgeInsets.all(0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Column _categoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Categories_list[index].boxColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 110,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(Categories_list[index].image),
                        ),
                      ),
                      Text(Categories_list[index].name),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              itemCount: Categories_list.length,
            ))
      ],
    );
  }

  Column _dietField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Text(
            'Diet',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Diet_list[index].boxColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 200,
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(Diet_list[index].image_path),
                        ),
                      ),
                      Text(
                        Diet_list[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${Diet_list[index].level}|${Diet_list[index].duration}|${Diet_list[index].calorie}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.8))),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              itemCount: Diet_list.length,
            ))
      ],
    );
  }

  Column _popularDietField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Text(
            'Popular Diet',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 2),
          itemCount: PopularDiet_list.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(PopularDiet_list[index].image_paht),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        PopularDiet_list[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${PopularDiet_list[index].level}|${PopularDiet_list[index].duration}|${PopularDiet_list[index].calorie}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.8))),
                    ],
                  )
                ],

              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 25,
          ),
        )
      ],
    );
  }
}
