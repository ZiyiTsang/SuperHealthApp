import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marquee/marquee.dart';
import 'package:third/Model/Category.dart';
import 'package:third/Model/Diet.dart';
import 'package:third/Model/PopularDiet.dart';
import 'package:third/Model/Favorite_diet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  List<categoryModel> Categories_list = [];

  // List<dietModel> Diet_list = [];
  List<favourite_diet> favoriteDiet_list = [];
  List<PopularDietModel> PopularDiet_list = [];

  void initState() {
    super.initState();
    this.Categories_list = categoryModel.getCatogories_fromHandWrite();
    // this.Diet_list = dietModel.getDiet_fromHandWrite();
    this.favoriteDiet_list = favourite_diet.get_favourite_diet();

    this.PopularDiet_list = PopularDietModel.getPopularDiet_fromHandWrite();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(
        children: [
          _run_hourse(),
          _searchField(),
          _categoryField(),
          _dietField(),
          _popularDietField(),
        ],
      ),
    );
  }
  Container _run_hourse() {
    return Container(
      width: double.infinity,
      height: 50,
      child: Marquee(
        text: "Today News:    1.Cats insist on jogging every day, aiming to become the world's first marathon champion cat. 2.Elephants abandon weightlifting in favor of yoga, calling it swaying yoga . 3.Pandas try to learn boxing, but every punch they throw is defeated by their own cuteness. 4.Rabbits jog every morning, aiming to become the fastest legs in the forest.",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow[800]),
        textScaleFactor: 1.2,
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 40.0,
        velocity: 200.0,

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
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Text(
            'Diet',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
            height: 260,

            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child:
                              Image.asset(favoriteDiet_list[index].image_path),
                        ),
                      ),

                      Text(
                        favoriteDiet_list[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      Text(favoriteDiet_list[index].descrption),
                      //rate
                      RatingBar.builder(
                        initialRating: favoriteDiet_list[index].rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 6,
                        itemSize: 25,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              itemCount: favoriteDiet_list.length,
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
