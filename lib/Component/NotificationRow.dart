
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({Key? key, required this.nObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.6,
      borderOnForeground: true,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                nObj["image"].toString(),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nObj["title"].toString().length > 30
                          ? nObj["title"].toString().substring(0, 30) + "..."
                          : nObj["title"].toString(),
                      style: TextStyle(
                          fontFamily: Theme.of(context).textTheme.titleMedium!.fontFamily,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    Text(
                      nObj["time"].toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
