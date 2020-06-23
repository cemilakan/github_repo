import 'package:flutter/material.dart';
import 'package:githubrepo/model/Repo.dart';
import 'package:githubrepo/services/Service.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('cemilakan\'s Repositories'),
          centerTitle: true,
          elevation: 0,
        ),
        body : FutureBuilder<List<Repo>>(
            future: getAllRepos(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Card(
                        color: Colors.grey[900],
                        shadowColor: Colors.grey[500],
                        child: ListTile(
                          onTap: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(snapshot.data[index].name),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          title: Text(
                            snapshot.data[index].name,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 16.0,
                            ),
                          ),

                          subtitle: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                            child: Text(
                              snapshot.data[index].description == null ? '' : snapshot.data[index].description,
                              style: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].owner.avatarUrl),
                          ),
                        ),
                      ),
                    );
                  },
                );

              }else{
                return CircularProgressIndicator();
              }
            }
        )
    );
  }
}

//
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: Home()
//    );
//  }
//}
//
//class Home extends StatelessWidget{
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(),
//        body : Column()
//    );
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(),
//        body : FutureBuilder<List<Repo>>(
//            future: getAllRepos(),
//            builder: (context, snapshot) {
//              if(snapshot.hasData) {
//                return Text('Title from Post JSON : ${snapshot.data[0].name}');
//              }else{
//                return CircularProgressIndicator();
//              }
//            }
//        )
//    );
//  }

//}