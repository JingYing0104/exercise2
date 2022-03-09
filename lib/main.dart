import 'dart:math';
import 'package:flutter/material.dart';
import 'course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise2',
      home:  MyHomePage(title: 'My Courses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Course> courses = [
    Course("assets/pic1.png","Mandatory Training","Nestle Purpose and Values","Video","02:05 min"),
    Course("assets/pic2.png","Mandatory Training","Data Privacy","Module","20 min"),
    Course("assets/pic3.png","Live Video Training","03 Managing Career Test lorem ipsum","Video","20 min"),
    Course("assets/pic4.png","Live Video Training","02 Personal Branding","Video","20 min"),
    Course("assets/pic5.png","Reading Recources","Sustainability","PDF","12 pages"),

  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
          style: TextStyle(
          color: Color(0xff6C6A73),
          fontSize: 16.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.normal,
        )
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemBuilder:(BuildContext, index){
          return ListTile(
            leading:Container(
              height: 200.0,
              width: 80.0,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Image(image: AssetImage(courses[index].imagefile),
              fit: BoxFit.fill,
            ),
            ),
          title:  Text(courses[index].training,
               style: TextStyle(
               fontSize: 18.0,
               fontFamily: 'Lato',
               fontWeight: FontWeight.bold,
               color: Colors.white,
               backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
          ),
            subtitle: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:<Widget> [
                    Text(courses[index].name,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                          color: Color(0xff6C6A73)
                      ),
                    ),

                    Container(
                      padding: EdgeInsetsDirectional.all(5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children:<Widget> [
                            Icon(Icons.play_circle_outline_sharp,
                              color: Color(0xff66C6A73),
                              size: 15.0,
                            ),
                            Text(courses[index].type,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Lato',
                                color: Color(0xff66C6A73),
                              ),
                            ),

                            Icon(Icons.access_time,
                              color: Color(0xff66C6A73),
                              size: 15.0,
                            ),
                            Text(courses[index].quantity,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Lato',
                                color: Color(0xff66C6A73),
                              ),
                            ),
                          ]

                      ),
                    )
                  ]
              ),

            )




            );

        },
        separatorBuilder: (BuildContext,index)
        {
          return Divider(height:40);
        },
        itemCount:  courses.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,

      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
