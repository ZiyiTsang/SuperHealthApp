
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({Key? key, required this.nObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                nObj["image"].toString(),
              width: 60,
              height: 60,
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
                nObj["title"].toString().length > 28
                    ? nObj["title"].toString().substring(0, 28) + "..."
                    : nObj["title"].toString(),
                      style: TextStyle(
                          fontFamily: Theme.of(context).textTheme.titleMedium!.fontFamily,
                          color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 18),
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
    );
  }
}
