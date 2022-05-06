import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar( backgroundColor: Colors.white,
            actions:[Icon(Icons.search, color: Colors.black,),Icon(Icons.menu, color: Colors.black),Icon(Icons.notifications, color: Colors.black), ],
            title: Row(
              children: [
                Text('금호동3가',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),
                IconButton(onPressed: (){}, icon: Icon(Icons.expand_more, color: Colors.black, size: 18, ),),
              ],
            ),
          ),
          body: Container(width: double.infinity, height: 150,padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Row(
                children: [
                  Image.asset('assets/camera.jpeg', width: 150,),
                  Expanded(flex: 1,
                    child: Container(
                      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('물건 이름',style: TextStyle(color: Colors.black, fontSize: 26,),),
                          Text('지역 - 올라온 시간',style: TextStyle(color:Color.fromRGBO(0, 0, 0, 0.5),fontSize: 20),),
                          Text('0000원',style: TextStyle(color: Colors.black,fontSize: 23),),
                          Row( mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite_border, color: Color.fromRGBO(0, 0, 0, 0.5)),
                              Text("좋아요 수",style: TextStyle(color:Color.fromRGBO(0, 0, 0, 0.5), fontSize: 20), )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: (){},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            ),
          ),
          bottomNavigationBar: BottomAppBar(

              child : SizedBox( height: 50,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Icon(Icons.phone), Icon(Icons.message), Icon(Icons.contact_page)],
                ),
              )
          ),
        )
    );
  }
}