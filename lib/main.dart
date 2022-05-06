import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}
var MAX = 100;


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = [['김영숙','01012345678'], ['홍길동','01098775432'], ['피자집','0317478463']];
  var like = [0, 0, 0];
  var number =['01012345678', '01098775432', '0317478463'];

  addOne(text, numI){
    setState(() {
      name.add([text,numI]);
      like.add(0);
      //number.add(numI);
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {//context는 부모 위젯의 정보를 담는 변수
    return Scaffold(
        floatingActionButton: Builder(//족보생성기
          builder: (jokbo1) { //부모 정보가 들어잇다
            return FloatingActionButton(
              child: Text('Add'),
              onPressed: (){
                print(context.findAncestorWidgetOfExactType<MaterialApp>());
                showDialog(context: jokbo1, builder: (context){
                  return DialogUI(state : total, addOne : addOne);
                });
              },
            );
          }
        ),



        appBar: AppBar(
          title: Text('연락처 앱 (총 친구수): ' + name.length.toString()),
          actions: [IconButton(onPressed: (){
            setState(() {
              name.sort();//버튼 누르면 정렬
            });
          }, icon: Icon(Icons.sort)),],),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, i){
              return ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Row(children: [
                    Text(name[i][0], style: TextStyle(fontSize: 15),),
                    Text(number[i].toString(), style: TextStyle(fontSize: 15),)],
                    mainAxisAlignment: MainAxisAlignment. spaceBetween,

                  ),
                  trailing: ElevatedButton(
                  child: Text('친구 삭제'),
                  onPressed: (){
                    setState(() {
                      name.removeAt(i);
                      number.removeAt(i);
                    });
                  },
              ),
              );
            },
        ),

        bottomNavigationBar: BotBar(

        ),
      );

  }
}



//stless로 커스텀 위젯 생성
class BotBar  extends StatelessWidget {
  const BotBar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

        child : SizedBox( height: 50,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.phone), Icon(Icons.message), Icon(Icons.contact_page)],
          ),
        )
    );
  }
}

class DialogUI extends StatelessWidget {
   DialogUI({Key? key, this.state, this.addOne}) : super(key: key);
  final state; //부모가 보낸 state는 변경을 잘 안함.
  final addOne;
  var inputData = TextEditingController();
  var inputData2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(height: 210, width: 150, margin: EdgeInsets.all(10),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('친구 추가 ', style: TextStyle(fontSize: 20),),
              TextField(controller: inputData,
                decoration: InputDecoration(labelText: '이름'),),
              TextField(controller: inputData2,
                decoration: InputDecoration(labelText: '번호'),),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancle',style: TextStyle(fontSize: 20),)),
                    TextButton(onPressed: (){
                      if( inputData.text != '' && inputData2.text != '') {
                        print(inputData);
                        addOne(inputData.text, inputData2.text);
                        Navigator.pop(context);
                        }
                      },
                        child: Text('OK', style: TextStyle(fontSize: 20),)),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}


