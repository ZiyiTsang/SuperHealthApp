import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPage extends StatefulWidget {
  final String pageTitle;
  final Widget pageInstance;
  final Color color;

  const SubPage({Key? key, required this.pageTitle, required this.pageInstance, required this.color,})
      : super(key: key);

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  Color _color = Colors.blue;
  late final String Page_title;
  late final Widget Page_instance;

  @override
  void initState() {
    super.initState();
    Page_title = widget.pageTitle;
    Page_instance = widget.pageInstance;
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(Page_title,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily),),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text('Back to Home Page'),
                  value: 'home',
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'home') {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Page_instance,
      ),
    );
  }
}
