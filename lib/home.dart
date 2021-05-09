import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist/tasks.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  int index = 0;
  Widget build(BuildContext context) {
    List<Widget> body = [

      Center(
          child: ListView.builder(
              itemCount: Task.tasks.length,
              itemBuilder:(context,i)=>NewContainer(index: i,)



          ),

        ),

      Center(

          child: TextField(

              decoration:   InputDecoration(
                filled: true,
                fillColor: Colors.deepPurple[200],
                icon: Icon(Icons.add,color: Colors.blueGrey,),
                hintText: 'Add your new task'
              ),
            onSubmitted: (input){
                setState(() {
                   Task.tasks.add(input);
                });
            },
          ),
        ),

    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: body[index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          iconSize: 20.0,
          onTap: (dex) {
            setState(() {
              index = dex;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(

                backgroundColor: Colors.deepPurple,
                leading: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                      'https://www.incimages.com/uploaded_files/image/1920x1080/getty_506910700_160576.jpg'),
                ),
                title: Text(
                  'Your APP'
                ),

              ),
              ListTile(
                leading: (Icon(
                  Icons.add,
                  size: 30.0,
                )),
                title: Text(
                  'add ',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              ListTile(
                leading: (Icon(
                  Icons.share,
                  size: 30.0,
                )),
                title: Text(
                  'share',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              ListTile(
                leading: (Icon(
                  Icons.settings,
                  size: 30.0,
                )),
                title: Text(
                  'settings',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              ListTile(
                leading: (Icon(
                  Icons.logout,
                  size: 30.0,
                )),
                title: Text(
                  'Exit',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Tasks APP',
          ),
        ),
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  final int index;
  const NewContainer({
    Key key,this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100.0,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration:  BoxDecoration(
        color: Colors.deepPurple[200],

      ),
      child:Column(
        children:[
          Text(
        Task.tasks[index],
        style:TextStyle (
          fontSize: 20.0,
        ),
      ),
          MaterialButton(
              onPressed:() {
                Task.tasks.removeAt(index);
              },
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Center(
                child: Icon(
                    Icons.done,
                  color: Colors.lightGreenAccent,
                  size: 50.0,
                  )
              ),

            ),
          ),

    ]

    )
    );
  }
}





