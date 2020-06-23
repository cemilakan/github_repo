import 'package:flutter/material.dart';
import 'package:githubrepo/model/Repo.dart';
import 'package:githubrepo/services/Service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   void setupWorldTime() async{
     Future<List<Repo>> reponse = getAllRepos();

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


   @override
   Widget build(BuildContext context) {
     return Scaffold(

       body:Center(
         child: SpinKitCircle(
           color: Colors.blue,
           size: 40.0,
         ),
       ),
     );
   }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//                padding: const EdgeInsets.fromLTRB(0,180.0, 0, 0),
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation(Colors.blue),
//                  backgroundColor: Colors.blue[900],
//                ),
//            ),
//          ],
//        ),
//    );
//  }
}