import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:third/Model/Doctor.dart';
import 'package:third/PageSturcture/subPage.dart';

import '../Model/Appcolor.dart';
import '../Page/Clinic/DoctorDetail.dart';

class DoctorRow extends StatelessWidget {
  final Doctor wObj;

  const DoctorRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubPage(
                    pageTitle: 'Doctor',
                    pageInstance: DoctorDetailPage(
                      wObj: wObj,
                    ),
                    color: Colors.purple)));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2)
              ]),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    wObj.image.toString(),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wObj.name.toString(),
                      style:
                          TextStyle(color: MyColors.blackColor, fontSize: 12),
                    ),
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: wObj.rating,
                      direction: Axis.horizontal,
                      itemSize: 25.0,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
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
              ),
              Image.asset(
                "assets/icons/next_page.png",
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ],
          )),
    );
  }
}
