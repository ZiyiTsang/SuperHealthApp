import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage("assets/images/ProfileImage/1.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              get_text_box("Email", "666@qq.com"),
              get_text_box("Phone", "123456789"),
              get_text_box("Address", "1234,Street,city"),
            ],
          ),
        ));
  }

  Widget get_text_box(text1, text2) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.edit),
            ],
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
