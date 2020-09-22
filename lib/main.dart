
import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:auto_localization/auto_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';



class _View extends StatefulWidget {
  const _View({Key key}) : super(key: key);
  @override
  ViewState createState() => new ViewState();
}

class ViewState extends State<_View>
    with TickerProviderStateMixin {


  var _wizard;
  var  _decoList=BoxDecoration(border: Border.all(color: Color.fromARGB(249, 249, 249, 249)));
  final _biggerFont= const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue);
  final _passThisYear= const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black);
  final _reasons= const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white);
  final _appTitle= const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, );
  final _biggerFontTheory= const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue);
  final _infoFont= const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black, height: 1.40);
  final _infoDialog= const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black, wordSpacing: 1.2, );
  final _searchKey=GlobalKey<State>();
  int _tabItemValue=0;
 final ItemScrollController _itemScrollController=ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  final ItemScrollController _itemScrollController_1=ItemScrollController();
  final ItemPositionsListener _itemPositionsListener_1 = ItemPositionsListener.create();
  final ItemScrollController _itemScrollController_2=ItemScrollController();
  final ItemPositionsListener _itemPositionsListener_2 = ItemPositionsListener.create();
  final ItemScrollController _itemScrollController_3=ItemScrollController();
  final ItemPositionsListener _itemPositionsListener_3 = ItemPositionsListener.create();
  final ItemScrollController _itemScrollController_4=ItemScrollController();
  final ItemPositionsListener _itemPositionsListener_4 = ItemPositionsListener.create();
  String _title = "KörKortApp";
  String _query = "";
  bool _isDisabled=false;
  bool _isInView=true;
  bool _isTrafficSymbols=false;
  TabController _tabController;
  List<String> symbols= new List();
  Map<String, String> details=new Map();
  var count=0;
  Timer _timer;
  final List<Tab> _tabs = <Tab>[

      Tab(icon: Icon(_tab_choices[0].icon), text: _tab_choices[0].title),
      Tab(icon: Icon(_tab_choices[1].icon), text: _tab_choices[1].title, )
      , Tab( icon: Icon(_tab_choices[2].icon), text: _tab_choices[2].title, ),

  ];




  void setTitle(String _title) {

    this._title = _title;
  }

  String getTitle() {
    return _title;
  }
  void setQuery(String _query) {

    this._query= _query;
  }

  String getQuery() {
    return _query;
  }

 List signs(String context){
   symbols.clear();
   details.clear();
   for(int x=0;x<427;x++){
  if(symbols.length<427){

        if(context=="🎴 Warning Signs" && x<58 && !(symbols.length>59)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        } else if(context=="🎴 Give way signs" && x>77 && x<87 && !(symbols.length>87)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");



        }  else if(context=="🎴 Traffic Light Signs" && x>59 && x<69 && !(symbols.length>69)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");



        } else if(context=="🎴 Road Markings" && x>68 && x<78 && !(symbols.length>78)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");



        }else if(context=="🎴 Mandatory Signs" && x>175 && x<198 && !(symbols.length>198)){
          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Prohibitory Signs" && x>86 && x<170 && !(symbols.length>170)){


          if(x==[119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137,
            138, 139, 140, 141, 142, 143, 144, 145, 154, 155, 156, 157, 158, 160, 161, 162, 163, 164, 167].elementAt(count)){

            count++;
            if(count==38){
              count=0;
            }
          }else{
            details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
            symbols.add("signs/roadsigns/asset $x.png");

          }

        }else if(context=="🎴 Prohibitory Signs" && x>109 && x<118 && !(symbols.length>118)){
          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Speed Limits" && x>118 && x<129 && !(symbols.length>129)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Instruction Signs" && x>197 && x<227 && !(symbols.length>227)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        } else if(context=="🎴 Direction Signs" && x>226 && x<273 && !(symbols.length>273)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        } else if(context=="🎴 Direction Signs For Information About Services" && x>287 && x<315 && !(symbols.length>315)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Direction Signs For Information About Public Establishments" && x>272 && x<283 && !(symbols.length>283)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Direction Signs For Tourist Attractions" && x>384 && x<389 && !(symbols.length>389)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Direction Signs For Pedestrian And Cyclist" && x>282 && x<288 && !(symbols.length>288)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Information Signs" && x>388 && x<391 && !(symbols.length>391)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Symbols" && x>362 && x<366 && !(symbols.length>366)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Supplementary Plates" && x>314 && x<345 && !(symbols.length>345)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }
        else if(context=="🎴 Traffic Officers" && x>359 && x<363 && !(symbols.length>363)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Police Officers" && x>365 && x<375 && !(symbols.length>375)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Other Devices for Giving Instructions" && x>347 && x<360 && !(symbols.length>360)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Railway Level Crossing" && x>375 && x<385 && !(symbols.length>385)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Delineator Posts" && x>57 && x<60 && !(symbols.length>60)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }else if(context=="🎴 Central Barrier Roads" && x>344 && x<348 && !(symbols.length>348)){

          details[_symbolsInfo[x].title]=_symbolsInfo[x].info;
          symbols.add("signs/roadsigns/asset $x.png");
        }




  }

   }

   return  symbols;
 }
Widget _popRoadSignImage(var choice, int index){
 return new Container(child: ListTile(leading: InkWell( child: Image(image:AssetImage(signs(choice.title)[index], ), ), ), isThreeLine: true,
    subtitle:Text("jhdfhjdhf"), title: Text("Love", style: _biggerFont, ),
    onTap: () {
      var dialog=ClipRRect(child:  AlertDialog(actions: <Widget>[Container(child:Image(image: AssetImage(signs(choice.title)[index]), height: 118, ), )],
        title: Text("sdkjfsdf"),
      ),borderRadius: BorderRadius.all(Radius.circular(12)), );

      showDialog(context: _scaffoldKey.currentContext, child:  dialog);
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _isSnackBarClose=false;
    }, contentPadding: EdgeInsets.all(8), ), decoration: _decoList, );
}
Widget  _trafficSymbols(var choice){

    _isTrafficSymbols=true;
 return new Container(child: new ScrollablePositionedList.builder(itemBuilder:(context,  index) {
   return  _popRoadSignImage(choice,  index);

  }, itemCount:details.length, itemPositionsListener: _itemPositionsListener_1, itemScrollController: _itemScrollController_1,scrollDirection:_scrollDirection,initialScrollIndex: 0, ), decoration: _decoList, );
}
 Widget _trafficItems(var choice,index){


      return new Container(child: ListTile(onTap: (){
      signs(choice.title);
      _isDisabled=true;
      _isInView=false;

      setState(() {

       setTitle(choice.title);

    //  _wizard =_trafficSymbols(choice);

      });


      }, leading: Container(child:Icon(choice.icon, size: choice.size, color: Colors.white, ), decoration: BoxDecoration(color:Colors.teal, border: Border.all(color:Colors.white60,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(110))), padding: EdgeInsets.all(10),height: 60, ), isThreeLine: true,
        subtitle: Text(_trafficSignTranslatedInfo.elementAt(index), style:_infoFont, softWrap: true, ), title: Text(
            _trafficSignTranslatedTitle.elementAt(index),
            style: _biggerFont,

          ),
        contentPadding: EdgeInsets.all(8), shape: RoundedRectangleBorder(side: BorderSide(width: 40,color:Colors.white60),),),decoration: _decoList,);


  }
  Widget _theoryItems(var choice,index){


    return new Container(child: ListTile(isThreeLine: true,
      subtitle: Container(child: Stack(children: [
        Container(height: 240, margin: EdgeInsets.fromLTRB(0,  20,  0,  0),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(choice.icon), fit: BoxFit.fill, ),  borderRadius: BorderRadius.all(Radius.circular(2)), color: Colors.teal, ), padding: EdgeInsets.all(9), ),
        Container(margin: EdgeInsets.fromLTRB(1,  278,  1,  1), child:Text(_theoryTranslatedInfo.elementAt(index), style:_infoFont, ),),
        Container(child:Text(
          _theoryTranslatedTitle.elementAt(index),
          style: _appTitle,
          softWrap: true,
        ), padding: EdgeInsets.all(8), width: 800, margin: EdgeInsets.fromLTRB(0,  0,  0,  6), decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.only(topLeft:Radius.circular(4), topRight: Radius.circular(4) )), ),


      ], fit: StackFit.loose, ), decoration: _decoList,),
      contentPadding: EdgeInsets.all(0), ),decoration: _decoList,);


  }

  Widget _mainPageItems(int index){



    return new ListTile(isThreeLine: true,
      subtitle: Text(_mainPageAllDeviceListTranslatedInfo[index], style:_infoFont, softWrap: true, ), title: Text(
        _mainPageAllDeviceListTranslatedTitle[index],
        style: _biggerFontTheory,

      ),
      contentPadding: EdgeInsets.all(4), leading: Image(image:AssetImage(allDeviceList[index].icon), ), );


  }
  var _mainFreeTestButton= TextStyle(color: Colors.white, fontSize: 18);
  var _mainTextParagraph= TextStyle(color: Colors.yellow);
  var  _scrollDirection=Axis.vertical;
    void _helpElement(){
      showDialog(context: _scaffoldKey.currentContext, child:  ClipRRect(child:AlertDialog(title: Text('Help with road signs'), content:  Container(child:SingleChildScrollView(child: Stack(children: [

       Container(child: Image(image: AssetImage("signs/roadsigns/help_road_signs.png"), height: 150, width: 400, )),
        Container(child:Image(image: AssetImage("signs/roadsigns/hand_click.gif"), height: 60, ), margin:EdgeInsets.only(top: 156, left: 162) , ),
        Container(child:Text("To navigate through the road signs you can click on the "
            "wording or the road sign to proceed.",  style: _infoDialog, softWrap: true, ), margin: EdgeInsets.only(top:210), ),
        Container(child:RaisedButton(
            child: Text('Cancel', style: _appTitle, ),
            onPressed: (){ Navigator.of(_scaffoldKey.currentContext).pop(false);
            _scaffoldKey.currentState.hideCurrentSnackBar();
            _isSnackBarClose=false;
            _isDisabled=false;

            return Future.value(false);
            }, color: Colors.teal, ), margin:EdgeInsets.only(top:310),  ),
      ], )),  decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(12)), ), ), ), borderRadius: BorderRadius.all(Radius.circular(12)), ), );
    }
  Widget _mainPage(List title,List info,List mainPageInfoIcon){


    setState(() {

      _wizard = new SingleChildScrollView(child:  Stack(children:
      [Stack(children:
      [Container(decoration:
      BoxDecoration(image: new DecorationImage(image: AssetImage(mainPageInfoIcon[0].icon), fit:BoxFit.fitHeight),  ), height: 250, ),
        Container(child:Stack(children:[new Container(child:Text(title[0].toString() +" "+new DateTime.now().year.toString(), style:_passThisYear , ),
          margin:EdgeInsets.fromLTRB(0,  4,  65,  10), padding:EdgeInsets.all(1) ,  alignment: Alignment.center, ),
          Container(child:Text(info[0]), padding: EdgeInsets.fromLTRB(10,  50,  10,  10), ),
          Container(child: MaterialButton(child:Text(info[3], style: _mainFreeTestButton, ), onPressed:freeTest , ), margin:EdgeInsets.fromLTRB(40,  148,  6,  20), decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2)), color: Colors.teal), )], )
          ,   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4))), margin:EdgeInsets.fromLTRB(10,  20,  6,  5) , alignment: Alignment.center, )]),

        Container(child: Stack(children:
        [Container(child:Text(title[1], style: _passThisYear, ), margin: EdgeInsets.fromLTRB(5,  46,  50,  1), ),
          Container(child:Text(info[1], ), margin: EdgeInsets.fromLTRB(1,  78,  1,  1), ),
          Container(child:MaterialButton(onPressed: null, child: Text(title[4], style: _mainFreeTestButton, ), ),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),  color: Colors.teal, ), margin: EdgeInsets.fromLTRB(20,  180,  1,  1), ),
          Container(child:MaterialButton(onPressed: null, child: Text(info[4], style: _mainFreeTestButton, ), ),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),  color: Colors.teal, ), margin: EdgeInsets.fromLTRB(200,  180,  1,  1), )], ),
          margin: EdgeInsets.fromLTRB(2,  250,  2,  4), decoration:
          BoxDecoration(image: new DecorationImage(image:AssetImage(mainPageInfoIcon[1].icon), fit: BoxFit.fitHeight)), height: 280, ),

        //Ad
        Container(child: Stack(children:
        [Container(child:Text(title[2], style: _passThisYear, ), margin: EdgeInsets.fromLTRB(5,  46,  50,  1), ),
          Container(child:Text(info[2], ), margin: EdgeInsets.fromLTRB(1,  78,  1,  1), ), ], ),
          margin: EdgeInsets.fromLTRB(2,  490,  2,  4), decoration:
          BoxDecoration(image: new DecorationImage(image:AssetImage(_mainPageInfo[1].icon), fit: BoxFit.cover)), height: 280, ),




        Container(child: Stack(children:
        [Container(child:Text(title[3], style: _reasons, ), margin: EdgeInsets.fromLTRB(4,  46,  50,  1), padding: EdgeInsets.all(8),
          decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)),  color: Colors.teal, ) , height: 40, alignment: Alignment.center, ),
          Container(child:   ScrollablePositionedList.builder(itemBuilder:(context,  index) {


            return _mainPageItems(index);
          },  itemCount:allDeviceList.length, scrollDirection:_scrollDirection,itemPositionsListener: _itemPositionsListener_3,itemScrollController: _itemScrollController_3,initialScrollIndex: 0), margin: EdgeInsets.fromLTRB(1,  100,  1,  1), ),
        ], ),
          margin: EdgeInsets.fromLTRB(30,  720,  2,  4), height: 280, alignment: Alignment.center, )
      ], ),  );
    });//;

    return _wizard;
  }
 void freeTest(){
    setState(() {
      _wizard=Container(child: Text("Hello"), );
    });


  }



Widget _tabBarViewer(var value){

  _isTrafficSymbols=false;
  setTitle("KörKortApp");
  return new  TabBarView(

    controller: _tabController,
    children: <Widget>[ScrollablePositionedList.builder(itemBuilder:(context,  index) {
      final _suggestion=<Choice>[_trafficSign[index]];
      return _trafficItems(_suggestion[0],index);
    },itemCount: _trafficSign.length, padding: const EdgeInsets.all(4), itemScrollController:_itemScrollController,itemPositionsListener:  _itemPositionsListener,scrollDirection:_scrollDirection,initialScrollIndex: 0,), ScrollablePositionedList.builder(itemBuilder:(context,  index) {
      final _suggestion=<Theory>[_theoryInfo[index]];
      return _theoryItems(_suggestion[0],index);
    }, itemCount: _theoryInfo.length, padding: const EdgeInsets.all(4),   itemScrollController:_itemScrollController_2,itemPositionsListener:  _itemPositionsListener_2,scrollDirection:_scrollDirection,initialScrollIndex: 0), Icon(Icons.radio)],
  );

}
  List _theoryInfoToTranslate;
  List _translateText;
  List _theoryTranslatedInfo;
  List _theoryTranslatedTitle;
  List _theoryTitleToTranslate;
  List _trafficSignInfoToTranslate;
  List _trafficSignTranslatedInfo;
  List _trafficSignTranslatedTitle;
  List _trafficSignTitleToTranslate;
  List _trafficSignSymbolsInfoToTranslate;
  List _trafficSignSymbolsTranslatedInfo;
  List _trafficSignSymbolsTranslatedTitle;
  List _trafficSignSymbolsTitleToTranslate;
  List _mainPageInfoToTranslate;
  List _mainPageTranslatedInfo;
  List _mainPageTranslatedTitle;
  List _mainPageTitleToTranslate;
  List _mainPageAllDeviceListInfoToTranslate;
  List _mainPageAllDeviceListTranslatedInfo;
  List _mainPageAllDeviceListTranslatedTitle;
  List _mainPageAllDeviceListTitleToTranslate;
  bool _isLoadingVisible=true;
  double _progress =0.4;
  Text check=new Text("");
  Timer _futureTimer;
  List <Widget> dispatchTranslation(){


 count=count+1;




   // Future.delayed(Duration(seconds:2),(){});

       if(count==1) {
         _translateText.add(TranslateBuilder(
             _mainPageTitleToTranslate.toList(), (stringList, isTranslate) {
           if (isTranslate &&
               _mainPageTranslatedTitle.length != stringList.length) {
             _mainPageTranslatedTitle.addAll(stringList);
           }

           return Text("");
         }));
       }   if(count==2) {
         //Future.delayed(Duration(seconds:2),(){});
         _translateText.add(TranslateBuilder(
             _mainPageInfoToTranslate.toList(), (stringList, isTranslate) {
           if (isTranslate &&
               _mainPageTranslatedInfo.length != stringList.length) {
             _mainPageTranslatedInfo.addAll(stringList);
           }

           return Text("");
         }));
       }  if(count==3) {
         // Future.delayed(Duration(seconds:4),(){});
         _translateText.add(TranslateBuilder(
             _mainPageAllDeviceListInfoToTranslate.toList(), (stringList,
             isTranslate) {
           if (isTranslate && _mainPageAllDeviceListTranslatedInfo.length !=
               stringList.length) {
             _mainPageAllDeviceListTranslatedInfo.addAll(stringList);
           }
           return Text("");
         }));
       }  if(count==4) {
         _translateText.add(TranslateBuilder(
             _mainPageAllDeviceListTitleToTranslate.toList(), (stringList,
             isTranslate) {
           if (isTranslate && _mainPageAllDeviceListTranslatedTitle.length !=
               stringList.length) {
             _mainPageAllDeviceListTranslatedTitle.addAll(stringList);

           }
           return Text("");
         }));
       }  if(count==5) {
         _translateText.add(TranslateBuilder(
             _trafficSignInfoToTranslate.toList(), (stringList, isTranslate) {
           if (isTranslate && _trafficSignTranslatedInfo.length != stringList.length) {
             _trafficSignTranslatedInfo.addAll(stringList);
             print(_trafficSignTranslatedInfo.toList());
           }

           return Text("");
         }));
       }  if(count==6) {
         _translateText.add(TranslateBuilder(
             _trafficSignTitleToTranslate.toList(), (stringList, isTranslate) {
           if (isTranslate &&
               _trafficSignTranslatedTitle.length != stringList.length) {
             _trafficSignTranslatedTitle.addAll(stringList);
           }

           return Text("");
         })) ;
       }else    if(count==7) {
         _translateText.add(TranslateBuilder(
             _theoryInfoToTranslate.toList(), (stringList, isTranslate) {
           if (isTranslate &&
               _theoryTranslatedInfo.length != stringList.length) {
             _theoryTranslatedInfo.addAll(stringList);
           }


           return Text("");
         }));
       } else    if(count==8) {
   _translateText.add(TranslateBuilder(
       _theoryTitleToTranslate.toList(), (stringList, isTranslate) {
     if (isTranslate && _theoryTranslatedTitle.length != stringList.length) {
       _theoryTranslatedTitle.addAll(stringList);


       count=0;
     }

     return Text("");
   }));



 }
    /*

      Future.delayed(Duration(seconds:2),(){});
      Future.delayed(Duration(seconds:2),(){});
     ;*/
    return _translateText;
  }
  @override
  void initState() {
    super.initState();
     _translateText=new List<Widget>();
    _mainPageInfoToTranslate = new List<String>();
    _mainPageTranslatedInfo  = new List<String>();
    _mainPageTranslatedTitle = new List<String>();
    _mainPageTitleToTranslate= new List<String>();
    _mainPageAllDeviceListInfoToTranslate = new List<String>();
    _mainPageAllDeviceListTranslatedInfo  = new List<String>();
    _mainPageAllDeviceListTranslatedTitle = new List<String>();
    _mainPageAllDeviceListTitleToTranslate= new List<String>();
    _theoryInfoToTranslate= new List<String>();
     _theoryTranslatedInfo= new List<String>();
   _theoryTitleToTranslate= new List<String>();
    _theoryTranslatedTitle= new List<String>();
    _trafficSignInfoToTranslate= new List<String>();
     _trafficSignTranslatedInfo= new List<String>();
    _trafficSignTranslatedTitle= new List<String>();
   _trafficSignTitleToTranslate= new List<String>();
    _trafficSignSymbolsInfoToTranslate=new List<String>();
     _trafficSignSymbolsTranslatedInfo=new List<String>();
    _trafficSignSymbolsTranslatedTitle=new List<String>();
    _trafficSignSymbolsTitleToTranslate=new List<String>();

    _mainPageInfo.toList().forEach((element) {

      if(_mainPageInfo.length != _mainPageTitleToTranslate.length){
        _mainPageTitleToTranslate.add(element.title.toString());
        _mainPageInfoToTranslate.add(element.info.toString());
      }



    });

    _theoryInfo.toList().forEach((element) {
      if(_theoryInfo.length !=_theoryTitleToTranslate.length){
        _theoryTitleToTranslate.add(element.title.toString());
        _theoryInfoToTranslate.add(element.info.toString());
      }



    });

      int x=0;
    _trafficSign.toList().forEach((element) {
      if(_trafficSign.length !=_trafficSignInfoToTranslate.length){
        _trafficSignTitleToTranslate.add(element.title.toString());
        _trafficSignInfoToTranslate.add(element.info.toString());


      }



    });
    allDeviceList.toList().forEach((element) {
      if( allDeviceList.length !=_mainPageAllDeviceListTitleToTranslate.length){
        _mainPageAllDeviceListTitleToTranslate.add(element.title.toString());

        _mainPageAllDeviceListInfoToTranslate.add(element.info.toString());
      }



    });

    _symbolsInfo.toList().forEach((element) {
      if(_symbolsInfo.length != _trafficSignSymbolsInfoToTranslate.length){
        _trafficSignSymbolsInfoToTranslate.add(element.title.toString());
        _trafficSignSymbolsTitleToTranslate.add(element.info.toString());
      }



    });





    Future.delayed(Duration(seconds: 2), ()
    {   _loading();
      _helpElement();
    });


     Future.delayed(Duration(seconds: 15), ()
    {

      _mainPage(_mainPageTranslatedTitle,_mainPageTranslatedInfo,_mainPageInfo);

      if(_theoryTitleToTranslate.length ==_theoryInfo.length){
        _timer.cancel();

        setState(() {
          _isLoadingVisible=false;
        });


      }

     // _mainPage(_mainPageTranslatedTitle,_mainPageTranslatedInfo,_mainPageInfo);

    });



    _tabController = new TabController(vsync: this,  length: _tabs.length);



  }


  @override
  void dispose() {


    //_tabController.dispose();
    super.dispose();
  }
/*
  TranslateBuilder delayTranslate(){
    var translator;
    setState(() {


    Future.delayed(Duration(seconds:1),(){

      translator= TranslateBuilder( _theoryInfoToTranslate.toList(),(stringList,isTranslate){

        if(isTranslate){
          _theoryTranslatedInfo.addAll(stringList);

        }
        print("Delay= 2");
        return Text("");
      });

      TranslateBuilder( _theoryTitleToTranslate.toList(),(stringList,isTranslate){

      if(isTranslate){
      _theoryTranslatedTitle.addAll(stringList);

      }


      print("Delay= 2");
      return Text("");
      });


    });

    Future.delayed(Duration(seconds: 6),(){
      print("Delay= 10");
    });

    });
    });
    return   translator;

        }*/

void _loading(){
   _timer= Timer.periodic(new Duration(seconds: 10), (timer) {

    setState(() {
      _progress+=timer.tick;
    });

  });
}
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {


    return
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(

        key: _scaffoldKey,
        appBar: new AppBar(

        backgroundColor: Colors.teal,
        actions: <Widget>[dispatchTranslation().elementAt(0),dispatchTranslation().elementAt(1),dispatchTranslation().elementAt(2),
          dispatchTranslation().elementAt(3),dispatchTranslation().elementAt(4),dispatchTranslation().elementAt(5),dispatchTranslation().elementAt(6),dispatchTranslation().elementAt(7),
          PopupMenuButton<Choice>( icon: Icon(Icons.menu, color: Colors.white, ),
            onSelected:null,
            itemBuilder:(BuildContext context) {

              return menuItems_choices.skip(2).map((e) =>
                  PopupMenuItem<Choice>(child:Text("Hell"), )).toList();
            }, color: Colors.white,
          )
        ],
        title: Text(_title, softWrap: true, style: _appTitle, overflow: TextOverflow.clip, ),
        leading:FlatButton(onPressed: () {
          _isTrafficSymbols=false;
          _onWillPop();
        },
        child: Icon(menuItems_choices[2].icon, color: Colors.white, size:menuItems_choices[2].size , ), ),
        bottom:new TabBar(

          controller: _tabController,
          tabs: _tabs, labelColor: Colors.white, indicatorSize:TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontSize:16, fontWeight: FontWeight.bold, color: Colors.white), onTap: (value) {
          setState(() {
            _tabItemValue=value;
            _wizard=_tabBarViewer(value);

          });
            },
    ),

        ) ,
      body:new WillPopScope(child: Stack(children:[ new Container(child:_wizard, ),if(_isLoadingVisible) Center(child:  CircularProgressIndicator(backgroundColor: Colors.yellow,value: _progress,))]),  onWillPop:_onWillPop),
        bottomNavigationBar: Container(child: Stack(children: [Container(child:IconButton(onPressed:   () { _searchBar(_tab_choices[_tabController.index].title); }, icon: Icon(Icons.search, color: Colors.teal, size: 30, ), key: _searchKey, ),
          alignment: AlignmentDirectional.centerEnd, height: 30, ),
          Container(child:IconButton(onPressed: () {
            _mainPage(_mainPageTranslatedTitle,_mainPageTranslatedInfo,_mainPageInfo);
            _scaffoldKey.currentState.hideCurrentSnackBar();
            _isSnackBarClose=false;
            _isInView=true;
          setTitle("KörKortApp");

          }, icon: Icon(Icons.home, color: Colors.teal, ), ),  margin: EdgeInsets.only(left: 60)),
          Container(child:IconButton(onPressed: () {
            _isInView=true;
            _scaffoldKey.currentState.hideCurrentSnackBar();
            _isSnackBarClose=false;

          setTitle("KörKortApp");
        },
          icon: Icon(Icons.comment, color: Colors.teal, ), ),  margin: EdgeInsets.only(left: 0), )], ),
          decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(width:  0.70, color: Colors.black12))), ),
    backgroundColor: Colors.white, ));


  }


  // this is the future function called to show dialog for confirm exit.
  // ignore: missing_return
  Future<bool> _onWillPop() {

    if(_isDisabled){
      setState(() {
        _wizard=_tabBarViewer(_tabItemValue);
        _isDisabled=false;

      });

    }else {

      showDialog(context: _scaffoldKey.currentContext, child:FittedBox(child: AlertDialog(title: Text('Are you sure you want to quit?'),  actions: <Widget>[
        FlatButton(
            child: Text('Yes', style: _appTitle, ),
            onPressed: (){

              Navigator.of(_scaffoldKey.currentContext).pop(true);
              exit(0);

              return Future.value(true);
            }, color: Colors.teal, ),
        FlatButton(
            child: Text('Cancel', style: _appTitle, ),
            onPressed: (){

              Navigator.of(_scaffoldKey.currentContext).pop(false);
            _scaffoldKey.currentState.hideCurrentSnackBar();
            _isSnackBarClose=false;
            _isDisabled=false;
            return Future.value(false);
            }, color: Colors.teal),
      ]), fit: BoxFit.contain, ));
    }




   return Future.value(false);

  }
  bool _isSnackBarClose=false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget _snackBarWithTextField(){
    return    new SnackBar(backgroundColor: Colors.white, duration: const Duration(minutes: 1),
      content: Container(child: Stack(children: [

        Container(child:TextField(style: _infoFont, decoration: InputDecoration(hintText: "Enter search",
            enabledBorder:new UnderlineInputBorder(borderSide: new BorderSide(color:Colors.teal)), focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color:Colors.teal))),
          onSubmitted: (value){
          if(value != ""){

            _searchScrollToView(this.getQuery());
            _scaffoldKey.currentState.hideCurrentSnackBar();
            _isSnackBarClose=false;

          }
          }, onChanged:setQuery, autofillHints:["Search"], cursorColor: Colors.teal, autocorrect: true, maxLength: 40,textInputAction:TextInputAction.search)),
        Container(child:IconButton(onPressed: (){
          _searchScrollToView(this.getQuery());
          _scaffoldKey.currentState.hideCurrentSnackBar();
          _isSnackBarClose=false;
        }, icon: Icon(Icons.send, color: Colors.teal, ),), alignment: Alignment.centerRight, margin:EdgeInsets.only(bottom: 8) , ),
        Container(child:IconButton(onPressed: (){
          _scaffoldKey.currentState.hideCurrentSnackBar();
          _isSnackBarClose=false;
        }, icon: Icon(Icons.arrow_downward, color: Colors.teal, ), color: Colors.red, padding: EdgeInsets.all(10), ), margin:EdgeInsets.only(top:40)), ], ), height: 60,
      ), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero), side: BorderSide(width: 0.70, color: Colors.black12)), );
  }

  _searchBar(var value){


     setState(() {
       _scaffoldKey.currentState.hideCurrentSnackBar();
        if(_isInView){
          _wizard=_tabBarViewer(value);
        }



     });




     if(_isSnackBarClose){

       _scaffoldKey.currentState.hideCurrentSnackBar();
       _isSnackBarClose=false;
     }else{

       _scaffoldKey.currentState.showSnackBar(_snackBarWithTextField());

       _isSnackBarClose=true;


     }


  }

  void _notFound(String query){

    var snackBarError = new SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 5),
      content: Container(child: Stack(children: [

        Container(child: Text("$query Not found",  style: _biggerFont, )),
        Container(child: FlatButton(onPressed: () {
          _scaffoldKey.currentState.hideCurrentSnackBar();
          _isSnackBarClose=false;

        },  child: Text("Ok"),  color: Colors.red),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(bottom: 8), ),
      ], ),  height: 60,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          side: BorderSide(width: 0.70,  color: Colors.black12)), );
    _scaffoldKey.currentState.showSnackBar(snackBarError);
  }

  _searchScrollToView(String query){


    setQuery("");


      for(int x=0;x<_theoryInfo.length;x++) {
        if(_theoryInfo.elementAt(x).title.toLowerCase().contains(query.toLowerCase()) && (query.isNotEmpty)
            && (_tabController.index).toInt()==1){

          _itemScrollController_2.scrollTo(index:_theoryInfo.indexOf(_theoryInfo.elementAt(x)),  duration: Duration(seconds: 2),  curve:  Curves.easeInCubic);

          break;

        }else {

          if (x + 1 == _theoryInfo.length && (_tabController.index).toInt()==1 ) {
            _notFound(query);

            break;
          }

        }

      }


      for(int y=0;y<_trafficSign.length;y++){

        if(_trafficSign.elementAt(y).title.toLowerCase().contains(query.toLowerCase()) && (query.isNotEmpty)
            && (_tabController.index).toInt()==0 && !_isTrafficSymbols){

          _itemScrollController.scrollTo(index:_trafficSign.indexOf(_trafficSign.elementAt(y)),  duration: Duration(seconds: 2),  curve:  Curves.easeInCubic);
          break;
        }else {


          if ( y+1 ==_trafficSign.length && (_tabController.index).toInt()==0 && !_isTrafficSymbols) {
            _notFound(query);
            break;
          }

        }
      }
        for(int i=0;i<_symbolsInfo.length;i++) {
          if (_symbolsInfo.elementAt(i).title.toLowerCase().contains(query.toLowerCase()) && (query.isNotEmpty) && (_tabController.index).toInt() == 0 && _isTrafficSymbols) {

            for(int x=0;x< details.length;x++){

              if(details.keys.elementAt(x).toLowerCase().contains(query.toLowerCase())){
                _itemScrollController_1.scrollTo(index: x, duration: Duration(seconds: 2), curve: Curves.easeInCubic);

                break;
              }
            }


            break;
          } else {
            if (i + 1 == _symbolsInfo.length &&
                (_tabController.index).toInt() == 0  && _isTrafficSymbols) {
              _notFound(query);
              break;
            }
          }

        }



  }



}

class Choice {


  const Choice({this.title,  this.icon, this.size, this.info});
  final double size;
  final String title, info;
  final IconData icon;
}
class _TrafficSignInfo {


  const _TrafficSignInfo({this.title,  this.size, this.info});
  final double size;
  final String title, info;



}
class MainPage{
   const MainPage({this.title, this.info, this.icon});
   final String title;
   final String info;
   final String icon;
}
List <MainPage> allDeviceList =const <MainPage>[


MainPage(title:"All devices", info: "KörKortApp adapts to your device and screen and therefore works just"
" as well on your computer as it does on your iPhone or your Android tablet.", icon:"signs/roadsigns/ic_highlight_all_devices.png" ),
MainPage(title:"Three types of test", info: "Choose between smart practice tests,  realistic theory tests or custom tests where you choose all the settings yourself"
, icon:"signs/roadsigns/ic_index_quiz.png" ),
MainPage(title:"The best content on the market", info: "The content on KörKortApp is the same as in our award-winning KörKortApp  which has received over 2, 000 five-star ratings."
, icon:"signs/roadsigns/ic_highlight_best_content.png" ),
MainPage(title:"Cheap and convenient", info: "Skip expensive theory lessons and boring books and study on your terms instead – whenever you want,  wherever you are!"
, icon:"signs/roadsigns/ic_highlight_inexpensive.png" ),
MainPage(title:"Educational and fun game mode", info: "Play your way through the entire driver's licence theory with The Licence Game and make studying more fun and easier than ever!", icon:"signs/roadsigns/ic_highlight_game.png" )
];
List <MainPage> _mainPageInfo= const <MainPage>[

  MainPage(title:"Pass the theory test", info: "✓ 1, 000 driving licence theory questions.\n\n ✓ Explanations for difficult questions.\n\n ✓ Used by driving schools", icon: "signs/roadsigns/asset 391.png"),
  MainPage(title:"🎴 Play The Licence Game", info: "The Licence Game is a game which makes studying for your driver's licence easier and"
      " more fun! The game contains short levels of theory lessons,  road signs and various types of tests. Once you have passed all levels,  "
      "you are ready for the real theory test! Try it for free", icon: "signs/roadsigns/bkg_index_blue_star_bar.png"),
  MainPage(title:"🎴 Ads",info: "Advertisement goes here",icon: " " ),
  MainPage(title:"🎴 8 reasons to join today",info: "Free demo - try 30 questions ",icon: " "),
  MainPage(title:"Buy Test",info: "Free Games",icon: " "),



];
class Theory {


  const Theory({this.title, this.info, this.icon, this.size, this.width, this.height});
  final String title, info;
  final String icon;
  final double size;
  final double width;
  final double height;



}

List<Theory> _theoryInfo= const <Theory>
[

  const Theory(title:"🎴 Introduction & terms",  info:   "🎴 Road to your driving license\n\n"
      "You have decided to get a driving license Congratulations on a wise decision. In many respect our society is built around the possibilities open by use of car. "
      "All driving license allow you to drive mope class I and II,  tractor A and motorised class II.\n\n"
      "🎴 Road user.\n\n"
      "• A road user is anyone travelling on the road or in a vehicle on the road is a road user. this means you are a road user even if you are a passenger in the a vehicle or skateboarding.\n\n"
      "• A and B license allow you to drive a private car with a total weight of 3.5 tons and light goods vehicle plus light towed vehicle.\n\n"
      "🎴 Deep learning.\n\n"
      "• Deep learning means that you try to understand the full picture and the reasons behind the rules. It leads to permanent knowledge.\n\n"
      "🎴 Over-learning.\n\n"
      "• Over-learning has taken place when something has become “second nature”. The actual driving (working the clutch,  shifting gears etc.) should be over-learned, "
      " so that you can focus on everything going on around you.\n\n"
      "🎴 Imitation learning.\n\n"
"• Imitation learning is when you copy someone else’s behaviour. This can be either good or bad; it depends on who you are learning from.\n\n"
      "🎴 Superficial learning.\n\n"
"• Superficial learning means that you try to learn everything by heart just to pass your theory test. You have no understanding of the big picture and will forget what you have learned.\n\n"
"• Repetition is important in order to retain what you learn. Remember that you will never know everything so you should strive for lifelong learning.\n\n"
"🎴 Varying degrees of maturity.\n\n"
"As a driver,  you are to show “good judgement when interacting with other road users”. Doing so requires both knowledge and tolerance. Everyone’s development is different,  but it is possible to identify three main phase.\n\n"
"• Immature & selfish is the stage of a child. People of other age groups who still have these tendencies think mostly of themselves. They act impulsively and create confusion and insecurity.\n\n"
"• Rule abiding drivers are good in most situations. However,  sometimes the rules are not enough,  and when that happens,  these drivers may revert back to the immature stage and “insist on their right”.\n\n"
"• Tolerant & mature is the type of driver we want. They respect the traffic rules,  but also have enough experience to handle unexpected situations calmly and safely. They will not angrily honk their horn if another car stalls at a traffic light.\n\n"
"🎴 Young drivers.\n\n"
      "Even though they have the most recent training,  young drivers have proven to be the most dangerous in traffic. This can be due to a number of reasons.\n\n"
"• They have limited experience of “real traffic”.\n\n"
"• They are immature.\n\n"
"• They have the wrong role models.\n\n"
"• They overestimate their own abilities.\n\n"
"• Young men tend to overestimate their driving ability more than women of the same age."
      " The reason for this could be that it is considered cool and manly to drive fast. When the young men have had their driving licences for a couple of years,  they start to take greater risks,  as they feel safer.\n\n"
      "🎴 Probability learning.\n\n"
      "• Probability learning means that you use prior experience of a situation to assess the probability of something happening.\n\n"
      "• Good probability learning: You are used to trains passing frequently at a railway crossing and you are therefore extra cautious.\n\n"
      "• Bad probability learning: You are used to trains passing very rarely at a railway crossing and therefore do not look before you cross.\n\n"
      "🎴 Stress.\n\n"
      "• Moderate stress,  meaning that you are just slightly stressed,  normally increases your concentration and performance levels. If you are completely relaxed you will not take your driving as seriously and will perhaps miss certain details. However,  the most dangerous thing to be is highly stressed.\n\n"
      "🎴 Excessive stress can lead to.\n\n"
  "• Panic – you do not know what to do.\n\n"
      "• Blackout – you stop being aware of the situation.\n\n"
      "• Resignation – you think the situation is unfixable so you do not even bother trying.\n\n"
      "• Agitation – you get hyperactive and unpredictable.\n\n"
      "• Sluggishness – you are unable to think clearly and logically.\n\n"
      "• These are examples of common reactions. We are all different,  and you know best how you react."
      , icon: "signs/roadsigns/asset 391.png", height: 2630),
  const Theory(title:"🎴 Supervisors", info: "🎴 Supervisors\n\n"
      "Supervisors must have a permit and  must have completed introduction course before applying for permit as a supervisor and approved supervisor.\n\n"
      "• The introduction course is valid for five years.\n\n"
      "• The supervisor must be older than 24 years and have held driving permit for at least five years.\n\n"
      "• Permit must be issued in the EUA i.e and a regular driver.\n\n"
      "• Remember that learner driver sign must be behind the car.\n\n"
      "• The student must have a permit.\n"
      , icon:"signs/roadsigns/Driving-Instructor-Training.png", height: 590),
  const Theory(title:"🎴 The Road", info: "🎴 The Road\n\n"
      "All persons travelling in a vehicle or walking,  cycling or riding along a road are classed as road users.\n\n"
       "The term Road denotes:\n\n"
       "• The road.\n\n"
      "• The streets.\n\n"
      "• The market place and squares.\n\n"
      "• Other Routes use by pedestrian and vehicle\n\n"

      "• The carriageway\n"
      "• lanes\n\n"
      "🎴 The hard shoulder.\n\n"
      "• The hard shoulder is the area outside the carriageway.\n\n"
      "• The hard shoulder is a safety zone that shall primarily be used by pedestrians,  cyclists,  moped drivers and slow-moving vehicles.\n\n"
      "• The hard shoulder is not a car lane.\n\n"
      "• You may drive briefly on the hard shoulder in order,  for example,  to facilitate an overtaking. However,  be very careful if you have limited visibility."
      "\n", icon:"signs/roadsigns/road.png", height: 814),
  const Theory(title:"🎴 Carriageway",  info:"🎴 The carriageway\n\n"
      "• The carriageway denotes the lanes.\n\n"
      "• The lane is where the cars are driving. The road will normally have two lanes going in opposite directions. They are not necessarily marked out.\n"
      , icon: "signs/roadsigns/carriageway.png", height: 410),
  const Theory(title:"🎴 Basic traffic rules",  info:"🎴 Traffic rule \n\n"
      "Traffic rule is formulated so that people will understand that as road user they have a number of duties but no rights. Caution is of a highest important to road safety.\n\n"
      "• Show consideration and care.\n\n"
      "• Clearly show your intentions.\n\n"
      "• Make eye contact with the people who,  for example,  are using a pedestrian crossing or other drivers crossing your path.\n\n"
      "• Always keep a safe distance (there is always the possibility of someone suddenly opening a car door or of a cyclist swerving).\n\n"
      "• Only use your horn as a warning. It is forbidden to sound your horn just to “say hello” to someone.\n\n"
      "•  Be considerate of those using the road and those who live near it.\n\n"
      "•  Be especially considerate of children,  school traffic wardens,  people with disabilities and the elderly.\n\n"
      "•  Do not cause any unnecessary disturbance or obstruction.\n\n"
      "•  No-one has any “rights”,  only joint obligations.\n", icon: "signs/roadsigns/basic traffic rules.png", height: 830),
  const Theory(title:"🎴 Defensive driving", info: "🎴 Driving defensively\n\n"
      "Driving defensively makes for safer traffic. Examples of defensive driving:\n\n"
      "• Have plenty of time for the journey.\n\n"
      "• Refrain from taking risks.\n\n"
      "• Think first and act.\n\n"
      "• Take no unnecessary risks.\n\n"
      "• Make sure to have wide safety margins.\n\n"
      "• Stay vigilant.\n\n"
      "• Do not stress,  make sure you have plenty of time.\n\n"
      "• Be prepared for unexpected things to happen.\n\n"
      "• Analyse the situation before doing anything else.\n\n"
      "• Think ahead and imagine what could happen.\n\n"
      "• Drive smoothly and brake in good time.\n\n"
      "• Keep good look in the rear.\n\n"
      "🎴 Speed.\n\n"
      "• Adapt your speed,  which means you must:\n\n"
      "• Be in control of the vehicle.\n\n"
      "• Be able to stop for foreseeable obstacles.\n\n"
      "• Take other traffic into consideration.\n\n"
      "• Take the vehicle’s condition and load into consideration.\n\n"
      "• Take the weather and road condition into consideration.\n", icon: "signs/roadsigns/defensive_driving.png", height: 980),
  const Theory(title:"🎴 Places where risk of accident are high", info: "🎴 Risk of accident places.\n\n"
      "• Build up areas (Densely populated areas).\n\n"
      "• Reduce visibility.\n\n"
      "• Slippery surface.\n\n"
      "• Darkness.\n\n"
      "• Sharp curve.\n\n"
      "• Unprotected pedestrian.\n"
     , icon:"signs/roadsigns/poor_visibility.png", height: 528),
  const Theory(title:"🎴 Give way", info: "🎴 Show your intentions to road users\n\n"
      "You must clearly show your intentions to other road users. For example:\n\n"
      "• brake in good time rather than creating uncertainty by braking hard just before the junction.\n\n"
      "🎴 You have a duty to give way.\n\n"
    "• when driving out to a road or a street from parking place.\n\n"
    "• fuel station on or similar exit.\n\n"
      "🎴 Give way and do not hinder:\n\n"
  "• Emergency response vehicles (ambulance,  police and fire brigade).\n\n"
  "• Processions of different kinds (such as children with teachers and funeral processions).\n\n"
  "• Trains and trams\n"
  "• Military convoys.\n"
      , icon: "signs/roadsigns/give_way.png", height: 692),
  const Theory(title:"🎴 Children", info: "🎴 Keep your eyes on alert\n\n"
      "Its extremely important to observe and keep your eyes on alert to see elderly,  disability and children "
      "on the road,  be cautious children on the road as they might be running into the roads.\n", icon: "signs/roadsigns/children.png", height: 390),
  const Theory(title:"🎴 Priority to the right rule",  info: "🎴 The right rule\n\n"
      "You must give way to traffic on the right,  the sign is erected before the junction. B must give way to A,  and A must in turn give way to C.\n\n"
      "This means that according to the right-hand rule C is to drive first,  then A and finally B "
      "However,  in this case,  it may be appropriate for B and C to drive at the same time and for A to go last,  as A must also take the obstruction rule into account (they may not go into the junction and obstruct B).\n\n"
      "🎴 It doesn't apply to:\n\n"
      "• Roundabout.\n\n"
      "• slip acceleration lane.\n\n"
      "• traffic light and major road and entering of major roads.\n\n"

      "• A parking space (both from the parking bay and the parking area itself).\n\n"
      "• A property (house or similar).\n\n"
"• A petrol station.\n\n"
"• A pedestrian street,  home zone,  hard shoulder or terrain.\n\n"
      "• Foot path or bicycle path that you have crossed.\n\n"
      "🎴 The exit rule.\n\n"
      "• The exit rule means that you have an obligation to give way when exiting:\n\n"
      "• A parking space (both from the parking bay and the parking area itself).\n\n"
"• A property (house or similar).\n\n"
"• A petrol station.\n\n"
"• A pedestrian street,  home zone,  hard shoulder or terrain.\n\n"
"• Foot path or bicycle path that you have crossed.\n\n"
"🎴 The bus rule\n\n"
"• 50 km/h or lower: You must give way to the bus if it indicates to exit (only applicable to the lane furthest to the right).\n\n"
"• Over 50 km/h: The bus should always give way to you.\n\n"
"🎴The obstruction rule\n\n"
"• Try to never stop in a junction,  on a pedestrian crossing or similar areas.\n"
, icon: "signs/roadsigns/the_right_rule.png", height: 1212),
  const Theory(title:"🎴 Bus at the stop",  info: "🎴 Buss stop\n\n"
      "Buses have priority when moving off from a bus stop not when changing lanes. Don't block junction and pedestrian crossing you may obstruct traffic.\n\n"
      "• Make way for emergency or group of children under supervision,  extra vigilance is needed for children,  stop and let all pass.\n\n"
      "• You may stop to drop off and pick up passengers,  as long as it does not hinder a bus or a tram. This is applicable 20 metres"
      " before and 5 metres after the bus stop,  as the bus requires more room to pull into the stop than to exit.\n",
      icon: "signs/roadsigns/bus_at_the-stop.png", height: 540),
  const Theory(title:"🎴 Speed",  info: "🎴 Speed factor\n\n"
      "Speed is the greatest single factor in severity of injuries caused by an accident. Most pedestrian will survive at vehicle driving at 30kph, "
      " whereas most pedestrian will die at 50kph so be vigilant.\n\n"
      "🎴 Adapt your speed,  which means you must\n\n"
      "• Be in control of the vehicle.\n\n"
      "• Be able to stop for foreseeable obstacles.\n\n"
      "• Take other traffic into consideration.\n\n"
      "• Take the vehicle’s condition and load into consideration.\n\n"
      "• Take the weather and road condition into consideration.\n\n"
      "• You may not brake suddenly or drive excessively slowly for no reason.\n\n"
      "🎴 The speed signs always take priority. However,  there are a few basic speed limits,  which may be of help if there are no signs:\n\n"
      "• Built-up area: 50 km/h.\n\n"
      "• Outside of built-up area: 70 km/h.\n"
 , icon:"signs/roadsigns/Speed.png", height: 860),
  const Theory(title:"🎴 Bus lane",  info: "🎴 Reserved bus lanes\n"
      " Bus lanes are reserved for buses and cycle and moped class II,  others may use if it is indicating on supplements plate.\n\n"
      "• The purpose of public transport lanes is to ensure that buses do not get stuck in queues,  which would delay them. In addition to regular bus services.\n"
      , icon: "signs/roadsigns/bus_lane.png", height: 420),
  const Theory(title:"🎴 Reversible lane",  info: "🎴 Reversible lane\n\n"
      "Reverse lane used for traffic in both directions. Traffic signal are used to indicate which direction is in force at the moment.\n\n"
      "• The direction of traffic flow in a reversible lane can be changed as needed. In the afternoon,  many road users are coming home from work and it is then practical to"
      "have an extra lane out of town to reduce the risk of queues forming.\n", icon: "signs/roadsigns/asset 156.png", height: 470),
  const Theory(title:"🎴 Changing lanes",  info: "🎴 How to change lanes\n\n"
      " step by step:\n\n"
      "• Check the traffic situation in front of you if the distance to the vehicle in front of you is good.\n\n"
      "• check Rear-view mirror.\n"
      "• check side mirror\n\n"
      "• Blind spot (turn your head) If everything looks good,  turn on your indicator\n\n"
      "• Wait a few seconds. Keep your eyes moving and gauge the reactions of other road users\n\n"
      "• Check your blind spot one last time.\n"
      "• Calmly turn into the new lane.\n\n"
      "• A small speed increase is appropriate when changing lanes if there are vehicles close behind you in "
      "the new lane.Plan your change of lane in a good time,  you should normally not reduce speed,  if you do it will cause vehicle bunch behind you.\n"

      , icon: "signs/roadsigns/changing_lanes.png", height: 700),
  const Theory(title:"🎴 Prohibition on changing lanes", info: "🎴 Prohibition on changing lanes\n\n"
      "• In dense traffic on roads with multiple lanes in your direction,  there will sometimes be gaps in the other lanes. It may then be tempting to change "
      "lanes in order to gain some distance. However,  you are not allowed to “slalom” between cars.\n", icon: "signs/roadsigns/dangerous_lane_change.png", height: 450 ),
  const Theory(title:"🎴 Overtaking", info: "🎴 How to Overtake \n\n"
      "Move out slightly to the left so that you can see whether the road is free from oncoming traffic.\n\n"
       "• Check that you are not been being overtaken\n"
"• Rear-view mirror.\n\n"
"• Left side mirror.\n\n"
"• Blind spot.\n\n"
"• Indicate left.\n\n"
"• Increase your speed (within the speed limit) and steer towards the left,  so that you have plenty of distance to the vehicle you are overtaking. "
      "Once you have passed the other vehicle,  you are to return to your original lane as soon as possible.\n\n"
      " However,  do not go in too soon,  as this can lead to a collision with the other vehicle. A good rule of thumb is to go back in "
      "only when you can see the car you passed in the right side mirror.Overtaking is permitted on at least two marked lanes with speed limit 70kph.\n\n"

"🎴 Zipper rule\n\n"
"• cogwheel principle means that vehicles from each connecting road take turns to go,  irrespective of the applicable yield rules. This is an example of effective spontaneous collaboration between drivers.\n\n"
"• Acceleration overtake means that you drive closely behind a car at the same speed. When you go to overtake,  you drive out and increase your speed quickly (within the speed limit) to pass the car.\n\n"
      "• Flying overtake means that you approach the car in front at high speed and change lanes in good time before driving past. "
      "A flying overtake is preferable,  as it requires a shorter distance and less fuel. You must keep within the speed limit.\n"
      , icon: "signs/roadsigns/overtaking.png", height: 998),
  const Theory(title:"🎴 No overtaking", info: "🎴 Overtaking not allowed\n\n"
  "• Not Permitted at road junction Before level crossing.\n\n"
  "• Not Permitted at pedestrian or cycles crossing where priority to right rules applies.\n\n"
  "• Not Permitted when vehicle start to overtake you.\n\n"
  "• Not Permitted in queues or when on coming vehicle is approaching.\n\n"
      "• You may overtake two wheel vehicle that clearly shows that it is turning left.\n\n"
      "🎴 Do the math\n\n"
      "The time gained from an overtaking is often minimal. This makes many overtakes unnecessary in relation to the risks. The time gain per 10 km can generally be said to be:\n"
      "• 1 minute per 10 km at speeds under 90 km/h.\n\n"
      "• 30 seconds per 10 km at speeds over 90 km/h.\n"
      , icon: "signs/roadsigns/don't_overtake.png", height: 758),
  const Theory(title:"🎴 Tram",  info: "🎴You must not overtake tram:\n\n"
      "• At queues.\n\n"
      "• At pedestrian or cycles crossing.\n\n"
      "• On a one way street and at places where the positioning of the tramlines gives occasion for it,  you may pass left hand side with caution.\n\n"
      "Overtaking tram is mostly instances done at the right side. You pass left side with due cautious.\n", icon: "signs/roadsigns/tram.png", height: 550),
  const Theory(title:"🎴 Parking and stopping",  info: "🎴 Packing and stopping\n\n"
      "Packing and stopping is applied to a place suitable where parking signs is erected.\nEnsure that your parking and stopping does create hazard or abstraction.\n\n"
      "🎴 No stopping or parking (stopping prohibition)\n\n"
      "• Where the sign No stopping or parking is posted.\n\n"
      "• On or 10 metres before pedestrian crossing,  foot path,  bicycle passage,  bicycle crossing or bicycle path.\n\n"
      "• You are permitted to stop directly after these,  as this does not entail you blocking those crossing from view.\n\n"
      "• Within 10 metres of a junction.\n\n"
      "• Where you obstruct the view or a road sign.\n\n"
      "• In a tunnel.\n\n"
      "• On a road where there is a solid line on your side,  if there is less than three metres between your car and the line.\n\n"
      "• In a roundabout.\n\n"
      "• Parking spaces for disabled drivers may only be used by those with a special parking permit. Without a permit,  you are only allowed to stop in order to drop off or pick up passengers.\n\n"
      "• In a public transport lane.\n\n"
      "• By a yellow solid line.\n\n"
      "• On an obstruction marking.\n\n"
      "• In the intersection between a car road and a railway or tramway.\n\n"
      "• On a dual track for pedestrians,  cyclists and moped drivers.\n\n"
      "• On a motorway or dual carriageway.\n"
      , icon: "signs/roadsigns/parking.png", height: 1160),
  const Theory(title:"🎴 Packing before a pedestrian crossing", info:"🎴 Packing before a pedestrian crossing\n\n"
      "It is forbidden to stop and park 10 metres before a pedestrian crossing,  but not after. "
      "The view of the red area is still obscured,  but with the difference that you have a much greater safety margin to discover a pedestrian here.\n"
      , icon: "signs/roadsigns/parking_before_pedestrian.png", height: 380),
  const Theory(title:"🎴 Alternate-side parking", info: "🎴 Alternate-side parking \n\n"
     "• Even dates: It is prohibited to park on the side with even house numbers (e.g. 2,  16,  40).\n\n"
"• Odd date: It is prohibited to park on the side with odd house numbers (e.g. 3,  17,  41).\n\n"
      "• Applicable during the times indicated on the sign.\n\n"
      "• These zones exist to facilitate the work of snowploughs,  etc.\n"
      , icon: "signs/roadsigns/odd_even_time.png", height: 514),
  const Theory(title:"🎴 Supplements plates",  info: "🎴 Supplements plate\n\n"
      "Supplements plate are often used in association with parking information,  "
      "it doesn't apply to any sign on the same spot accept the pole it attached to.\n", icon:"signs/roadsigns/supplementary_plate.png", height: 350),

  const Theory(title:"🎴 Prohibited packing",  info: "🎴 Prohibited packing\n\n"
      "• Parking less than 30 metres before and after level crossing. Parking  prohibited on major roads,  on entrance driveway to a property."
      "• on the carriageway it doesn't apply to bicycle,  moped and motorcycle. on a broken yellow line along road,  a place your car may be obstruct traffic.\n\n"
      "• Where parking is prohibited you are allowed for alighting and boarding and load and unload,  at bus and tram stop you are permitted to stop only for boarding and alighting 20 "
      "metres before and 5m after a stop sign or in a marked zone\n", icon: "signs/roadsigns/parking_prohibited.png", height: 530),
  const Theory(title:"🎴 Disabled parking",  info: "🎴 Disabled parking\n\n"
      "A parking place with wheelchair symbol is reserved for disability who as a special permit,  those without permit are allowed for stop and boarding and alighting.\n", icon:"signs/roadsigns/disabled_parking.png", height: 354),

  const Theory(title:"🎴 Zone parking",  info: "🎴 Zone parking\n\n"
      "Area for date parking. On even dates side parking is prohibited on the even side of the street likewise on odd. "
      "The supplements plate may restrict the prohibition times. Prohibition end if one passes the prohibition cancel sign\n", icon:"signs/roadsigns/parking_zone.jpg", height: 404),

  const Theory(title:"💡 Hint and tips about parking",  info: "💡 Hint about packing\n\n"
      "• You may only park right hand side in direction of travel and on left-hand side if the street is one way.\n\n"
      "• You must not leave your car with the key in it,  the reasons is to prevent accident and thieves.\n\n"
      "• Cars can be extremely hot in the sun and never leave children and pet in the car .\n\n"
      "• On a sloppy street turn your front wheel to catch on the kerb\n", icon: "signs/roadsigns/hints.png", height: 538),
  const Theory(title:"🎴 Driving on country roads",  info: "🎴 Driving on country roads\n\n"
      "Many serious accident may happen on the country road they can be cause by high speed,  stress and circumstances such poor visibility,  "
      "dense traffic. Beware of dangers and awareness of the dangers are the prerequisites of safe driving.\n\n"

"🎴 Turning right.\n\n"
"• Indicate in good time and slow down gradually. If visibility is good,  you may drive on the hard shoulder just before the turn,  as this makes it easier for the vehicles behind you to pass.\n\n"
"🎴 Turning left.\n\n"
"• Turning left on a country road is probably the most dangerous type of turn you can make. The reason for this is that you are driving at high speeds,  while the security is not at the same level as on the motorway.\n\n"
"🎴 How to make a left turn and possible ways to reduce the risks:\n\n"
"🎴 Check the traffic flow.\n\n"
"• In rush hour traffic,  it can be difficult to find a gap to use for your turn. In that case,  it is safer not to make the turn,  but instead drive straight ahead,  turn in a suitable location and then come back and make a right turn. If there is less traffic,  continue to the next step.\n\n"
"🎴 Indicating & placement.\n\n"
"• Indicate left in good time and place your car as close to the centre line as possible. This makes it easier for other traffic users to see that you are turning. If you place yourself in the middle of the lane,  it is possible that the cars behind you will not notice you slowing down,  which can result in a rear-end collision,  or a side collision if the car behind you starts "
"overtaking at the same time as you make the turn.\n\n"
"🎴 Avoid stopping\n\n"
"• Adapt your deceleration before the turn so that you do not have to stop and wait for the oncoming lane to be free of traffic. If you have to stop,  make sure not to turn the wheels to the left,  as this will make go out into the oncoming lane if you are hit from the rear.\n\n"
"🎴 Focus on making the turn\n\n"
"• Once you are ready to turn,  it is important to focus on the distance to the oncoming traffic. Also remember to put the car in the right gear – stay in 1st and accelerate fairly quickly until you are safely on the new road. Stalling in the middle of the oncoming lane is very dangerous! "
"In order to reduce the number of left turns,  the road is sometimes reconstructed for a Spanish turn. This means that you turn off on a small exit to the right and then cross the road.\n\n"
"🎴 Maintain the appropriate distance\n\n"
"• Is the distance is insufficient. Note the verge posts. Drivers not maintaining sufficient distance on a country road are very common. You can use the rule of thumb below to keep an appropriate distance.\n\n"
"🎴 The three-second rule\n\n"
"• Start counting when the car in front of you is at a fixed point (such as a road sign) and stop counting when you reach that point yourself. If it took less than 3 seconds,  the distance between you is too short.\n\n"
      "🎴 Reflective verge posts\n\n"
      "• The distance between two white reflective verge posts is 50 m. 100 m,  i.e. 3 posts,  is usually a good distance to keep to the car in front of you when driving on a country road.\n\n "
      "• Change km/h of your speed to metres and it will usually give you an appropriate distance to the car in front. For example 90 m at a speed of 90 km/h\n"
      "• If the car behind you is too close.\n\n"
      "• Cars driving too close are both annoying and dangerous. You can reduce the risks by maintaining a great distance to the car in front of you,  which means that you do not have to brake as hard if the car in front of you slows down.\n\n"
      "This reduces the risk of you being hit from the rear and potentially suffering a whiplash injury. "
      "Another way is to simply go into a parking space and let the stressed driver behind you pass.\n"
      , icon: "signs/roadsigns/defensive_driving.png", height: 2148),
  const Theory(title:"🎴 Private road,  view,  road works and horses",  info: "🎴 Private road,  view,  road works and horses\n\n"
      "View is of essence,  stop too soon,  can not see far enough,  stop at right point for better view of the crossing street and watch for turning bus may conceal a vehicle. "
      "You have duty to give way to all traffic in crossing at the junction,  major roads and don't forget to check to the left and right\n\n"

       "🎴 Passing place\n\n"
"• The basic rule is that you should keep to the right in order to have as great a safety margin as possible. The first car to arrive at the passing place shall stop,  irrespective of which side the passing place is on. If there is an obstacle on the road,  the car whose side the obstacle is on shall stop and wait.\n\n"
"🎴 Roadworks\n\n"
"• Drive slowly. The road workers must do their jobs while also keeping an eye on traffic. A second of inattentiveness can be disastrous!Temporary orange and yellow road signs and road markings take priority over the regular signs.\n\n"
"🎴 Private road\n\n"
"If you encounter a private road sign,  you should be prepared for the following:\n"
"• Poor road standard\n"
"• Lack of road signs\n"
"• Narrow road\n"
"• Sharp turns\n\n"
"🎴 Horses\n\n"
"Today,  cars rather than horses are used as transport. However,  there are still horses in traffic and as they are live animals,  they require special consideration:\n\n"
"• Lower your speed.\n\n"
"• Make sure you have more space than normal to the sides.\n\n"
"• Do not sound your horn.\n\n"
"• Do not dazzle.\n\n"
"• Accelerate calmly after the encounter (the sound of the engine may frighten the horse). Also remember that "
      "the riders are often young with little experience of traffic. Having eye contact with the rider is very helpful.\n", icon: "signs/roadsigns/private_road.png", height: 1300),
  const Theory(title:"🎴 Road  markings",  info: "🎴 Road  markings\n\n"
      "Three different kinds of markings are used in the middle of the road\n\n"
      "🎴Center line.\n\n "
      "• Warning line,  which warns of obscured visibility but not prohibit crossing the line,  it used instead of solid line if the road in narrow than 7 metres. in built up areas the distance between the lines is often shorter.\n\n"
      "🎴 Warning line.\n\n "
      "• Warns of obscured view. Maybe preliminary warning of a solid line.\n\n"
      "🎴 Solid line.\n\n "
      "• Shall not cross,  it may be cross only when you need to pass obstruction and junction without enough space and when there is a broken line to the right.\n", icon: "signs/roadsigns/road_markings.png", height: 680),
  const Theory(title:"🎴 Distance ahead",  info: "🎴 Distance ahead\n\n"
  "The three seconds rule is most useful when there are clear points of reference on the road. Keep your distance with the thumb rule or 3 seconds or  "
      "the same in metres as your speed limit.\n", icon: "signs/roadsigns/road1.png", height: 360),
  const Theory(title:"🎴 Speed blindness",  info: "🎴 Speed blindness\n\n"
      "Speed blindness can result in excessive speed at the exist of roads and misjudgement of "
      "stopping distance. Risk of speed blindness in wide smooth road in open countryside,  road works and tunnel.\n", icon: "signs/roadsigns/speed_blindness.png", height: 356),

  const Theory(title:"💡 Hint",  info: "🎴 Follow instructions and any sign in advice.\n\n"
      "• Will meet halfway is difficult to judge.\n\n"
      "• Breaking off and over in time is most important ability\n", icon: "signs/roadsigns/hints.png", height: 390),
  const Theory(title:"🎴 Save time",  info: "🎴 Save time \n\n"
      "If you increase average speed by 10 kph the time gain wil be very small. Under speed of 90 kph is about 1 minute so why increase speed, "
      " increase speed will greatly increase risk of accident.\n", icon: "signs/roadsigns/save_time.png", height: 365),
  const Theory(title:"🎴 Safer road design",  info:"🎴 Accident prone junction\n\n"
      "Accident prone junction may be re designed so that the left hand turn are prohibited on the major roads such as:\n\n"
      "• Minor country road.\n\n"
      "• private road.\n\n"
      "• Inferior standard roads lacking warning signs\n", icon: "signs/roadsigns/safer_roads.png", height: 460),

  const Theory(title:"💡 Hint",  info: "💡 Hint"
      "The field view at the level crossing that determines the speed at which you can pass.\n\n"
      "🎴 If your engine stall while in the middle of the crossing you can move the car out of danger by:\n\n"
      "• Using the first gear and start the motor"
      "• Release the clutch completely and hold the ignition key in start position the car will jerk forward else call 911.\n\n"
      "🎴 The breaking distance for trains at a high speed is often 600 to 1500 kilometre per hour.\n\n"
      "You must always satisfy your self that the passage is free.\n\n"
      "🎴 It prohibited to overtake before or at a level crossing without barrier and stop on a level crossing.\n\n "
      "• It prohibited to park closer than 30 metres before and after level crossing.\n", icon: "signs/roadsigns/hints.png", height: 680),
  const Theory(title:"🎴 Wild life",  info: "🎴 Wildlife accidents.\n\n"
"• The Greatest risk of wildlife on the road is:\n\n"
"• Dusk and dawn.\n"
"• May–June and September–October.\n"
"• Salted roads.\n"
"•Open fields. \n\n"
"•Close to a water course.\n\n"
"• Start and end of a wildlife fence.\n\n"
"• Accidents involving moose\n"
"• Accidents involving moose are the most dangerous type of wildlife accident. The reason is that the body of the moose,  which weighs around 700 kg, "
" is at the height of the windscreen of the car.\n\n In case of a head-on collision,  there is a great risk of the moose ending up inside the car,  injuring the passengers"
"Once a moose has started crossing the road,  it will in all likelihood continue straight ahead. It is therefore best to go behind the moose,  if you have to choose which way to swerve.\n\n"
"🎴 What to do if you hit a large animal\n\n"
"• Warn other road users with your hazard warning lights and warning triangle.\n\n"
"• If the animal is killed,  try to move it away from the road. If the animal is wounded and runs away,  you shall mark the location of the accident. This makes it easier for a hunter to track the wounded animal.\n\n"
"• If the animal is wounded,  you are obligated to inform the police.\n\n "
      "🎴You are also obligated to contact the police if the animal you hit (regardless of whether it is wounded) is one of the following:\n\n"
      "• Moose,  Bear,  Wolf,  Boar,  Lynx,  Deer and Otter\n"
  , icon: "signs/roadsigns/wild_life.png", height: 1202),
  const Theory(title:"🎴 Motorway",  info: "🎴 Motorway\n\n"
      "No stopping,  no packing,  no reversing,  no pedestrian, no cyclists and no moped II.\n\n"
      "• The Motor have two or more lanes you should drive on the far right the lane left are used for overtaking,  Pedestrian,  cyclists,  moped are permitted\n\n"
      "🎴 Indicated with the Motorway sign.\n\n"
"• The Traffic going in different directions is always separated. In other words,  there are no oncoming cars.\n\n"
"• No intersecting traffic on the same level. (Traffic is diverted through bridges and similar solutions.)\n\n"
"• Both exit and entry ramps belong to the motorway,  which means that the same rules apply to them.\n\n"
"• Always stay in the right lane,  except when overtaking.\n\n"
"🎴 Motorway entry ramps\n\n"

"• A typical motorway. The carriageways are separate and there is a proper exit ramp. If there is an acceleration lane,  neither those in the acceleration nor those on the motorway have priority. Mutual consideration and adaptation apply. If there is no acceleration lane,  those entering have an obligation to give way to traffic on the motorway.\n\n"
"• Leave the entry ramp as soon as you can. Remember to check your blind spot. On the motorway,  it is forbidden to stop and park.\n\n"
      "• Reverse.\n\n"
      "• Walk.\n\n"
      "• Cycle.\n\n"
      "• Hitchhike or pick up hitchhikers.\n\n"
      "• Turn around (you may not use the turning areas and central barrier openings,  which are intended for rescue vehicles and road workers).\n\n"
      "• If  you drive a moped,  Use the hard shoulder other than in an emergency.\n\n"
      "🎴 Tow\n\n"
      "• Exception: If your car stalls on the motorway you are permitted to tow it on the hard shoulder,  but only until the next exit.\n\n"
      "• Drive a vehicle that is not designed to drive at a speed of at least 40 km/h.\n\n"
      "• Exception: It is forbidden to drive an EU moped on the motorway,  even though they are allowed to go up to 45 km/h.\n\n"
      "• Exception: You are permitted to drive a piece of class I heavy equipment if it is set up as a mobile crane.\n"
     , icon:"signs/roadsigns/motorway_start.png", height: 1520),
  const Theory(title:"🎴 Signage used for motorway exit", info: "🎴 Motorway exit\n\n"
"First preparatory sign\n\n"
"• First comes at least one preparatory direction and exit sign. The shape of the arrow shows you that there is a stretch of road left before you need to turn. This sign specifies the distance to the exit.\n\n"
"🎴 The actual direction and exit sign\n\n"
"• Following the preparatory signs comes the actual direction and exit sign. The shape of the arrow shows you that the turn is coming up.\n\n"
"🎴 The exit plate\n\n"
"• Right where the exit departs from the motorway there is an exit plate.\n", icon: "signs/roadsigns/motorway_exit.png", height: 650),
  const Theory(title:"🎴 Acceleration lane",  info: "🎴 Acceleration lan\n\n"
      " is used to facilitate entry to the motor way,  adjust your speed to the traffic on the motorway. "
      "Neither those in the acceleration nor those on the motorway have priority. Mutual consideration and adaptation apply.\n", icon:"signs/roadsigns/acceleration_lane.png", height: 380),
  const Theory(title:"🎴 Traffic accidents",  info: "🎴 Traffic accidents\n\n"
      "Humans are designed to walk and run. Driving a car is unnatural for us,  as the speed is very high (compared to walking) "
      "and our bodies are not made to withstand the impact of a collision.\n\n"
"🎴 Causes of accidents\n\n"
"• There are three main causes of traffic accidents:\n\n"
"• Human error – it is part of human nature to make mistakes.\n\n"
"• Unsafe roads – a narrow and winding country road is much more dangerous than a motorway with cable barriers.\n\n"
"• Unsafe vehicles – insufficient tread depth can lead to a dangerous and possibly fatal aquaplaning.\n\n"
"🎴 Prone to accidents.\n\n"
"• The same group,  around 15% of the population,  are involved in 50% of all accidents. The characteristics of this group increase the risk of accidents,  for example,  they:\n\n"
"• Make excuses for their mistakes,  which means they do not learn from them.\n\n"
"• Deny the dangers. For example by ignoring the fact that there is a preschool nearby.\n\n"
"• Act impulsively,  which can cause dangerous situations,  such as making a sharp turn without indicating.\n\n"
"• Have a need for self-assertion,  meaning that they need to show how big and strong they are. Anyone cutting in must be “punished”.\n\n"
"• You are prone to reaction formation,  a form of contradictory behaviour. Those who are careful in other contexts use traffic to vent their frustration and other feelings.\n\n"
"• Party a lot,  which leads to late-night driving (tiredness) and drunk driving.\n\n"
"• You are adventurous drivers who view traffic as a challenging race.\n\n"
"🎴 What to do in the event of a major accident\n\n"
"• When you arrive at the scene at an accident at an early stage\n\n"
"• Survey the scene\n"
"• Warn if visibility is limited,  there is a risk of more cars colliding,  thus making the situation worse.\n\n"
"• Call 112\n"
"• At this point,  you have gathered important information (such as the number of casualties)..\n\n"
"🎴 First aid:\n\n"
"• In case of life-threatening situation,  move any person lying in the middle of the road or sitting in a burning car.\n\n"
"• Find out if immobile persons are breathing. If the person is breathing,  put them in the recovery position.\n\n "
      "🎴 If the person is not breathing:\n\n"
"• If no pulse Cardiopulmonary resuscitation (CPR) is required.\n\n"
"• If pulse,  do Mouth-to-mouth resuscitation.\n\n"
"• If bleeding,  stop the bleeding by fastening a piece of fabric to the wound.\n\n"
"• Shock Does not refer to people who have been scared,  but to circulatory shock,  which involves life-threatening internal damage (bleeding). The person is often pale and clammy. Make sure the person is breathing properly and do not give them anything to drink.\n\n"
"🎴 Remember\n\n"
"• Stay at the scene of the accident until the emergency responders have taken over and you have given them all the information they ask for. If you leave too soon,  it may be considered absconding (maximum penalty of imprisonment in case of casualties and of day fines if there are no casualties).\n\n"
"• Exception: If you did not witness the accident and you see that a lot of people have already stopped,  you should not stop yourself,  as this can lead to more accidents and also hinder the emergency response vehicles.\n\n"
"• You must give your name and other information requested of you (even if it is a private individual involved in the accident who is asking).\n\n"
"• You may not move anything at the scene of the accident.\n\n"
"• Exception: If the vehicle/object poses a danger to other road users,  you shall move it.\n\n"
"• The police must always be contacted if someone has been injured in the accident.\n\n"
"🎴 Dangerous goods\n\n"
"• Do not approach lorries marked with signs indicating dangerous goods. Such cargo can be lethal if there is a leak. There may also be a high risk of explosion.\n\n"
"• What to do in the event of a minor accident\n\n"
"🎴 You should keep an insurance claim form (provided by your insurance company) in your car. If you do not have one,  write down:\n\n"
      "• The time,  date and location of the accident.\n\n"
      "• Name and address of any witnesses and what they have seen.\n\n"
      "• The counterpart’s name,  address,  telephone number,  vehicle,  registration number and insurance company. Any damage caused.\n\n"
      "• Parking accident or similar\n\n"
      "• In case of a parking accident or other property damage,  you shall contact the owner of the car or the object that you have run into. The Swedish Transport Agency can help you find information about the owner based on the vehicle registration number.\n\n"
      "• Also put a note with your contact information on the windscreen/location.\n\n"
      "• If you are unable to reach the owner,  you shall contact the police. They will make note of the accident,  which means that you will not be accused of absconding.\n\n"
      "• If the object you have damaged is a road sign,  you must immediately try to restore it.\n\n"
      "🎴 Wildlife accidents\n\n"
      "Greatest risk of wildlife on the road\n"
      "• Dusk and dawn.\n"
      "• May–June and September–October.\n\n"
      "• Salted roads\n"
      "• Open fields\n\n"
      "• Close to a water course\n"
      "• Start and end of a wildlife fence.\n\n"
      "🎴 Accidents involving moose\n\n"
      "• Accidents involving moose are the most dangerous type of wildlife accident. The reason is that the body of the moose,  which weighs around 700 kg,  is at the height of the windscreen of the car. In case of a head-on collision,  there is a great risk of the moose ending up inside the car,  injuring the passengers.\n\n"
      "• Once a moose has started crossing the road,  it will in all likelihood continue straight ahead. It is therefore best to go behind the moose,  if you have to choose which way to swerve.\n\n"
      "🎴 What to do if you hit a large animal\n\n"
      "• Warn other road users with your hazard warning lights and warning triangle.\n\n"
      "• If the animal is killed,  try to move it away from the road. If the animal is wounded and runs away,  you shall mark the location of the accident. This makes it easier for a hunter to track the wounded animal."
      "• If the animal is wounded,  you are obligated to inform the police. You are also obligated to contact the police if the animal you hit (regardless of whether it is wounded) is one of the following:\n\n"
      "• Moose\n"
      "• Bear\n"
      "• Wolf\n"
      "• Boar\n\n"
      "🎴 Warning triangle\n\n"
      "• All cars must be equipped with a warning triangle. If your car stalls on a road where the speed limit is over 50 km/h,  you must put out a warning triangle. Place the warning triangle 50–100 metres behind the car.\n\n"
      "🎴 Traffic accident statistics.\n\n"
      "• Number of deaths: 200–300 per year.\n\n"
      "• Severe injuries: 3, 000 per year.\n\n"
      "• Mild injuries: 20, 000 per year.\n\n"
      "• 20% of all traffic deaths are alcohol- or drug-related.\n\n"
"• 15% of the population is involved in 50% of all traffic accidents.\n\n"
"• 40% of all those killed in traffic were not wearing a seat belt.\n\n"
"• 80% of all those killed in traffic are men.\n\n"
"• 65, 000 wildlife accidents involving large animals (such as moose) occur each year.\n\n"
"• Traffic accidents entail an annual cost to society of 25–50 billion kr.\n\n"
"🎴 Risk of a pedestrian being killed:\n\n"
"• 10% risk of fatality at 30 km/h.\n\n"
"• 80% risk of fatality at 50 km/h.\n\n"
"• Death is almost guaranteed at 90 km/h.\n\n"
"• Different age groups\n\n"
"• 18–19-year-old: Run a 5–6 times greater risk of being involved in a traffic accident.\n\n"
"• 45–54-year-old: Have the best reaction times and are involved in the fewest accidents.\n\n"
"• 65–74-year-old: Have experience and adapt their driving to their limitations (for example by avoiding driving at night or in heavy traffic).\n\n"
"• 75 years old and older: Run a 5–6 times greater risk of being involved in a traffic accident.\n"
      , icon: "signs/roadsigns/asset 358.png", height: 5040),
  const Theory(title:"🎴 Vehicle",  info: "🎴 Motor car\n\n"
      "Today's cars are technically miracle with profusion of in-build electronic system\n\n"
      "🎴 Road user\n\n"
      "• All persons travelling in a vehicle or walking,  cycling or riding along a road are classed as road users.\n\n"
      "🎴Vehicle\n\n"
      "• A device on wheels,  tracks,  runners or similar which is designed primarily for travel on land,  and which does not run on rails. Vehicles are subdivided into motorised vehicles,  trailers,  towed vehicles,  sidecars,  bicycles,  horse-drawn vehicles and other vehicles.\n\n"
      "🎴 Motorised vehicles\n\n"
      "• Private car Class I (normal) and  Class II (campers,  etc.)\n"
      "• Lorry\n"
      "• Light lorry\n"
      "• Heavy lorry\n"
      "• Bus\n"
      "• Light bus\n"
      "• Heavy bus\n"
      "• Motorcycle\n\n"
      "🎴 Moped\n\n"
      "• Class I (EU moped)\n"
      "• Class II\n"
      , icon: "signs/roadsigns/dashboard.png", height: 860),
  const Theory(title: "🎴 Speed", info: "🎴 Speed limits\n\n"
"Speed signs for different vehicles  apply to:\n\n"
"• Private cars.\n\n"
"• Motorcycles.\n\n"
"• Light lorries.\n\n"
"• Buses with a maximum total weight of 3.5 tonnes.\n\n"
"• 🎴 Max 100 km/h for:\n"
"• Heavy bus.\n\n"
"All passengers must have access to a seat belt; otherwise max 90 km/h.\n\n"
"🎴 Max 90 km/h\n\n"
"• Heavy bus where seat belts are not available for all passengers.\n\n"
"• Heavy lorry on motorway and dual carriageway.\n\n"
"🎴 Max 80 km/h\n\n"
"• Car with a trailer or camper with brakes.\n\n"
"• Car with a trailer or camper without brakes which has a total weight (or unladen weight) not exceeding half of the car’s unladen weight.\n\n"
"• Heavy lorry (90 km/h on a motorway or dual carriageway).\n\n"
"🎴 Max 50 km/h\n\n"
"• Heavy off-road vehicle.\n\n"
"• Tractor B. \n"
"• Heavy equipment class I.\n\n"
"🎴 Max 45 km/h\n\n"
"• Moped class I (EU moped).\n\n"
"🎴 Max 40 km/h"
"• Tractor A.\n\n"
"• Car with unbraked trailers whose total weight exceeds half of the car’s unladen weight.\n\n"
"• Tow truck with vehicle suspended at the rear.\n\n"
"🎴 Max 30 km/h\n\n"
"• Towing (normal car–car with tow rope).\n\n"
"• Car with towed vehicle.\n\n"
"• Older moped (“30 moped”).\n"
"• A tractor (“EPA tractor”).\n\n"
"🎴 Max 25 km/h\n"
"• Moped class II.\n\n"
"🎴 Max 20 km/h\n\n"
"• Motorised vehicle on tracks.\n\n"
"• Off-road vehicle on normal public roads.\n\n"
"🎴 Max 10 km/h\n\n"
"• Motorised vehicle or trailer with hard wheels (e.g.,  steel rings).\n", icon: "signs/roadsigns/speed_limit.png", height:1700 ),
  const Theory(title:"🎴 Crash safety,  car protection",  info: "🎴 Crumble zone\n\n"
      " These areas are crumple zones,  which means that they are made to crumple in the event of a crash.\n\n"
      "🎴 Particularly vulnerable areas\n\n"
"• The sides are more vulnerable as the surface for absorbing the crash force is much smaller. Car manufacturers attempt to solve "
"• the problem by inserting special pillars which distribute the crash force and by installing side airbags.\n\n"
"🎴 Safety belt (seat belt)\n\n"
"• The safety belt is an extremely good form of crash protection. It is easy to use and the chances of surviving a crash increase dramatically.\n\n"
"• Tighten the belt properly so that it sits close to the body (remove thick jackets).\n\n"
"🎴 There are 2 main types of belt in private cars:\n\n"
"• Two-point belts (waist belts): Only fastens over the waist. Previously the most common type; still sometimes used for the middle seat in the back.\n\n"
"• Three-point belts: The belt runs across the waist and then diagonally across the body towards the neck. This provides better protection than the two-point belt. "
      "• Note that the upper part of the belt should sit as close to the neck as possible and not out on the shoulder.\n\n"
"• Belt tensioners are found in newer cars. This is an automatic system which pulls the belt hard in the event of a crash. This means that you are better protected.\n\n"
"• For pregnant women,  it is better that the belt sits under the belly so that the baby is not squeezed. If you are far into your pregnancy,  it may be best not to drive at all,  as the child runs the risk of being injured by the steering wheel and airbag in the event of a collision.\n\n"
"• 40% of drivers who die in traffic were not using a seat belt.\n\n"

"🎴 Airbag\n\n"
"• Sit at least 25 cm from the airbag; otherwise it can injure you when it inflates.\n\n"
"• It takes just 0.1 second for the airbag to fill up.\n\n"
"• This can lead to serious injury if the seat belt is not used at the same time.\n\n"
"• Triggered at speeds over 20–30 km/h.\n\n"
"🎴 There are different types of airbags:\n\n"
"• In the steering wheel: This is the most common type which protects the driver in the event of a collision.\n\n"
"• Front passenger seat: Protects the passenger in front. Note that it must be disconnected if a child safety seat is used.\n\n"
"• Side airbags: Smaller airbags which protect you in the event of a collision from the side.\n\n"
"🎴 Head restraint\n\n"
"• The head restraint is not a comfort feature; it is an important form of protection for the neck in the event of a collision.\n\n"
"• Position it so that your head does not pass over the top of the head restraint when leaning back.\n\n"
"🎴 Whiplash\n\n"
"• Whiplash injuries are sustained when the neck is thrown about violently in the event of a collision,  damaging the neck muscles."
"• Very common,  especially in the event of rear-end collisions.\n\n"
"• It often passes,  but can remain for a long time and involve muscle pain,  headaches and difficulties sleeping."
"• Car manufacturers attempt to continuously improve protection for the neck in order to avoid whiplash injuries.\n\n"
"🎴 Be cautious:\n\n"
      "• Take off your jacket else open and wear the belt inside..\n\n"
      "• 40% of those killed in traffic didn't use seat belt..\n\n"
      "• No child seat where air bag are fitted.\n\n"
      "• Driver are responsible to ensure that children under the age of 15 years are well protected.\n\n"
      "• Belt seat and belt cushion from  4 years up to 135 tall. Backward facing from 7 mouth to 4 years\n", icon: "signs/roadsigns/car_safety.png", height: 2330),

  const Theory(title:"🎴 Car characteristics\n distances (reaction,  braking,  stopping)",  info:
      "🎴 Reaction distance\n\n"
"The reaction distance is the distance you travel from the point of detecting a hazard until you begin braking or swerving.\n\n"

"🎴 The reaction distance is affected by"
"The car’s \n speed (proportional increase):\n\n"
"• 2 x higher speed = 2 x longer reaction distance.\n\n"
"• 5 x higher speed = 5 x longer reaction distance.\n\n"
"🎴 Your reaction time.\n\n"
"• Normally 0.5–2 seconds.\n\n"
"• 45–54 year-old have the best reaction time in traffic.\n\n"
"• 18–24 year-old and those over 60 have the same reaction time in traffic. Young people have sharper senses but older people have more experience.\n\n"
"🎴 The reaction distance can be decreased by\n"
"• Anticipation of hazards.\n\n"
"• Preparedness.\n\n"
"🎴 The reaction distance can be increased by\n"
"• The necessity of decision-making (for example,  between braking or steering out of the way).\n\n"
"• Alcohol,  drugs and medication.\n\n"
"• Tiredness.\n\n"
"🎴 Easy method: Calculate the reaction distance\n\n"
"• Formula: Remove the last digit in the speed,  multiply by the reaction time and then by 3.\n\n"
 "🎴 Example of calculation with a speed of 50 km/h and a reaction time of 1 second:\n\n"
"• 50 km/h ⇒ 5\n"
"• 5 * 1 * 3 = 15 metres reaction distance\n\n"
      "🎴 Braking distance\n\n"
"• The braking distance is the distance the car travels from the point when you start braking until the car stands still.\n\n"

"🎴 The braking distance is affected by\n\n"
"• The vehicle’s speed (quadratic increase; “raised to the power of 2”):\n\n"
"• 2 x higher speed = 4 x longer braking distance.\n\n"
"• 3 x higher speed = 9 x longer braking distance.\n\n"
"• The road (gradient and conditions).\n\n"
"• The load.\n\n"
"• The brakes (condition,  braking technology and how many wheels are braking).\n\n"
"🎴 Calculate the braking distance\n\n"
"• It is very difficult to achieve reliable calculations of the braking distance as road conditions and the tyres’ grip can vary greatly. The braking distance may for example be 10 times longer when there is ice on the road.\n\n"

"🎴 Easy method to Calculate the braking distance\n\n"
"• Conditions in good and dry road conditions,  good tyres and good brakes.\n\n"
"🎴 Formula: Remove the zero from the speed,  multiply the figure by itself and then multiply by 0.4.\n\n"

"• The figure 0.4 is taken from the fact that the braking distance from 10 km/h in dry road conditions is approximately 0.4 metres. "
      "This has been calculated by means of researchers measuring the braking distance. Thus,  in the simplified formula,  we base our calculations on the braking distance at 10 km/h and increase it quadratically with the increase in speed.\n\n"

"🎴Example of calculation with a speed of 10 km/h:\n\n"

"• 10 km/h ⇒ 1\n"
"• 1 * 1 = 1\n"
"• 1 * 0.4 = 0.4 metres braking distance\n\n"

"🎴 Example of calculation with a speed of 50 km/h:\n\n"

"• 50 km/h ⇒ 5\n"
"• 5 * 5 = 25\n"
"• 25 * 0.4 = 10 metres braking distance\n\n"
      "🎴 Stopping distance\n\n"
      "• Stopping distance = reaction distance + braking distance\n\n"

      "🎴 Calculate the stopping distance with these easy methods\n\n"
      "• It is summer and the road is dry. You are driving at 90 km/h with a car with good tyres and brakes. You suddenly notice a hazard on the road and brake forcefully\n\n. How long is the stopping distance if your reaction time is 1 second?\n"
      "• The stopping distance is the reaction distance + braking distance. First we calculate the reaction distance:\n\n"

      "• 90 km/h ⇒ 9\n"
      "• 9 * 1 * 3 = 27 metres reaction distance\n\n"
      "🎴 Then we calculate the braking distance:\n\n"

      "• 90 km/h ⇒ 9\n"
      "• 9 * 9 = 81\n"
      "• 81 * 0.4 = 32 metres braking distance\n\n"
      "🎴 Now both distances are combined:\n\n"
      "• 27 + 32 = metres stopping distance\n", icon: "signs/roadsigns/reaction-braking-stopping.png", height: 2680),
  const Theory(title:"🎴 Steering the car’s steering\n  system and performance",  info: "🎴 Steering\n\n"
      "You turn the steering the car feel to change direction.\n\n"
      "🎴 Oversteering\n\n"
"• The car turns too much as the back tyres lose grip.\n\n"
"• The result is a rear-wheel slide (fishtail).\n\n"
"• This normally affects rear-wheel drive cars.\n\n"
"• To avoid oversteering,  put the best tyres at the back.\n\n"
"🎴 Causes of oversteering\n\n"
"• Aquaplaning with the back tyres.\n\n"
"• Forceful braking.\n\n"
"• Forceful acceleration with a rear-wheel drive car.\n\n"
"• Tail-heavy car (too heavy a load at the rear).\n\n"
"• Insufficient air in the back tyres.\n\n"
"• Worn back tyres.\n\n"
"• Connected trailer or camper Crosswind.\n\n"
      "🎴 Understeering\n\n"
"• The car turns too little as the front tyres have insufficient grip.\n\n"
"• The car wants to continue straight ahead in the bend.\n\n"
"• This normally affects front-wheel drive cars. (Most new cars have front-wheel drive.)\n"
"• Better than oversteering,  as understeering requires less of the driver.\n\n"
"• 🎴 Causes of understeering\n\n"
"• Aquaplaning with the front tyres.\n\n"
"• Braking without ABS brakes.\n\n"
"• Forceful acceleration in a front-wheel drive car.\n\n"
"• Insufficient air in the front tyres.\n\n"
"• Nose-heavy car (too heavy a load at the front).\n\n"
"• Worn front tyres.\n\n"
"• Connected trailer or camper.\n\n"
"• Locked differential (the wheels are forced to move at the same speed in bends).\n\n"
      "🎴 Steering system\n\n"
"• Power steering is an aid that makes it easier to turn the wheel.\n\n"
"• Choppy steering probably indicates that dirt or air has entered the servo.\n\n"
"• Steering wheel shakes are vibrations in the steering wheel which are normally caused by imbalance in the front wheels or looseness in the steering mechanism.\n\n"
"🎴 Electronic stability control\n\n"
"• A computer with sensors detects whether a wheel is spinning or if the car is hastily turned in a certain direction. With this information,  the computer calculates the best measure for resolving the situation (e.g.,  applying brakes to one of the wheels).\n\n"

"• These calculations and corrections take place so quickly that you as the driver normally do not notice anything. The electronic systems are very good from a road safety perspective\n\n"

"🎴 Different names\n\n"
"Different manufacturers have different names for their electronic systems. A few examples:\n\n"

"• Anti-skid system\n"
"• Anti-spin system\n"
"• DSTC (Dynamic Stability and Traction Control)\n"
"• ESP (Electronic Stability Program.  It senses if the car is skidding and immediately adjust its direction by breaking one wheel or more)\n\n"
"• ESC (Electronic Stability Control)\n\n"
"🎴 Aquaplaning\n\n"
"• Aquaplaning essentially means that the car becomes a boat without steering. The tyres are unable to disperse all of the water from beneath it and thereby do not make contact with the road. In other words,  the car “floats” on the water.\n\n"

"• Slush planing is the same thing as aquaplaning,  though it involves snow and slush rather than water.\n\n"

"🎴 Factors which increase the risk of aquaplaning or similar loss of control\n\n"
"• Large pools of water.\n\n"
"• High speed.\n\n"
"• Wide tyres.\n\n"
"• Tyres with poor tread depth.\n\n"
"🎴 If you begin aquaplaning\n\n"
"• Do not make any sudden movements with the steering wheel.\n\n"
"• The wheels should point in the direction of the road,  so that you do not begin to skid when the grip returns.\n\n"
"• Depress the clutch.\n\n"
"• Release the accelerator.\n\n"
"• Do not brake.\n", icon: "signs/roadsigns/understyrning.png", height: 2840),
  const Theory(title:"🎴 Tyre tread depth",  info: "🎴 Different types of tyres\n\n"
"• Summer tyres are the type of tyres you must use when winter road conditions are not prevailing.\n\n"
"• Winter tyres are marked “MS” (Mud and Snow) and come in 2 varieties:\n"
"• Studded tyres = good grip on snow and icy surfaces,  but causes a lot of wear on the roads.\n\n"
"• Friction tyres = good grip on snow,  slightly less on ice,  less wear on the roads.\n\n"
"• The main differences between summer and winter tyres are the tread pattern and the rubber compound. If summer tyres are used in the winter,  the more sensitive rubber can become hard and therefore have worse properties.\n\n"

"• When it is obligatory to use winter tyres,  and when it is prohibited\n"
"• The law on winter tyres in winter road conditions 1 December–31 March.\n\n"
"• It is prohibited to have studded tyres 16 April–30 September unless winter conditions are prevailing or expected.\n\n"
"• Winter road conditions exist when there is snow,  ice,  slush or frost on some part of the road.\n\n"
   "🎴 Tread depth \n\n"
      "• Min 1.6,  reduced grip on wet at 3-4 mm.\n\n"
      "• Max 9mm,  new tyre has 9mm depth.\n\n"
      "• Used winter tyre must have at least 3mm depth.\n\n"
      "• In 1 december to 31 march winter tyre at least 3mm of tread depth must be used.\n\n"
      "• Permitted summer tyres fitted with snow chains from  1 of December to 31 march and form 16 april to 30 sep Studded tyres are prohibited,  not applicable in winter conditions\n\n"

      "🎴 Spare tyre in the event of a puncture\n\n"
      "• A regular spare tyre is exactly the same type of tyre that the car normally has. You are allowed to drive with this just as with a regular tyre. However,  it is often best to repair the old wheel and put it back,  as a brand new tyre on one side can worsen the car’s handling.\n\n"
      "• A temporary spare is a narrower tyre version that is only suitable for bringing the car into a shop. The car’s instruction manual contains instructions regarding maximum speed,  maximum distance and lifting pressure for the temporary spare.\n\n"
      "• If the regular or temporary spare is a summer tyre and the others are studded tyres,  you are permitted to drive with the tyre until the studded tyre has been repaired.\n\n"

      "🎴 Tyre fault\n\n"
      "• Incorrect wheel alignment causes the car to pull to one side if you hold the steering wheel loosely on a straight road. This leads to uneven wear on the tyres. It can be caused by the tyres bumping into something.\n\n"
      "• Incorrect balancing (“steering wheel shakes”) leads to the steering wheel vibrating occasionally. This leads to increased tyre wear \n", icon: "signs/roadsigns/tyre_dept.png", height: 1720),
  const Theory(title:"🎴 Car brake system",  info: "🎴 Car brake system – driving licence theory\n\n"
"Dual-circuit brake system.\n\n"
"• Dual-circuit brake systems entail the footbrake being divided into two independent parts. If one circuit (brake for 2 wheels) fails,  the second circuit (remaining 2 wheels) "
"• functions as normal. This increases the level of safety and is a feature of all apart from the oldest of cars\n\n."

"• Modern cars have hydraulic brakes. This means that the braking force is transferred from the pedal to the brakes "
"with the help of a special brake fluid.\n\n"


"• When the brake fluid reaches the wheel,  it operates the brake. There are 2 different types of brakes: disc brakes and drum brakes.\n\n"

"🎴 Disc brakes\n\n"
"• Disc brakes have an open brake disc and a caliper which is pressed against the disc when you brake. These brakes are normal for the front wheels,  but have also become increasingly "
"common in use on all wheels as they are often more effective than drum brakes.\n\n"

"🎴 Drum brakes\n\n"
"• Drum brakes have a closed construction consisting of a round drum. Inside the drum are brake shoes which are pressed against the drum when you brake. These brakes are commonly used for the back wheels.\n\n"

"🎴 ABS brakes\n"
"• Anti-lock brakes (ABS) help you to maintain control of the car (manoeuvrability) in conjunction with forceful braking. The braking distance can be decreased,  but in certain cases may be increased.\n\n"

"🎴 How ABS brakes work\n\n"
"• You press down the brake pedal hard,  which causes the wheels to lock (car glides forward,  tyres “squeal”).\n\n"
"• The ABS system senses instantly that the wheels have locked (as they are not turning).\n\n"
"• The ABS system releases some of the pressure on the brakes so that the tyres begin to turn.\n\n"
"• The ABS system then adapts the braking force so that it is as strong as possible without becoming excessive and locking the brakes.\n\n"
"As the wheels are not locked,  you can steer in conjunction with braking with ABS. This is very important if you need to swerve to avoid something.\n\n"

"🎴 Confusion and ignorance among drivers regarding ABS\n\n"
"• When you brake hard with a car which features ABS,  the pedal may begin to stutter and pulsate (it sounds as if something is wrong). This is entirely normal,  however,  as this is how the ABS system works!\n\n"

"• You should continue to hold down the pedal as hard as you can,  without releasing,  however strange it feels.\n\n"

"• Drivers releasing the brakes is,  however,  still common – so much so that there are Brake Assist (BA) systems which,  in connection with forceful braking,  retain the pressure on the brake pedal despite the driver releasing it.\n\n"

"🎴 Faulty brakes – test\n\n"
"• In order to test the brakes,  press the pedal down hard for 20 seconds and check for the following:\n\n"

"• If the brake pedal sinks very low,  this indicates wear.\n\n"
"• Should the pedal continue to sink slowly,  despite the fact that you have reached the “bottom”,  this means there is probably a leak in the brake system. This poses a very serious traffic hazard and must be rectified immediately.\n\n"
"• If the pedal feels springy,  this may be due to air in the brake system. Take the car to a shop to have this rectified.\n\n"
"• It is also important to test the brakes once in a while. If the car is pulling to one side,  it is time to take it to the shop.\n\n"

"• It is especially important to test the brakes after washing the car,  as the water has a negative impact on them. Forceful,  controlled braking will dry up the moisture.\n\n"


"🎴 Brake fluid\n\n"
"• Brake fluid is normally yellow and is topped up in one of the smaller reservoirs in the engine compartment.\n\n"

"• If you make a kink in a garden hose,  this leads to a build-up of pressure as the water has nowhere to go. Hydraulic brake systems work in the same way.\n\n"

"The brake lines are filled to maximum capacity and when you press on the brake pedal,  the brake fluid wants to exit via the other end. This is not possible,  "
      "as the system is closed. The result is that the fluid presses on the brakes so that the car stops.\n\n"

"• As the brake fluid is liquid,  the brake lines (which the fluid travels through) can be curved to fit the car’s form.\n\n"

"🎴 Changing brake fluid\n\n"
"• One problem with brake fluid is that it attracts moisture/water,  which can lead to a deterioration of its properties. This means that it needs to be changed every two years as a rule.\n\n"

"🎴 Brake servo (vacuum servo)\n\n"
"• Just like power steering,  the brake servo helps you by reducing the force required from you when depressing the brake pedal. The brake servo only works when the engine is running.\n\n"

"• Test to see if the brake servo is working\n\n"
"• Pump the brake pedal a few times with the engine switched off.\n\n"
"• Start the car with the brake pedal depressed.\n\n"
"• If the pedal sinks when the engine starts,  the servo is working as it should.\n\n"
"• Parking brake (handbrake)\n\n"
"• The handbrake is there to stop the car from rolling when it is parked. This normally applies the brakes to the back wheels. Things to consider with the handbrake:\n\n"

"• Do not use if it is cold and humid,  as there is a risk that it will freeze in place.\n\n"
"• It may seize up if you do not use it regularly.\n\n"
"• In addition to the parking brake,  it is good to put the car in first gear,  as this further reduces the risk that the car will roll.\n\n"
"• Check to see whether the parking brake is working:\n\n"
"• Set the car rolling down a hill and then pull on the brake.\n\n"
"• Try to drive with the brake on.\n", icon: "signs/roadsigns/skivbroms.png", height: 3430),
  const Theory(title:"🎴 Lights on the car",  info:
"🎴 Dipped headlights\n\n"
"The norm is to use a combination of dipped headlights and parking lights. There are however prohibited light combinations:\n\n"

"• Dipped headlights + fog lights = prohibited\n"
"• Dipped headlights + daytime lights = prohibited\n\n"
"• Dipped headlights + auxiliary high beam lamps = prohibited\n"
"• Fog lights + daytime lights = prohibited\n\n"
"• Full beam headlights.\n"
"• Street at night.\n"
"• Doubtful as to whether full beam headlights are needed here.\n\n"

"• Full beam headlights are the car’s most powerful lights. Use them as often as you can when it is dark outside. As full beam headlights are so strong,  they may dazzle other road users. "
"• It is prohibited to use full beam headlights under the following circumstances:\n\n"

"• When oncoming vehicles are so close that the driver can be dazzled (also applies to trains,  trailers and vessels).\n"
"• When you are behind another vehicle (the driver is dazzled through their mirrors).\n"
"• When the road is sufficiently lit by daylight or street lights.\n\n"
"• You do not need to dim your full beam headlights for pedestrians. Pedestrians can easily avoid being dazzled by looking away. With full beam headlights you can see pedestrians more clearly,  which is important from a safety perspective.\n\n"

"• If you are driving on a smaller road and approach a junction with a lot of traffic,  it may be a good idea to turn off the full beam headlights as you otherwise risk dazzling the crossing traffic.\n\n"

"• If you meet a lorry at the crest of a hill,  you must dim your full beam headlights as soon as you see the position lights on the roof,  as the driver’s cab is positioned high up in relation to private cars.\n\n"

"• Full beam headlights often enable you to see better. Sometimes,  however,  it can be the opposite. If you are driving in heavy fog or snow,  try switching to dipped headlights to see if visibility improves.\n\n"

"• In order to avoid being dazzled by oncoming cars at night-time,  fix your gaze along the right side of the road.\n\n"

"🎴 Indicators\n\n"
"As a rule,  indicators are placed at the back,  front and sides of the car. They are to be used when you are intending to:\n\n"

"•Turn right or left.\n"
"•Change lane.\n"
"•Turn around.\n\n"
"•Pull out from the side of the road.\n"
"•Manoeuvre the car sideways in any other notable manner.\n\n"
      "🎴 Important clarification regarding the use of indicators\n\n"

      "• I am driving on a priority road and see this sign. Do I need to indicate if I intend to continue to the right?\n"
      "• – Yes,  you must show the other road users what you intend to do.\n\n\n"



      "• I position myself in the left lane. Do I need to indicate left when I turn?\n"
      "• – Yes,  oncoming traffic does not see the arrows on the ground.\n\n"
"🎴 Hazard warning lights\n\n"
"• Hazard warning lights must be used in the event of an emergency stop or similar. The hazard warning lights normally use the same lights as the normal indicators. The difference is that all lights blink at the same time.\n\n"

"• During towing,  the hazard warning lights are used on the car being towed,  but this is not a requirement. It is however important to consider that this can cause confusion in connection with turning. One solution can be to temporarily switch off hazard warning lights in connection with junctions.\n\n"

"🎴 Fog lights\n\n"
"• The front fog lights have a stronger beam than the dipped headlights and are therefore more effective in fog. It is permitted to use fog lights instead of dipped headlights in daylight,  but never to combine these two types.\n\n"

"• In darkness,  it is only permitted to use fog lights instead of dipped headlights in the event of fog or heavy rain.\n\n"
"🎴 Rear fog light\n\n"
"• The rear fog light (a very powerful red light) is used so that drivers behind you can see you clearly when visibility is drastically reduced. The rear fog light is dazzling,  so it must be turned off as soon as you feel that the vehicle behind you has seen you.\n\n"

"🎴 Daytime lights\n\n"
"• Daytime lights are used to increase the car’s visibility. When it is daylight and visibility is good,  daytime lights can be used instead of dipped headlights. Not all cars have daytime lights.\n\n"

"• Combining daytime lights with dipped headlights or fog lights is prohibited.\n\n"

"🎴 Auxiliary high beam lamps\n\n"
"• Auxiliary high beam lamps can be fitted to the car in order to strengthen the full beam headlights (may not be used together with dipped headlights). "
"• There are two different types of auxiliary light beam lamps:\n\n"

"• Cornering lamps illuminate the area close to the car so that you can see clearly along the edges.\n"
"• Spot lights cast a narrow beam forward so that you can see further up ahead.\n\n"
"🎴 Parking lights\n\n"
"• Parking lights should be used when stopping or parking the car in poor visibility. This is in order for other road users to see the car. The parking light is low-power and can as a rule be left on for many hours without draining the battery.\n\n"

"🎴 Tail lights\n\n"
"• At least 2 red lights which turn on automatically.\n\n"

"🎴 Brake lights\n\n"
"• Red lights which illuminate when the brake pedal is depressed. The brake lights always give out a stronger light than the tail lights.\n\n"

"🎴 Reversing light\n\n"
"• White light which illuminates when the car is in reverse.\n\n"

"🎴 Rear registration plate lamp\n\n"
"• Lights up automatically and illuminates the registration plate.\n\n"

"🎴 Correct dimming of full beams\n"
"• Head-on\n\n"
"• Correct dimming of full beams,  example\n\n"
"1. Drive with full beam headlights as long as you can. It is important that you can see what is happening on the road ahead.\n\n"

"🎴 Correct dimming of full beams.\n\n"
"2. When the full beam headlights “meet” on the road or when you feel that you are dazzled by the other car,  it is time to switch to dipped headlights.\n\n"

"🎴 Correct dimming of full beams.\n\n"
"3. Exactly at the point when you are level with the other car,  switch back to full beams.\n\n"

"🎴 Overtaking\n\n"
"Correct dimming of full beams.\n\n"
"1. Drive with full beam headlights as long as you can. It is important that you can see what is happening on the road ahead.\n\n"

"🎴 Correct dimming of full beams.\n\n"
"2. When you are close to the car that you are to overtake,  it is time to dim your full beams.\n\n"

"🎴 Correct dimming of full beams.\n"
"3. Exactly at the point when you are level with the other car,  switch back to full beams.\n\n"

"🎴 Correct dimming of full beams.\n\n"
"4. Now it is the car which has been overtaken which must turn off their full beam headlights in order not to dazzle you.\n\n"

"🎴 Bends\n\n"
"• Correct dimming of full beams.\n\n"
"In this bend,  car A must switch off their full beam headlights quickly so as not to dazzle B. Car B,  however,  can have their full beams on for longer,  as the beams are pointing away from A.\n\n"
"🎴 Visibility in darkness\n"
"Dark clothing with reflectors:\n\n"
"• Dipped headlights: 25 m\n\n"
"• Full beam headlights: 150 m\n\n"
"🎴 Light clothing without reflectors:\n\n"
"• Dipped headlights: 60 m\n\n"
"• Full beam headlights: 300 m\n\n"
"🎴 With reflectors:\n\n"
"• Dipped headlights: 125 m\n\n"
"• Full beam headlights: 450 m \n", icon: "signs/roadsigns/car_light.png", height: 4848),
  const Theory(title:"🎴 Alcohol,  drunk driving,  drugs and medications",  info: "🎴 Don't  drink and drive \n\n"
"Drunk driving\n\n"
"• 0.2 per mille (‰) = 0.1 mg of alcohol per litre of breath.\n\n"
"• Punishable by fines or imprisonment for up to 6 months.\n\n"
"• 1 or 2 years with either a mandatory alcolock or a revoked driving licence.\n\n"
"• Aggravated drunk driving (gross drunk driving)\n\n"
"• 1.0 per mille (‰) = 0.5 mg of alcohol per litre of breath.\n\n"
"• Punishable by imprisonment for up to 2 years (combined with gross negligence manslaughter = up to 6 years).\n\n"
"• 2 years with either a mandatory alcolock or a revoked driving licence.\n\n"
"🎴 Per mille\n\n"
"• Per mille (‰) = thousandth. In relation to alcohol,  “1 per mille” means that there is one part alcohol per 1000 parts blood (1/1000 concentration of alcohol in the blood).\n\n"

"🎴 Alcohol	What happens\n\n"
"• 0, 1–0, 4‰	Loss of certain inhibitions and overestimation of your own abilities. Slower reaction time (1/3 longer stopping distance).\n\n"
"• 0, 4–1, 0‰	Impairment of vision,  speech and coordination.\n\n"
"• 1, 0–2, 0‰	Difficulty controlling the body,  impaired balance and double vision.\n\n"
"• 2, 0–3, 5‰	Deep sleep.\n\n"
"• Over 3, 5‰	Great risk of coma or death.\n\n"
"🎴 Alcohol awareness\n\n"
"• It may be considered drunk driving even if you are under the legal limit,  if you are driving recklessly. In other cases,  you may get a warning,  even if your blood alcohol is over the legal limit.\n\n"
"• Serving alcohol to someone you know will be driving may be considered complicity in drunk driving,  which is a punishable offence. The same is true if you lend your car to a drunk person.\n\n"
"• If you are taken into custody for being intoxicated in another context,  your learner’s permit or driving licence may be revoked.\n\n"
"• The legislation on alcohol applies not only to cars,  but to all motor vehicles.\n\n"
"• It is impossible to control your body’s breakdown of alcohol. Forget saunas and similar tricks,  the only thing you can do is wait it out.\n"
"• Even if there is no alcohol left in the blood,  you often feel worn out the day after drinking a lot of alcohol.\n"
"• Weight,  general health,  gender,  drinking speed and food choices impact on your blood alcohol.\n\n"
"• A person who consumes the exact same amount of alcohol on two different occasions may get different blood alcohol levels depending on a number of factors,  such as what they have eaten.\n"
"• The legislation on drunk driving is applicable everywhere,  including fenced-off areas and private property\n\n."
"🎴 Alcolock instead of revoked licence\n\n"
"• As of 2012,  it is possible to choose an alcolock instead of revoking a driving licence.\n\n"

"• The person must then use the alcolock for 1 or 2 years (depending on the severity of the drunk driving offence)."
"• This is only applicable to drunk driving relating to alcohol,  meaning that it is not used when other drugs are involved."
"• The price of an alcolock is 20, 000–50, 000 kr (the alcolock itself along with regular inspections).\n\n"
"• Medications in traffic\n\n"
"• There is no list of drugs that are “prohibited in traffic”. The prohibition relates to driving in a manner that causes a traffic hazard. This prohibition is applicable even if the drug has been prescribed by a doctor."
"• It is your responsibility to judge whether the drug makes you a traffic hazard (consult your doctor,  pharmacy and the package leaflet).\n\n"
"• Narcotic substances can be legal if they have been prescribed by a doctor.\n"
"• If you cause a traffic hazard when driving under the influence of a drug,  it falls under the drunk driving legislation.\n\n"
"🎴 Narcotics in traffic\n\n"
"• Zero tolerance against narcotics in traffic. There may not be the smallest trace.\n"
"• If you cause a traffic hazard due to a drug,  the drunk driving legislation applies.\n\n"
"🎴 Different types of drugs:\n\n"
"• Stimulants lead to hyperactivity and an overestimation of your driving abilities. Tiredness is repressed,  and the driver can fall asleep at any time without warning. Cocaine and amphetamine are part of this group.\n\n"
"• Sedatives cause sluggishness and concentration difficulties. Heroin,  opium and morphine are part of this group.\n"
"• Hallucinogens cause hallucinations,  disorientation and impairs judgement. LSD is part of this group.\n\n"
"🎴 Mobile phones\n\n"
"• Using a mobile phone or similar equipment in traffic can be just as dangerous as driving under the influence. A few facts:\n\n"

"• It is prohibited to use a mobile phone,  fiddle with a GPS device or similar if it makes you inattentive and thus creates a traffic hazard.\n"
"• Using a handheld mobile phone is always prohibited when you are driving. This also applies to other handheld devices,  like a GPS.\n\n"
"• A hands-free frees both your hands,  but does not reduce the risks to any greater degree,  as it is the conversation itself that distracts you."
"• Text messaging behind the wheel is very dangerous (a significantly greater hazard than making a call).\n\n The risk level is the same as that of a highly intoxicated person. "
      "It is prohibited to text from a handheld mobile phone when you are driving."
      "it common to have your main beam headlight on and parking lights  not with the fog lights and day lights.\n\n"

"🎴 Statistics\n\n"
"• 70 people per year are killed in alcohol-related traffic accidents. That is 20% of the total number of killed.\n"
"• 15, 000–20, 000 drunk drivers per day.\n\n"
"• 30, 000 people are caught drunk driving each year. 10, 000 of these are due to drugs.\n"
"• 50% of all drivers killed in fatal single-vehicle accidents were under the influence of alcohol.\n"
"• 30% of cyclists and pedestrians killed were under the influence of alcohol.\n\n"
"• 90% of the drunk drivers are men,  primarily younger and middle-aged.\n"
"• Young drivers are overrepresented in these statistics. They drive drunk more often and run a greater risk of being killed.\n\n"
"🎴 Alcohol calculation\n\n"
"• Volume of spirits = percentage by volume * the volume in cl * 0.025\n\n"

"🎴 Example\n\n"
"• How much spirits (40%) corresponds to 50 cl of light beer with 3.5 percentage alcohol by volume?\n\n"

"• Answer: 3.5 * 50 * 0.025 = 4.38 ≈ 4 cl\n", icon: "signs/roadsigns/drunk-driving.png", height: 3820, ),
  const Theory(title:"🎴 Load: regarding light trailers and the car’s weight",  info: "🎴 Trailers and the car’s weight\n\n"
      "Loading regarding light trailers and the car’s weight\n\n"
"🎴 Correct loading\n\n"
"• The following 3 points are the basis for correct loading:\n\n"

"• Secure the load with a strap or similar. Unsecured loads which slide around can be thrown and cause major damage in the event of forceful braking or a collision.\n\n"
"• Position the load far forward (as close to the front as possible) so that it will not come loose and fly away. If the load is already tucked right in against the back seats in the boot,  it has nowhere to go in the event of forceful braking.\n\n"
"• Position heavy loads low in order to reduce the risk of them being thrown and causing damage.\n"
"• Normally,  it is during braking that the greatest stresses on the load and fastenings arise. This means that the fastening must at least withstand:\n\n"

"• 80% of the cargo weight in a forward direction.\n\n"
"• 50% of the cargo weight in a backwards direction and to the sides.\n\n"
"• If you have loaded a refrigerator weighing 40 kg onto a trailer,  the straps must withstand a minimum pressure of 32 kg (80% of 40) in a forward direction and 20 kg (50% of 40) in the other directions.\n\n"

"🎴 Weight terminology\n\n"
"• Unladen weight: Unladen car with standard setup including driver (75 kg).\n\n"
"• Maximum load: Maximum permitted load in accordance with the registration certificate.\n\n"
"• Total weight: Unladen weight + maximum load.\n\n"
"• Gross weight: The weight at a given time.\n\n"
"🎴 Light trailer\n\n"
"• With a category B licence,  you are only allowed to tow a light trailer. The matter of which trailers are classed as light is often determined by the weight of the towing car.\n\n"

"• Note that there is a difference between what is classed as a light trailer and whether or not the car is permitted to tow the trailer!\n\n"

"• What counts as a light trailer?\n\n"
"• Trailer with a maximum total weight of 750 kg."
"or"
"Trailer where the maximum total weight for car + trailer is 3.5 tonnes.\n\n"
"• The requirement for the trailer’s total weight not to exceed the car’s unladen weight was removed in 2013.\n\n"
"🎴 Trailer,  example 1\n\n"
"• Trailer	The trailer’s total weight is less than 750 kg and is therefore classed as light.\n\n"

"• No calculations need to be done.\n"
"• Total weight: 600 kg\n\n"

"🎴Trailer,  example 2\n\n"
"Car	Trailer\n\n"
"• Total weight: 2, 100 kg	Total weight: 1, 400 kg\n"
"• Calculations must be done,  as the trailer’s total weight exceeds 750 kg.\n\n"

"• The combined total weight (2, 100 kg + 1, 400 kg = 3, 500 kg) is 3.5 tonnes exactly,  but does not exceed 3.5 tonnes.\n\n"

"• This means that the trailer is classed as light.\n\n"

"🎴 Trailer,  example 3\n\n"
"Car	Trailer\n\n"
"• Total weight: 1, 800 kg	Total weight: 2, 000 kg\n\n"
"• Calculations must be done,  as the trailer’s total weight exceeds 750 kg.\n\n"

"• The combined total weight (1, 800 kg + 2, 000 kg = 3, 800 kg) exceeds 3.5 tonnes,  which means that the trailer is not classed as light.\n\n"
"• Is the car permitted to tow the trailer?\n\n"
"• In practice,  the above calculations are seldom necessary. All of information you need is found in the car registration certificate:\n\n"

"🎴 Registration certificate.\n\n"
"• The car with this registration certificate is permitted to tow a trailer weighing a maximum 1, 500 kg,  though not with a regular category B driving licence,  "
      "as O.3 stipulates that the maximum trailer weight for a category B driving licence is 1, 440 kg.\n\n"

"• Am I permitted to use this car to tow a trailer weighing 1, 600 kg with the extended B category or BE licence?\n\n"
"• – No,  as the maximum weight specified in O.1 may never be exceeded,  regardless of category. The car is not built to handle heavier trailers.\n\n"

"🎴 Ball pressure\n\n"
"• Ball pressure is the pressure which the trailer’s coupling device exerts on the car’s towbar. Normally,  the ball pressure should lie somewhere in the interval 30–100 kg.\n\n"

"🎴 High ball pressure\n\n"
"• Excessive load at the front of the trailer. This gives poor traction with the front wheels and makes the dipped headlights dazzle.\n\n"

"🎴 High ball pressure\n\n"
"• The load is all the way forward in the trailer (the red box) and is therefore pressing the coupling device towards the ground. The car is forced to follow it,  and since the car is straight,  the front end is elevated.\n\n"

"🎴 Low ball pressure\n\n"
"• Excessive load at the back of the trailer. This gives poor traction in the rear wheels. Can lead to a driving ban.\n\n"

"🎴 Low ball pressure\n\n"
"• The load is placed far back in the trailer (the red box) and is therefore tipping the trailer backwards so that the coupling device is pushed upwards. The rear of the car is lifted by the coupling device.\n\n"

"🎴 Regulations concerning trailer brakes\n\n"
"• A service brake must be fitted on trailers with a total weight exceeding 750 kg.\n\n"
"• A parking brake must be fitted on trailers with an unladen weight exceeding 400 kg.\n\n"
"• Marking heavy lorries and heavy trailers\n\n"
"🎴 Reflector on a heavy lorry:\n\n"
"• Reflector on a trailer with a total weight exceeding 3.5 tonnes.\n"
, icon: "signs/roadsigns/car_cert.png", height: 3440),
  const Theory(title:"🎴 Vision",  info: "🎴 Sight and other senses in traffic\n\n"
"• Sight is the most important sense in traffic. You receive around 90% of all traffic information through your eyes. For this reason, "
"you are required to have a visual acuity of at least 0.5 for a category B licence (other licence categories have stricter requirements).\n\n"

"• If you have poor eyesight,  your driving licence may be issued on the condition that you must wear glasses to drive. Also remember that your eyesight changes with age,  so you are recommended to have regular eye tests.\n\n"

"🎴 Terms\n\n"
"Visual field\n\n"
"• The area we see is called the visual field. The visual field has the shape of a semicircle,  i.e. 180°.\n\n"

"🎴 Central vision\n\n"
"• The thing you focus your eyes on is what you will see most clearly. This is your central vision,  and it constitutes approximately 1–2% of your visual field. Central vision is important in order to,  for example,  make out what is written on a road sign.\n\n"

"🎴 Peripheral vision\n\n"
"• The remaining 98–99% of your visual field is your peripheral vision. With it,  you can perceive something happening but will most often need to shift your gaze to check with your central vision exactly what it is. The peripheral vision is impaired by alcohol and tiredness.\n\n"

"🎴 Visual field\n\n"
"Semicircle: Visual field\n\n"
"0: Location of eye\n"
"1: Central vision\n"
"2: Peripheral vision\n\n"

"🎴 Assessments\n\n"
"• You constantly collect information through your eyes. This information goes to the brain to be interpreted. It is impossible to make profound assessments about everything you see in traffic; the brain would be overloaded.\n\n"

"• Instead of assessing everything,  the brain quickly selects relevant things to focus on. This selection is made with the help of a number of factors,  including your:\n\n"

"• Experience\n\n"
"• Knowledge\n\n"
"• Expectations\n\n"
"• Interests\n\n"
"• Needs\n\n"
"• Impressions\n\n\n"
"🎴 Statue in Stockholm.\n\n"
"• That’s a lovely statue,  but the pedestrians are more important!\n\n"

"• If your knowledge tells you that parked cars at a pedestrian crossing can be dangerous,  and you have experience of children running out in that spot,  your brain will momentarily devote most attention to that aspect and completely ignore the fact that there are some birds in a tree above the road.\n\n"

"🎴 Terms that may be good to know:\n\n"

"• Perception: Becoming aware of what is happening around you.\n"
"• Selective perception: Selects and focuses on the relevant.\n"
"• Experienced drivers\n\n"
"• Flexible gaze and smooth transitions.\n"
"• Focus on moving objects.\n"
"• Broader and longer field of observation.\n\n"
"• Inexperienced drivers\n"
"• Fix their gaze on objects and keep it there for too long (abrupt transitions).\n"
"• Focus on unmoving objects.\n"
"• Narrower and shorter field of observation.\n\n"
"🎴 Optical illusions\n\n"
"• Humans are smart and have a vivid imagination. This is very helpful in traffic (we are able to imagine a probable scenario based on very little information).\n\n"

"• However,  we sometimes interpret what we see incorrectly,  thus creating an optical illusion.\n\n"

"🎴 Examples of optical illusions\n\n"
"• Car with only one headlight (“one-eyed car”) = motorcycle/moped.\n"
"• Snow smoke gets you disorientated.\n"
"• A motorcycle is mistaken for a slow moped.\n\n"
"🎴 Optical illusion: one-eyed car.\n\n"
"• Illustration of the “one-eyed car” optical illusion. It is dark out. A thinks that B is a small and slow moped,  as B only has one headlight."
      " A is therefore driving closer to the middle of the road (safer in the dark). When A finally realises that B is a car,  they are close to colliding!\n\n"

"🎴 Tunnel vision\n\n"
"• Tunnel vision means that your eyes scan a more narrow area. You miss things that happen on the side of the road (in the periphery). It is as if you were driving in a tunnel with dark walls.\n\n"

"🎴 The risk of tunnel vision increases with:\n\n"
"• Tiredness\n"
"• Alcohol\n"
"• Stress\n\n"
"• 🎴 other senses\n\n"
"• Your hearing alerts you to someone honking their horn or a nearby emergency response vehicle. It also lets you hear if the engine is not running as it should.\n\n"
"• Your sense of touch and balance gives you information about how the car is moving on the road and whether the road condition is good or bad."
"• Your sense of smell is important for discovering any leakage of hazardous substances.\n"
, icon: "signs/roadsigns/sight_and_senses.png", height: 3010),
  const Theory(title:"🎴 Length and width",  info:"🎴 Length and width\n\n"
"Laterally/to the sides\n\n"
"• The load may protrude by a maximum of 20 cm to the sides\n\n."
"• The total width may be a maximum of 260 cm (2.6 m).\n\n"
"🎴 Example 1\n\n"
"• Protruding load,  example 1.\n\n"
"• This is correct. The load protrudes by a maximum of 20 cm to the sides and does not exceed the width of 260 cm.\n\n"

"🎴 Example 2\n\n"
"• Protruding load,  example 2.\n\n"
"• The width of 260 cm is not exceeded,  but what makes this prohibited is that the load protrudes 40 cm to the right side.\n\n"

"🎴 Example 3\n\n"
"• Protruding load,  example 3.\n\n"
"• No load is sticking out,  but the vehicle is wider than 260 cm. This means that it may not be driven on normal roads.\n\n"

"• Exceptions to these rules exist,  but they are very detailed and rarely applicable.\n\n"

"🎴 Length-wise\n\n"
"• The total length may be a maximum 24 metres.\n\n"
"• Exception: 25.25 metres is permitted if certain specific requirements are fulfilled.\n\n"
"• Forward protrusion: Mark.\n\n"
"• Exception: If the part protruding forward is shorter than 1 metre and it is clearly visible to other road users,  it does not need to be marked.\n\n"
"• Rear protrusion: Mark if the part protrudes by more than 1 metre.\n\n"
"🎴 Marking in daylight\n\n"
"• Flags or similar in clear colours both to the front and rear.\n\n"
"• Marking in the dark (or as required by weather conditions)\n\n"
"• Front: Lamp with white light and white reflectors.\n\n"
"• Rear: Lamp with red light and red reflectors.\n\n"
"🎴 Protruding load length-wise.\n\n"
"This is permitted. The maximum length of 24 metres is not exceeded and as the load protrudes by 3 and 4 metres respectively,  it is marked.\n\n"
"🎴 Marking when towing\n\n"
"• When towing,  the tow rope shall be marked if the distance between the vehicles is greater than 2 metres.\n\n"

"🎴 Towing.\n\n"
"• The tow rope is clearly marked as it is over 2 metres long.\n\n"
"🎴 Marking trailers.\n\n"
"At the front:\n\n"
"• White reflectors (max 40 cm from the outer edges).\n\n"
"• White position lamp on trailers wider than 160 cm.\n\n"
"🎴 At the Sides.\n\n"
"• Orange lights.\n\n"
"• Orange reflectors.\n\n"
"🎴 At the Rear.\n\n"
"• Brake lights.\n\n"
"• Indicators.\n\n"
"• Rear registration plate lamp.\n\n"
"• Red triangular reflectors.\n", icon: "signs/roadsigns/length_width.png", height: 2280),
  const Theory(title:"🎴 Tiredness & risks reducing tiredness", info: "🎴 Tiredness in traffic.\n\n"

"• Tiredness is an indication that your body needs to recuperate in order for all your senses to function optimally.\n\n"

"• Nearly all tired drivers are aware of being tired. Despite this,  they continue driving because it seems unnecessary to sleep in"
"• the car when they are “so close” or cannot find a “good” place to stop. In other words,  the tiredness does not appear to be taken seriously enough.\n\n"

"• A sleepless night is comparable to a blood alcohol level of around 0.8 per mille. The penalty for driving when obviously tired is the same as for drunk driving.\n\n"

"🎴 Causes of tiredness.\n\n"
"• Exhaustion.\n\n"
"• Sleep deprivation.\n\n"
"• Alcohol,  drugs and certain medications.\n\n"
"• Monotony:\n\n"
"• Wide,  long and straight uninterrupted roads.\n\n"
"• Engine noise.\n\n"
"• Noise from the tyres.\n\n"
"🎴 Dangers & risks associated with tiredness.\n\n"
"• Nearly all senses and abilities are impaired. However,  the most serious impairments in terms of traffic are the following:\n\n"

"• Poorer concentration.\n\n"
"• Loss of coordination.\n\n"
"• It takes longer to perceive things (some things you fail to notice at all).\n\n"
"• Poor decision-making skills.\n\n"
"• Reaction time and reflexes become slower.\n\n"
"• Difficulty maintaining a steady course and speed.\n\n"
"🎴 Indications of tiredness\n\n"
"• Blurry vision.\n\n"
"• Problems concentrating and thinking clearly.\n\n"
"• Dry mouth.\n\n"
"• Frequent yawning.\n\n"
"• Feeling cold.\n\n"
"• Difficulty maintaining your speed.\n\n"
"• Head feels heavy.\n\n"
"• Overreacting.\n\n"
"• Muscle relaxation.\n\n"
"• Optical illusions.\n\n"
"• Difficulty keeping your eyes open.\n\n"
"🎴 Avoid tiredness"
"• Drive rested.\n\n"
"• Make sure the car is not too warm.\n\n"
"• Take a break after driving for about one hour (get out of the car).\n\n"
"• Do not eat “heavy” foods (meat etc.).\n\n"
"🎴 Reduce tiredness\n"
"The best and only right way:\n\n"
"• Have a long sleep.\n\n"
"🎴 Reducing the tiredness temporarily\n\n"
"• Short nap (no less than 15 minutes).\n\n"
"• Take a break/stretch your legs and get some fresh air.\n\n"
"• Coffee or other form of caffeine (can have the same effect as a 20-minute nap).\n\n"
"🎴 Tiredness glossary\n\n"
"• Microsleeping: When you nod off and wake up almost immediately with a jerk of the head. Microsleeping lasts for a very short period of time,  often less than a second.\n\n"
"• Sleep apnoea: Breathing problems that disrupt your sleep at night. The lack of sleep resulting from this issue leads to a significantly higher risk of tiredness-related traffic accidents.\n\n"
"• Nap: Light and short sleep (15–30 minutes).\n\n"
"🎴 Statistics on tiredness\n\n"
"• Most tiredness-related accidents occur between 02:00 and 05:00.\n\n"
"• Single-vehicle accidents are the most common type of tiredness-related accident.\n\n"
"• 40% of single-vehicle accidents occur at night or dawn (high probability that they are caused by tiredness).\n\n"
"• Close to the destination = greater accident risk,  as you relax thinking that you are almost there.\n\n"
"• Younger men run the greatest risk of having a tiredness-related accident.\n\n"
"• 12 times higher accident risk at night than during the day.", icon: "signs/roadsigns/drivingtired.png", height: 2800),
  const Theory(title:"🎴 Children and young people", info: "🎴 Environment risks\n\n"
"Children and traffic are not a good combination. Only when the children are 9–15 years old is it relatively safe for them to be around traffic.\n\n"

"🎴 The problem of children in traffic\n\n"
"Playful and impulsive\n\n"
"• Much of a child’s life revolves around play. The rules of the fantasy world are all that count. It is obviously more fun to make a difficult football pass than to stop and check for cars!\n\n"

"• Even if you see a child standing still and you have eye contact,  you cannot feel completely sure of the situation. If a friend calls from the other side of the street,  the child might suddenly forget"
" about the cars and run out into the road. You must therefore be vigilant when there are children around.\n\n"

"🎴 Their senses are not fully developed\n\n"
"It takes longer for a child to shift between near and distance vision. Only when the child is 12–15 years old is their vision fully developed. It is also harder for them to distinguish where a sound is coming from. This means that a child’s reaction time may be longer than you think.\n\n"

"🎴 Unable to predict risk\n\n"
"A child can be taught to stop before crossing the street. The problem is that they do not quite understand why this is important,  which means that the instruction can easily be pushed aside when it is time to play.\n\n"

"• Another problem is that children have difficulty judging the risks. They judge a car coming towards them at low speed the same way as one swerving at high pace.\n\n"


"🎴 Bus stop at night.\n\n"
"• Look out for children (and adults) running out between the buses.\n\n"
"• Children are small\n\n"
"• The smaller something is,  the more difficult it is to see. In most cases,  an adult can be spotted behind a parked car. A child,  however,  "
      "can be completely hidden by the car,  which means that you will have no warning before they come out into the street.\n\n"

"🎴 Sensitive to polluted air\n\n"
"Children are particularly sensitive to the pollution caused by traffic. A child who is exposed to a lot of emissions has a higher risk of developing asthma for example.\n\n"

"🎴 School buses\n\n"
"When overtaking a stationary school bus,  you have to be very careful. There is a great risk of the children getting off the bus suddenly running across the street without looking.\n\n"

"• School buses have signs with warning lights that the driver turns on 100 metres before a stop and turns off 100 metres after the stop.\n\n"

"🎴 Crossing guards\n\n"
"In Sweden,  crossing guards are most often children or young people themselves. They wear orange coats with reflectors and stand next to pedestrian crossings.\n\n"

"🎴 Main tasks of the crossing guards\n\n"
"• Make sure that children coming to and from school get across the road safely.\n\n"
"• Act as a “human warning sign” to alert drivers that there are children nearby.\n\n"
"• The crossing guards have no official powers,  for example,  they are not authorised to stop traffic.\n", icon: "signs/roadsigns/cars_with_young.png", height: 1980),
  const Theory(title:"🎴 Roadworthiness test",  info: "🎴 information and facts regarding the roadworthiness test\n\n"


"• The roadworthiness test is carried out in order to reduce the number of accidents,  technical faults and to avoid excessive Emissions of harmful substances.\n\n"

"• The roadworthiness test is obligatory in Sweden and is carried out by an approved testing company.\n\n"

"🎴 What is checked during the roadworthiness test\n\n"
"• Frame – that the car’s load-bearing structure has not been damaged by,  for example,  severe rusting.\n\n"
"• Wheels and control system – that there are no damages to the front or back. The tyres’ condition and tread depth are also checked.\n\n"
"• Drive system – the engine and the electrical,  exhaust and drive system.\n\n"
"• Brake system – function,  effectiveness and evenness of the brakes.\n\n"
"• Bodywork – safety belts,  windows and doors.\n\n"
"• Communication – lights,  indicators,  horn,  windshield washer fluid and warning triangle.\n\n"
"• Environment – the exhaust emissions are compared with the threshold values.\n\n"
"• Other – towbar,  instrument lights and speedometer.\n\n"
"🎴 How often and when the car shall be inspected\n\n"
"• Normally,  you will receive correspondence from one or more testing companies when it is time for the roadworthiness test. The responsibility is however on you to ensure that the vehicle is inspected on time.\n\n"

"• On 20 May 2018,  the old system with the last digit in the registration number was discontinued.\n\n"

"🎴 New inspection rules as of 20 May 2018\n\n"
"• A new car must be inspected for the first time no later than 3 years (36 months) after the month when it was first used.\n\n"
"• The second inspection no later than 2 years (24 months) after the month when the first inspection was made.\n\n"
"• Then no later than 14 months after the month when the most recent inspection was made.\n\n"
"• To simplify,  a car older than 5 years must be inspected every year. It is recommended to schedule an inspection the same month every year and treat the 2 extra months as a margin of safety.\n\n"

"Please note that the last day for inspection is always the last day of the month. This is because you start counting the month after the most recent inspection.\n\n"

"🎴 Examples of inspection dates\n\n"
"• When is a car that was first registered on 2 April 2019 to undergo inspection?\n\n"
"• No later than 30 April 2022\n\n"
"• When is a car that was inspected for the first time on 5 October 2019 to undergo inspection again?\n\n"
"• No later than 31 October 2021\n\n"
"• You have a car made in 2012 and the last inspection was on 8 June 2019. When are you required to inspect it again?\n\n"
"• No later than 31 August 2020\n\n"
"🎴 More rules for roadworthiness tests\n\n"
"• If inspection is not done during the prescribed months,  a driving ban is automatically imposed on the vehicle until it is inspected.\n\n"
"• You must rectify the faults highlighted during the inspection. Otherwise,  a driving ban will be imposed on the vehicle.\n\n"
"• A police officer or vehicle inspector has the right to check a vehicle at any time. This is known as a vehicle spot inspection.\n\n"
"• If the vehicle changes (for example,  if the engine is replaced),  it must be subjected to a registration inspection within 1 month.\n"
, icon: "signs/roadsigns/roadworthiness.png", height: 2260),
  const Theory(title:"🎴 Insurance", info: "🎴 About car insurance\n\n"
      "• Car insurance can be divided into 3 levels: third-party insurance,  partial insurance and fully comprehensive insurance. What is included in the various types of car insurance differs from one insurance company to "
      "the next,  but below is a simplified picture of what should be included in the various car insurances.\n\n"

"• Home insurance can provide you with compensation if you have been injured in an accident,  lost baggage or similar.\n\n"

"• It is good practice to keep an insurance claim form in the car. Order one from your insurance company.\n\n"

"🎴 Different levels of car insurance\n\n"
"• Third-party insurance\n\n"
"• Covers personal injury and damages to another party’s car or property. Therefore if your own car is damaged,  you will not receive compensation.\n\n"
"• Obligatory,  i.e.,  every motorised vehicle must have third-party insurance. If this is missing,  you are penalised with a high third-party insurance fee.\n\n"
"• If you have avoided damages for a number of years,  you can receive a cheaper third-party insurance premium through a no-claims bonus.\n\n"
"• If you are penalised for reckless driving or drunk driving,  the insurance company may claim money back from you (right of recourse).\n\n"
"🎴 Partial insurance (partial casco insurance)\n\n"
"• Covers everything included in third-party insurance plus:\n\n"

"• Theft – if the car is stolen or it is damaged during an attempted theft\n\n"
"• Fire – if the car sets on fire.\n\n"
"• Glass – e.g. stone chips.\n"
"• Machine – if the engine breaks down.\n\n"
"• Legal protection – legal costs are covered.\n\n"
"• Fully-comprehensive insurance (motor vehicle damage insurance)\n\n"
"🎴 Covers everything included in third-party insurance and partial insurance plus:\n\n"

"• Damage to your own car in the event of a traffic accident.\n\n"
"• Scratches and dents.\n\n"
"• Vandalism.\n\n"
"• Towing.\n", icon: "signs/roadsigns/insurance.png", height: 1500),
  const Theory(title:"🎴 Impairments in traffic",  info: "🎴 Impairments\n\n"
"Functional disability (handicap)\n\n"
"• A functional disability is when a person is unable to do what is expected.\n\n"
"• Some disabilities may be difficult to see. You should therefore be patient with anyone who seems to be taking a long time. Example:\n\n"
"• Visible functional disability: Wheelchair or a white cane.\n\n"
"• Hidden functional disability: Hearing impairments or epilepsy.\n\n"
"🎴 Visual impairment & blindness\n\n"

"• People with visual impairments may (but do not have to) carry a white cane when moving around in traffic. "
      "They carry it partly because it helps them get around,  but also because it makes other people aware of their disability."
      " The white cane is known all over the world.\n\n"

"🎴 Signals with the white cane\n\n"
"• Straight towards the ground = waiting and listening.\n\n"
"• Diagonal = intends to start walking.\n\n"
"🎴 When you stop for a visually impaired person at a pedestrian crossing\n\n"
"• Stop in good time before the pedestrian crossing.\n\n"
"• Be careful of making noise – do not rev your engine and only honk your horn if there is an emergency.\n\n"
"• Do not start driving again as soon as the visually impaired person has left your lane,  but wait until they have finished crossing the road."
      " This is so that you do not confuse the person with the sound of your accelerating car.\n\n"
"🎴 Guide dog\n\n"
"• Wears a white harness.\n\n"
"• Helps the visually impaired person to avoid obstacles but is not able to assess the traffic situation!\n\n"
"• Never disturb or make contact with a guide dog.\n\n"
"🎴 Elderly people in traffic\n\n"
"• 5–74 years old: This group generally has a high degree of maturity and traffic experience,  which makes them drive more safely than the 18–19-year-old.\n\n"
"• 5 years old and older: The senses are often impaired and the brain starts to work slower,  which means that they have a 5–6 times higher accident risk (same as 18–19-year-olds)."
      " However,  the older group are often mature enough to realise their shortcomings,  for example,  they avoid driving in the dark and in dense traffic.\n\n"
"🎴 Things that deteriorate with age\n\n"
"• Sight.\n\n"
"• Hearing.\n\n"
"• Balance.\n\n"
"• Reaction time.\n\n"
"• Correct and quick interpretation of impressions.\n\n"
"🎴 Be kind and patient,  without exaggerating\n\n"
"• You are supposed to stop in good time before a pedestrian crossing and let the person with the impairment pass. "
      "But you must never “force” someone to cross the road. If the person is clearly indicating that they do"
      " not intend to cross,  you should respect their decision rather than stay put and wave to convince them"
      " that it is safe to cross.\n", icon: "signs/roadsigns/impairment.png", height: 1990),

  const Theory(title:"🎴 Environment and technology",  info: "🎴 Reduce the car’s fuel consumption by simple means\n\n"
" Catalytic converter\n\n"
"• The catalytic converter transforms the harmful substances in petrol/diesel into carbon dioxide and water with the help of chemical reactions.\n\n"
"• 80–95% of the harmful substances are eliminated.\n\n"
"• The catalytic converter has an operating temperature of 400–600°C,  which means that it takes a while for it to function optimally.\n\n"
"• In Sweden,  all cars manufactured after 1989 must have a catalytic converter.\n\n"
"🎴 Engine heater\n\n"
"• The engine heater is located underneath the bonnet and is used to warm up the engine. There are many benefits to an engine heater:\n\n"

"• The catalytic converter starts working sooner.\n\n"
"• Lower fuel consumption.\n\n"
"• Less wear on the engine.\n\n"
"• How long the engine heater should be turned on\n\n"
"• +10 °C = 20 minutes before leaving.\n\n"
"• 0 °C = 60 minutes (1 hour) before leaving.\n\n"
"• -20 °C = 90 minutes (1.5 hours) before leaving.\n\n"
"🎴 Car with caravan.\n\n"
"• It is not only the weight of the caravan that increases the fuel consumption. The additional air resistance also plays a part.\n\n"

"• Keeping the engine heater on for too long is unnecessary and bad (as it uses up electricity without any benefit).\n\n"

"🎴 Reduce air resistance\n\n"
"• Walking around in a storm with a large open parasol in front of you is hard. The same is true for the car. The fewer wind-catching areas there are,  the less fuel is needed to propel the car. Things to consider when it comes to air resistance:\n\n"

"• Take off rails and roof boxes when not in use.\n\n"
"• Avoid large spoilers etc. (The aerodynamic benefits are often negligible on regular cars).\n\n"
"• Drive with the windows shut. An open side window or sunroof disrupts the airflow around the car,  which leads to greater air resistance.\n\n"
"• Avoid tyres that are too wide.\n\n"
"🎴 Correct tyre pressure\n\n"
"• A steel marble will roll better than a deflated football. The same is true when it comes to the tyres of the car. "
"• Tyres with high air pressure will roll more easily than tyres with less air in them. The more easily the car rolls,  the less fuel it takes to propel it. It also reduces the wear on the tyres.\n\n"

"• 10–15% over the tyre pressure indicated in the manual is usually best. Read more about tyre pressure in the section on tyres.\n\n"

"🎴 Green tyres\n\n"
"• These days,  toxic HA oils are prohibited within the EU. But there are other aspects that make your tyres more or less environmentally friendly. Tyres with low rolling resistance and recycled rubber are good for the environment. If you want to be even more green,  you can buy ecolabelled tyres.\n\n"

"🎴 Use the air conditioning sparingly\n\n"
"• The air conditioning (AC) uses a lot of energy. If you turn off the AC,  you can save 5–10% in fuel consumption.\n\n"

"🎴 Wash the car correctly"
"• You should wash your car in a location intended for that purpose,  such as a petrol station. These places have special floor drains that collect any harmful residues from the wash.\n\n"

"• Waxing your car not only makes it look good – the wax also forms a protective film which means that less dirt sticks to the car. This in turn means fewer washes are necessary,  which is good for the environment.\n"

, icon: "signs/roadsigns/environment.png", height: 2200),
  const Theory(title:"🎴 Eco-driving",  info: "🎴 Environmentally friendly and economical driving\n\n"
" Avoid first gear\n\n"
"• First gear is appropriate when starting. First gear gives the car a lot of power (enough to start moving up a steep incline); however,  the downside of this is that a lot of petrol is used.\n\n"

"• For this reason,  it is best to shift to a higher gear as soon as you can (normally after a few metres).\n\n"

"🎴 Drive in as high a gear as possible\n\n"
"• High gear” means a high number (5th = high,  1st = low). The lower gears make the car more powerful and therefore result in higher fuel consumption.\n\n"

"• Most modern cars can handle 50 km/h in 5th gear. However,  if you notice the car getting sluggish or the engine starting to cough,  you should shift to a lower gear.\n\n"

"• Keep the engine under 3, 000 rpm.\n\n"

"• Also note that older cars that have carburettors instead of fuel injection may get plugged by soot if you drive in too high a gear. (The carburettor engine needs to be “blown out” with a higher rpm).\n\n"

"🎴 Accelerate fairly quickly\n\n"
"• A car driving constantly at the same speed consumes less fuel than an accelerating car. For this reason,  it is best to get up to the speed you want as quickly as you can and not drag out the acceleration phase. "
"• But remember to keep the engine below 3, 000 rpm.\n\n"

"🎴 Avoid the clutch\n\n"
"• Only use the clutch when you have to,  i.e. when shifting gears. The engine uses fuel when the clutch is down.\n\n"

"🎴 Skip gears\n\n"
"• Skipping gears is related to the sections above. You gain momentum more quickly and avoid too much clutch work. The following gear skips are the most common:\n\n"

"• 2nd ⇒ 4th\n"
"• 3rd ⇒ 5th\n\n"
"🎴 Utilise engine braking\n\n"
"• A car that is engine braking consumes no fuel. The actual brake effect is produced by the friction inside the engine.\n\n"

"🎴 How to engine brake\n\n"
"• You engine brake by letting up on the accelerator completely. Keep an eye on the tachometer and shift to a lower gear just before it reaches 1, 200–1, 300 rpm. If you go under that rpm level,  the engine will start consuming fuel again.\n\n"

"🎴 Avoid braking and stopping\n\n"
"• Minimal fuel consumption is achieved by driving along at a constant speed. Each time you brake you “waste” the energy used to build up your speed.\n\n"

"• When you see a red light up ahead,  you can engine brake and keep moving slowly forwards (without stopping) and hope that it will turn green."
      " The worst thing you can do is to approach at a high speed,  brake hard to come to a stop just before the red light and then accelerate to your original speed again after standing still.\n\n"

"🎴 Important clarification regarding eco-driving\n\n"
"• Traffic safety is always a higher priority than eco-driving. If you need to brake hard in order to avoid hitting a pedestrian,  "
      "you should never worry about engine braking to be environmentally friendly – just step on the brake!", icon: "signs/roadsigns/ecodriving.png", height: 1950),
  const Theory(title:"🎴 Fuels",  info: "🎴 Fuels – different fuel types (driving licence theory\n\n"

"🎴 Petrol\n\n"
"• Petrol is the most common fuel used in cars today.\n\n"
"• It is a fossil fuel that contributes to the greenhouse effect and climate change.\n\n"
"• The petrol sold in Sweden is of environmental class 1,  which contains less harmful substances.\n\n"
"• The octane rating indicates the flammability of the petrol. In Sweden,  you can buy petrol with the octane ratings 95,  98 and 99. 95 octane petrol is recommended for most cars.\n\n"
"🎴 Diesel\n\n"
"• Is a fossil fuel that contributes to the greenhouse effect and climate change.\n\n"
"• The only diesel sold in Sweden is of environmental class 1,  which contains less harmful substances.\n\n"
"• Diesel vehicles generally produce more dangerous particles than petrol.\n\n"
"• The emissions of a diesel engine compared to a petrol engine with a catalytic converter\n\n"
"• 2–3 times more hydrocarbons.\n\n"
"• 10–15 times more particles.\n\n"
"• Higher nitric oxide levels.\n\n"
"• A diesel car with a particle filter and a high environmental classification emits a significantly smaller amount of harmful particles.\n\n"

"🎴 Alternative fuels\n\n"
"• There are two great downsides to fossil fuels:\n\n"

"• They harm the environment.\n\n"
"• They are running out.\n\n"
"• For this reason,  new fuels are needed to replace petrol and diesel. The ideal situation would be a fuel that is "
      "environmentally friendly,  cheap and possible to produce in great volumes. There are currently several alternative fuels,  but no clear “winner” that can take over.\n\n"

"🎴 Electricity\n\n"
"• Electric cars have been on the rise in the early 2010s. They do not release any harmful substances,  and the engine noise is more or less non-existent. Electricity is also significantly cheaper than petrol.\n\n"

"• The downside of electric cars today is partly the price,  and partly that they have a shorter range than the corresponding model of petrol car. "
      "Another factor is that the electric car is only as clean as its energy source. If the electricity is produced by hydro power,  it is clean. "
      "If it comes from coal,  however,  then it is not good for the environment.\n\n"

"🎴 Ethanol (E85)\n\n"
"• Ethanol is a type of alcohol that is extracted from plants such as wheat and sugar cane (renewable sources). The shift from petrol to ethanol is relatively minor (similar technology is used).\n\n"

"• Ethanol is better for the environment than the fossil fuels,  but there are a few problems. The process of manufacturing ethanol is not environmentally friendly and when it is made with wheat,  it means that crops which could be used for food are used as fuel instead. "
      "Another downside is that the fuel cost is often the same as for petrol.\n\n"

"🎴 Natural gas\n\n"
"• The type of gas most commonly used for vehicles is CNG,  which is made either of fossil or organic fuel. How environmentally friendly the gas is depends on its source.\n\n"

"🎴 Hybrid\n\n"
"• Hybrid cars have two different energy systems. This is often both environmentally friendly and practical. If,  for example,  the hybrid car has an electrical engine and a petrol engine,  the electric engine can be used for shorter distances in built-up areas. "
      "When a longer range and more power is required,  the petrol engine takes over.\n\n"

"🎴 Environmental classifications\n\n"
"• All new cars that are sold within the EU have to fulfil certain environmental requirements. For private cars,  the following classifications apply:\n\n"

"• The Euro norm – common environmental classification for the EU. Is followed by a number. The requirements in Euro 5 are more lenient than those of Euro 6,  for example.\n\n"
"🎴 Environmental class Electric – cars running on electricity only."
"• Environmental class Hybrid – combination of electric and combustion engine.\n", icon: "signs/roadsigns/fuels.png", height: 2500),
const Theory(title:"🎴 Pollution",  info: "🎴 Pollution and harmful substances.\n\n"
"Chemical emissions.\n\n"
"🎴 Carbon dioxide (CO2)\n\n"
"• The greenhouse gas that contributes the most to the greenhouse effect and climate change.\n\n"
"• The combustion of fossil fuels like petrol diesel causes great carbon dioxide emissions.\n\n"
"🎴 Carbon monoxide (CO)\n\n"
"• Impairs the oxygen uptake in the blood.\n\n"
"• Leads to tiredness and can be life-threatening in large amounts\n\n."
"• Catalytic converters reduce carbon monoxide emissions.\n\n"
"🎴 Hydrocarbons (HC)\n\n"
"• Causes cancer.\n\n"
"• May impact on genetic material.\n\n"
"• Contributes to the formation of tropospheric ozone.\n\n"
"🎴 Nitric oxide (NOx)\n\n"
"• Contributes to the acidification of soil and eutrophication of lakes.\n\n"
"• Impacts on human genetic material and airways.\n\n"
"• Contributes to the formation of tropospheric ozone.\n\n"
"🎴 Tropospheric ozone\n\n"
"• Ozone that forms too close to the ground is harmful to plants and animals.\n\n"
"🎴 Eutrophication\n\n"
"• Eutrophication is when a lake gets too many plant nutrients (similar to us eating greasy fast food every day).\n\n"
"• This leads to harmful algal blooms and the lakes getting overgrown.\n\n"
"• The greatest causes are nitric oxide from traffic and phosphorus.\n\n"
"🎴 Acidification\n\n"
"• Acidification is when acid substances spread to an abnormally large extent.\n\n"
"• Causes damage to lakes and forests.\n\n"
"• The greatest causes are nitric oxide from traffic and phosphorus.\n\n"
"• Soot and harmful particles\n\n"
"• Common problem in cities with many cars. Affects the airways and can cause cancer.\n\n"
"🎴 Noise\n\n"
"• Disturbing car noise is a common occurrence in cities.\n\n"
"• Noise protection reduces the problems.\n\n"
"🎴 Statistics\n\n"
"• 300–2, 000 cases of cancer are caused by air pollution each year.\n\n"
"• 1.5 million people are exposed to traffic noise in their homes\n", icon: "signs/roadsigns/traffic-polution.png", height: 2000)


];
      List <_TrafficSignInfo> _symbolsInfo = const <_TrafficSignInfo>[

        //Warning signs
        const _TrafficSignInfo(title:"Dangerous left-hand bend ",
            info: "Be prepare for oncoming vehicles,  adjust your speed to suit visibility"),
        const _TrafficSignInfo(title:"Dangerous right-hand bend",
            info: "Be prepare for oncoming vehicles,  adjust your speed to suit visibility"),

        const _TrafficSignInfo(title:"Dangerous double bend,  first to the left",
            info: "If the warning relates to a section of road with more than two bends,  "
                "the length of the section is indicated by a supplementary plate."),
        const _TrafficSignInfo(title:"Dangerous double bend,  first to the right",
            info: "If the warning relates to a section of road with more than two bends, "
                " the length of the section is indicated by a supplementary plate."),

        const _TrafficSignInfo(title:"Steep hill downwards",
            info: "Braking distance will be longer.  Maybe select lower gear to save brakes in good time for oncoming traffic. "
                "The number indicates the gradient's percentage."),
        const _TrafficSignInfo(title:"Steep hill upwards",
            info: "The number indicate the percentage"),
        const _TrafficSignInfo(title:"Road narrowing on both sides",
            info: "Plan in good time for oncoming vehicle,  stop overtaking in good time"),
        const _TrafficSignInfo(title:"Road narrowing on the right",
            info: "Plan in good time for oncoming vehicle,  stop overtaking in good time"),
        const _TrafficSignInfo(title:"Road narrowing on the left",
            info: "Plan in good time for oncoming vehicle,  stop overtaking in good time"),
        const _TrafficSignInfo(title:"Opening or bridge swing",
            info: "Traffic lights be prepare to stop"),
        const _TrafficSignInfo(title:"Quayside or river bank",
            info: "Road will end by water"),
        const _TrafficSignInfo(title:"Uneven road",
            info: "Poor road grip,  risk of skidding,  longer brake distance"),

        const _TrafficSignInfo(title:"Road hump raised",
            info: "Reduce speed raised road hump"),
        const _TrafficSignInfo(title:"Road hump sunken",
            info: "Reduce speed sunken road hump"),
        const _TrafficSignInfo(title:"Slippery road",
            info: "Poor road grip,  snow and ice"),

        const _TrafficSignInfo(title:"Loose chippings",
            info: "Reduce speed when passing oncoming vehicle. Avoid overtaking"),

        const _TrafficSignInfo(title:"Risk of falling or fallen stones from the right",
            info: "The may be falling rock on the carriageway"),
        const _TrafficSignInfo(title:"Risk of falling or fallen stones from the left",
            info: "The may be falling rock on the carriageway"),
        const _TrafficSignInfo(title:"Pedestrian crossing",
            info: "You are approaching pedestrian crossing be prepare to stop"),
        const _TrafficSignInfo(title:"Pedestrian",
            info: "Watch out for pedestrian on the road"),
        const _TrafficSignInfo(title:"Children",
            info: "Children have poorer vision,  unpredictable,  they may change their minds and  difficult to detect"),
        const _TrafficSignInfo(title:"Cyclists and moped riders ",
            info: "Cyclists and moped rider II  may be on the road"),
        const _TrafficSignInfo(title:"Skier",
            info: "Warning for skier"),

        const _TrafficSignInfo(title:"Horse rider",
            info: "Be cautious anything can happen"),


        const _TrafficSignInfo(title:"Elks",
            info: "Keep a sharp lookout to the sides, reduce speed"),
        const _TrafficSignInfo(title:"Deer",
            info: "Warning for deer"),
        const _TrafficSignInfo(title:"Cattle",
            info: "Warning for cattle"),
        const _TrafficSignInfo(title:"Horse",
            info: "Warning for horse"),

        const _TrafficSignInfo(title:"Reindeer",
            info: "Warning for reindeer"),
        const _TrafficSignInfo(title:"sheep",
            info: "Warning for sheep"),
        const _TrafficSignInfo(title:"Wild boar",
            info: "Warning for boar"),
        const _TrafficSignInfo(title:"Road work",
            info: "Road work is in progress show consideration"),
        const _TrafficSignInfo(title:"Road work ends",
            info: "Warning of end of road works"),

        const _TrafficSignInfo(title:"Traffic light",
            info: "Be prepare to stop ahead"),
        const _TrafficSignInfo(title:"Traffic light to left",
            info: "Be prepare to stop ahead"),
        const _TrafficSignInfo(title:"Low flying air craft to the right",
            info: "be prepare for engine noise"),
        const _TrafficSignInfo(title:"Side wind from the right",
            info: "Be cautious if you are driving a large vehicle or trailer"),
        const _TrafficSignInfo(title:"Side wind from the left",
            info: "Be cautious if you are driving a large vehicle or trailer"),
        const _TrafficSignInfo(title:"Two way street",
            info: "Be prepare for oncoming vehicle,  one way carriage way become two way "),
        const _TrafficSignInfo(title:"Tunnel",
            info: "No stopping"),
        const _TrafficSignInfo(title:"soft verge",
            info: "warning for carriageway edge"),
        const _TrafficSignInfo(title:"Cross roads",
            info: "View block,   priority to right applies here"),
        const _TrafficSignInfo(title:"Cross road priority indicate by the thick line 1",
            info: "Used at a junctions with poor view"),
        const _TrafficSignInfo(title:"Cross road priority indicate by the thick line 2",
            info: "Used at a junctions with poor view"),
        const _TrafficSignInfo(title:"Cross road priority indicate by the thick line 3",
            info: "Used at a junctions with poor view"),
        const _TrafficSignInfo(title:"Slow moving vehicle",
            info: "Warning of slow moving vehicle"),
        const _TrafficSignInfo(title:"Roundabout",
            info: "Warning for roundabout "),
        const _TrafficSignInfo(title:"Horse drawn vehicle",
            info: "Warning for horse drawn vehicle"),
        const _TrafficSignInfo(title:"Dog drawn vehicle",
            info: "Warning for Dog drawn vehicle"),
        const _TrafficSignInfo(title:"Horse drawn vehicle 0 ",
            info: "Warning for horse drawn vehicle"),
        const _TrafficSignInfo(title:"Off road scooter traffic",
            info: "Warning for off road scooter"),
        const _TrafficSignInfo(title:"Queue likely",
            info: "Great  risk of queue forming"),
        const _TrafficSignInfo(title:"Level crossing with a barrier",
            info: "It is the train that is dangerous,  take care of your safety"),
        const _TrafficSignInfo(title:"Level crossing without a barrier",
            info: "It is the train that is dangerous,  take care of your safety"),
        const _TrafficSignInfo(title:"Junction with Tramway",
            info: "You must make a way for tram"),



        const _TrafficSignInfo(title:"Cross sign",
            info: "Single track drive in a way that you are going to stop before reaching the track"),
        const _TrafficSignInfo(title:"Accident",
            info: "Warning of accident"),
        const _TrafficSignInfo(title:"Other hazard",
            info: "Warning signs are erected to warn road users of hazard"),

//end warning signs

//Delineator post

        const _TrafficSignInfo(title:"Delineator post on the left with round reflectors",
            info: "Delineator post are often found on wider road that unlit,  they are fitted with reflectors"),
        const _TrafficSignInfo(title:"Delineator post on the right with rectangle reflectors",
            info: "Delineator post are often found on wider road that unlit,  they are fitted with reflectors"),

/*

*/
//Traffic lights
        const _TrafficSignInfo(title:"Light and light with arrows",
            info: "(Red) a red light always means stop. (Red amber) get ready to go the light will turn green soon. (Green) You may drive but take care,  "
                "(Amber yellow) stop that light may soon turn yellow"),
        const _TrafficSignInfo(title:"Flashing yellow",
            info: "(Amber yellow) stop that light may soon turn yellow"),
        const _TrafficSignInfo(title:"walking Signals",
            info: "(Red) stop,  (Green ) You may go"),
        const _TrafficSignInfo(title:"Light signals when crossing by rail",
            info: "Signals when crossing by rail"),
        const _TrafficSignInfo(title:"Signal system at mobile bridge",
            info: "Signal system at mobile bridge,  ferry,  airfield,  emergency station etc"),
        const _TrafficSignInfo(title:"bike signals",
            info: "Signal for bike"),
        const _TrafficSignInfo(title:"Public transport Signals",
            info: "Public transport Signals"),
//end of traffic
        const _TrafficSignInfo(title:"Accident",
            info: "Warning of accident"),
        const _TrafficSignInfo(title:"Other hazard",
            info: "Warning signs are erected to warn road users of hazard"),

//Road marks
        const _TrafficSignInfo(title:"(M1) Center line",
            info: "Road mark center line,  in build up areas the distance between the line may be shorter"),
        const _TrafficSignInfo(title:"Continues Line",
            info: "Road marking continue Line,  normally occurs on the carriageway with two lane on both direction"),
        const _TrafficSignInfo(title:"Center line",
            info: "Road mark center line,  in build up areas the distance between the line may be shorter"),

        const _TrafficSignInfo(title:"(M10) Center line and continue line",
            info: "Road marking center line and continue line,  indicate that view ahead is limited"),
        const _TrafficSignInfo(title:"Warning line and continue line",
            info: "Road marking continue line and blocking line,  signify advance warning of continue line or a particular hazard"),
        const _TrafficSignInfo(title:"Continue line",
            info: "Road marking center line and continue line,  normally occurs on carriageways with two-way lane on each direction,  you must not cross the line"),

        const _TrafficSignInfo(title:"Parking and stopping prohibited",
            info: "Road marking Parking and stopping,  Parking and stopping not allowed"),
        const _TrafficSignInfo(title:"(M22) Parking prohibited",
            info: "Indicate no parking or shows extent of the bus stop"),

        const _TrafficSignInfo(title:"(M21) Parking and stopping prohibited",
            info: "Road marking parking and stopping prohibited"),

//Give way sign
        const _TrafficSignInfo(title:"Give way",
            info: "Drive steadily,  give way . The the sign is erected close to the crossing as possible"),
        const _TrafficSignInfo(title:"Stop",
            info: "Mandatory to stop and give way at the junction or rail way cross"),
        const _TrafficSignInfo(title:"pedestrian",
            info: " Give way to Pedestrian,  you have a special obligation toward pedestrians"),
        const _TrafficSignInfo(title:"(B3b)Pedestrian ",
            info: "Give way to pedestrian,  you have a special obligation toward pedestrians"),
        const _TrafficSignInfo(title:"Major road",
            info: "Traffic at major road,  must give way to all traffic in the major road,  The sign is normally repeated after every junction "),

        const _TrafficSignInfo(title:"Major road end",
            info: "Warning major road end"),
        const _TrafficSignInfo(title:"Give way to oncoming vehicle",
            info: "It does not apply to small vehicle that can pass without danger"),
        const _TrafficSignInfo(title:"Priority over oncoming vehicle",
            info: "Give way priority over oncoming vehicle"),
        const _TrafficSignInfo(title:"Cycle crossing",
            info: "You have a specific obligation toward cyclist"),


        const _TrafficSignInfo(title:"No entry for vehicular",
            info: "The sign maybe curve in shape to make it easily recognizable from the rear"),
        const _TrafficSignInfo(title:"No vehicle",
            info: "Applies to all vehicles in both directions,  often qualified by supplementary plate"),
        const _TrafficSignInfo(title:"No motor vehicle other than moped class II",
            info: "No motor vehicle"),
        const _TrafficSignInfo(title:"No motor vehicle",
            info: "No motor vehicle other than two wheel vehicle"),
        const _TrafficSignInfo(title:"No motor vehicle or mopeds class I",
            info: "No motor vehicle"),
        const _TrafficSignInfo(title:"No vehicle coupled with trailer",
            info: "Does not applies to semi trailers or axel trailers"),
        const _TrafficSignInfo(title:"No heavy good vehicle",
            info: "Applies to goods vehicle with total weight exceeding 3.5 tons"),
        const _TrafficSignInfo(title:"No tractors or motorised class II",
            info: "No tractors or motorised class II"),
        const _TrafficSignInfo(title:"No vehicle carrying dangerous goods",
            info: "Vehicle with dangerous good is prohibited"),
        const _TrafficSignInfo(title:"No pedal cycles or moped class ",
            info: "Pedal cycle or moped class II may be push by hand"),
        const _TrafficSignInfo(title:"No moped class II",
            info: "Moped may be push by hand"),
        const _TrafficSignInfo(title:"No horse drawn vehicle",
            info: "Drawn vehicle  prohibited"),
        const _TrafficSignInfo(title:"No off street motor vehicle",
            info: "Off street vehicle not  prohibited"),
        const _TrafficSignInfo(title:"No horse riding",
            info: "Horse riding is prohibited"),
        const _TrafficSignInfo(title:"No pedestrian",
            info: "Pedestrian is prohibited"),
        const _TrafficSignInfo(title:"Restricted vehicle width",
            info: "The vehicle width must not exceed the number indicated"),
        const _TrafficSignInfo(title:"Restricted vehicle height",
            info: "Used when maximum head room is less than 4.5 meters "),
        const _TrafficSignInfo(title:"Restricted vehicle length",
            info: "Used in town centers"),
        const _TrafficSignInfo(title:"Minimum distance between two vehicle",
            info: "Used at at bridges or winter roads"),
        const _TrafficSignInfo(title:"Restricted gross weight",
            info: "The restriction applies to the gross weight of a vehicle"),
        const _TrafficSignInfo(title:"(C21) Restricted gross weight",
            info: "The restriction applies to the gross weight of a vehicle"),
        const _TrafficSignInfo(title:"Carriage capacity classification",
            info: "Roads are divided into three classifications based on the weight of the vehicle they can bear"),
        const _TrafficSignInfo(title:"(C22) Carriage capacity classification",
            info: "Roads are divided into three classifications based on the weight of the vehicle they can bear"),
        const _TrafficSignInfo(title:"Restricted axel load",
            info: "Restriction for vehicle axel load"),
        const _TrafficSignInfo(title:"Restricted bogie load",
            info: "A bogie is a two axel less than two meters apart"),
        const _TrafficSignInfo(title:"No turning at the junction left",
            info: "U turn is permitted"),
        const _TrafficSignInfo(title:"No turning at the junction right",
            info: "U turn is permitted"),
        const _TrafficSignInfo(title:"No u turn",
            info: "Left turn is permitted"),
        const _TrafficSignInfo(title:"No overtaking",
            info: "No overtaking for the vehicle on the left"),
        const _TrafficSignInfo(title:"No overtaking ends for the vehicle the left",
            info: "No overtaking ends after the sign"),
        const _TrafficSignInfo(title:"No overtaking by the HGVs",
            info: "No overtaking for the vehicle on the left"),
        const _TrafficSignInfo(title:"No overtaking ends for HGVs",
            info: "No overtaking for HGVs ends after the sign"),
        const _TrafficSignInfo(title:"30 KPH",
            info: "At particular risky place,  e.g by school the speed limit is 30kph "),
        const _TrafficSignInfo(title:"40 KPH",
            info: "On street in build up areas where many vulnerable road users mingle motor traffic and where there are pedestrian crossing "),
        const _TrafficSignInfo(title:"50 KPH",
            info: "Basic speed in build up areas"),
        const _TrafficSignInfo(title:"60 KPH",
            info: "On the street few junctions with no pedestrians"),
        const _TrafficSignInfo(title:"70 KPH",
            info: "Is a basic speed after build up areas"),
        const _TrafficSignInfo(title:"80 KPH",
            info: "On the road that has no central barrier or the has edge by dangerous terrains,  e.g tress,  stone"),
        const _TrafficSignInfo(title:"90 KPH",
            info: "On roads with a moderate amount of traffic and where two way traffic is normally separated with rumble in the asphalt,  the speed limit may be 90kph"),
        const _TrafficSignInfo(title:"100 KPH",
            info: "On many central barrier road the basic speed is 100 kph"),
        const _TrafficSignInfo(title:"110 KPH",
            info: "Most motorway has 110 kph as a speed limit "),
        const _TrafficSignInfo(title:"120 KPH",
            info: "On motorway with high standard of safety the speed limit is 120 kph"),
        const _TrafficSignInfo(title:"Temporary speed limit end",
            info: "The next speed limit is after the sign"),
        const _TrafficSignInfo(title:"Automatic traffic  camera surveillance",
            info: "Keep the speed limit and you  don't have to worry about the surveillance camera"),


        const _TrafficSignInfo(title:"Warnrs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Wargns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warniigns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Waigns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"ng Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"War Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Wng Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Wans",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warns",
            info: "Warning signs are erected to warn road users of hazard"),


        const _TrafficSignInfo(title:"Stop at the custom point",
            info: "custom check point"),
        const _TrafficSignInfo(title:"Warninigns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warngns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Wargns",
            info: "Warning signs are erected to warn road users of hazard"),



        const _TrafficSignInfo(title:"Tull",
            info: "Stop customs point"),
        const _TrafficSignInfo(title:"Stop for a specific purpose",
            info: "You must stop,  in case at the traffic signal,  it applies only when the traffic shows red"),
        const _TrafficSignInfo(title:"No parking",
            info: "Prohibited to park,  prohibition applies up to the next junction and applies to the side in which the sign is erected "),
        const _TrafficSignInfo(title:"No parking of vehicle on odd days",
            info: "No parking on odd days"),

        const _TrafficSignInfo(title:"No parking of vehicle on even days",
            info: "No parking on even days"),
        const _TrafficSignInfo(title:"Date parking zone",
            info: "Normally erected as an entry to control zone,  On odd days parking is prohibited on the odd side of the street and on the even days parking is prohibited on the even street"),
        const _TrafficSignInfo(title:"No parking and stopping",
            info: "The prohibition usually applies to the next junction"),
        const _TrafficSignInfo(title:"Loading area",
            info: "No parking and stopping other than specific purpose stated "),
        const _TrafficSignInfo(title:"Loading area ends",
            info: "Loading area ends,  other than specific stated"),
        const _TrafficSignInfo(title:"Turningarea",
            info: "Turning area no parking"),
        const _TrafficSignInfo(title:"Turning areaends",
            info: "Turning area ends,  other than specific stated"),
        const _TrafficSignInfo(title:"Prohibition of vehicle with stubbed tyres than moped class II",
            info: "Prohibition of vehicle with stubbed tyres"),
        const _TrafficSignInfo(title:"Loading area end",
            info: "End of loading area"),
        const _TrafficSignInfo(title:"Loading area ends",
            info: "Loading area ends,  other than specific stated"),
        const _TrafficSignInfo(title:"Loading area ends",
            info: "Loading area ends,  other than specific stated"),
        const _TrafficSignInfo(title:"Warning S",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warning Sins",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warningns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warg Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Turning area",
            info: "Turning area no parking"),
        const _TrafficSignInfo(title:"(MM2) Turning area",
            info: "Turning area no parking and no stopping"),
        const _TrafficSignInfo(title:"Turning area",
            info: "Turning area no parking and stopping"),
        const _TrafficSignInfo(title:"Turning area end for no parking and stopping",
            info: "Turning area ends,  other than specific stated"),
        const _TrafficSignInfo(title:"Prohibition of traffic with other vehicles with stubbed tyres than moped class II",
            info: "Prohibition of traffic with other vehicles with stubbed tyres"),
        const _TrafficSignInfo(title:"Wning Signs",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warnng Sign",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warning Sins",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warning igns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warning Sigpns",
            info: "Warning signs are erected to warn road users of hazard"),
        const _TrafficSignInfo(title:"Warning Sigcns",
            info: "Warning signs are erected to warn road users of hazard"),


//Mandatory  signs
        const _TrafficSignInfo(title:"Mandatory route for off-road motor vehicle and off-road trailers",
            info: "Mandatory route for off-road motor vehicle"),
        const _TrafficSignInfo(title:"Mandatory direction of travelling right",
            info: "Mandatory right"),
        const _TrafficSignInfo(title:"Mandatory direction of travelling left",
            info: "Mandatory left"),
        const _TrafficSignInfo(title:"Mandatory travel direction straight",
            info: "Mandatory straight"),
        const _TrafficSignInfo(title:"Mandatory travel direction turn right ahead",
            info: "Mandatory turn right ahead"),

        const _TrafficSignInfo(title:"Mandatory travel direction turn left ahead",
            info: "Mandatory travel turn left ahead"),
        const _TrafficSignInfo(title:"Mandatory travel direction turn straight ahead or turn right",
            info: "Mandatory travel direction straight or  turn left"),
        const _TrafficSignInfo(title:"Mandatory travel direction straight ahead or turn left",
            info: "Mandatory travel direction turn straight or right"),
        const _TrafficSignInfo(title:"Mandatory carriage way keep left or right",
            info: "mandatory keep left or right"),
        const _TrafficSignInfo(title:"Mandatory carriage way keep left",
            info: "mandatory keep left"),

        const _TrafficSignInfo(title:"Mandatory direction of travel right",
            info: "Mandatory keep right"),
        const _TrafficSignInfo(title:"Mandatory carriage way right or left",
            info: "mandatory keep left or right"),
        const _TrafficSignInfo(title:"Roundabout",
            info: "No parking"),
        const _TrafficSignInfo(title:"Mandatory footpath",
            info: "pedestrians only"),
        const _TrafficSignInfo(title:"Mandatory pedal cycle track",
            info: "Applies only for moped class II"),
        const _TrafficSignInfo(title:"Mandatory pedestrians and cyclist track",
            info: "Shared path,  applies only for moped class II"),
        const _TrafficSignInfo(title:"Mandatory divided path for pedestrians and cyclist track",
            info: "Shared path,  applies only for moped class II"),
        const _TrafficSignInfo(title:"(D13) Mandatory divided path for pedestrians and cyclist track",
            info: "Shared path,  applies only for moped class II"),
        const _TrafficSignInfo(title:"Mandatory bridal path",
            info: "Also for pedestrians"),
        const _TrafficSignInfo(title:"Mandatory direction for vehicle carrying dangerous goods",
            info: "Mandatory direction of travel for vehicle with dangerous goods,  turn left ahead"),
        const _TrafficSignInfo(title:"Mandatory carriage way for public transport",
            info: "carriage way for public transport"),
        const _TrafficSignInfo(title:"Mandatory carriage way for public transport ends",
            info: "End of mandatory carriage way for public transport lane"),


//mandatory ends
        const _TrafficSignInfo(title:"Motorway",
            info: "The motorway has two carriageway one in each directions,  the road are built with flyover,  junction and intended for high speed "),
        const _TrafficSignInfo(title:"Motor ends",
            info: "End of motorway,  prepare for oncoming vehicle "),
        const _TrafficSignInfo(title:"Clearway",
            info: "As a rule a clearway has only one carriageway with traffic in both direction "),
        const _TrafficSignInfo(title:"clearway ends",
            info: "End of clearway,  prepare for oncoming vehicle"),


        const _TrafficSignInfo(title:"Recommended lower speed",
            info: "Here often there are road humps,  it unstable to drive faster than what is indicated on the sign"),
        const _TrafficSignInfo(title:"End recommended lower speed",
            info: "Recommended speed ends"),
        const _TrafficSignInfo(title:"Home zone",
            info: "You may not drive faster than a walking speed"),
        const _TrafficSignInfo(title:"End of home zone",
            info: "Home zone ends"),
        const _TrafficSignInfo(title:"Merging lanes",
            info: "Apply the zip pattern principle with mutual consideration "),
        const _TrafficSignInfo(title:"Special rules for parking (E30)",
            info: "The panel indicates a deviation from the sign under which it is placed or from Chapter 3,  "
                "Section 53,  point 10 or Section 54 of the Road Traffic Ordinance (1998:1276)."),
        const _TrafficSignInfo(title:"One way traffic",
            info: "The sign stands parallel with the carriage way"),
        const _TrafficSignInfo(title:"Pedestrian zone",
            info: "Zone for pedestrians drive carefully"),
        const _TrafficSignInfo(title:"End of pedestrian zone",
            info: "The pedestrian zone ends"),
        const _TrafficSignInfo(title:"Build-up area",
            info: "The speed limit must be stated on separate signs"),
        const _TrafficSignInfo(title:"End of build-up areas",
            info: "The speed limit must be stated on separate signs"),
        const _TrafficSignInfo(title:"Recommended maximum speed",
            info: "Unstable at present to drive faster than the giving speed"),
        const _TrafficSignInfo(title:"Recommended maximum speed ends",
            info: "End of recommended maximum speed"),
        const _TrafficSignInfo(title:"Road charge",
            info: "Congestion charge or bridge toll"),
        const _TrafficSignInfo(title:"No through road other variant exist",
            info: "Dead end"),
        const _TrafficSignInfo(title:"Passing place",
            info: "Sign mark broadening of roadway to enable vehicles pass each other and school buses"),
        const _TrafficSignInfo(title:"Parking",
            info: "Parking place "),
        const _TrafficSignInfo(title:"Emergency",
            info: "Refuge area"),
        const _TrafficSignInfo(title:"Auto traffic surveillance camera",
            info: "Surveillance of traffic rules,  e.g seat belt,  driving ban,  driving when disqualify"),
        const _TrafficSignInfo(title:"Tunnel",
            info: "There is Tunnel at 2.0 km"),
        const _TrafficSignInfo(title:"Taxi rank",
            info: "Sign indicated far limit of the taxi rank zone"),
        const _TrafficSignInfo(title:"Entry sign to a control zone",
            info: "Entry sign to a control zone shows where the parking prohibition begins,  the prohibition is indicated on the plate,  the sign applies up to the next junction"),
        const _TrafficSignInfo(title:"End entry sign to a control zone",
            info: "End entry sign to a control zone shows where the parking prohibition ends,  the prohibition is indicated on the plate,  the sign applies up to the next junction"),
        const _TrafficSignInfo(title:"Emergency exist",
            info: "in case of emergency"),
        const _TrafficSignInfo(title:"(E29) Emergency exist",
            info: "in case of emergency"),

//Directions
        const _TrafficSignInfo(title:"Number of lane increases",
            info: "Adjust speed to suit specific situation"),
        const _TrafficSignInfo(title:"Number of lane decreases",
            info: "Adapted to suit specific situation. Apply the zip-fastener principle"),
        const _TrafficSignInfo(title:"Join slip road with accelerator lane",
            info: "Adapted to suit a specific situation"),
        const _TrafficSignInfo(title:"Lane division for section of road",
            info: "Adapted to suit a specific situation"),
        const _TrafficSignInfo(title:"Joining slip road with lane gain",
            info: "Adapted to suit a specific situation"),

        const _TrafficSignInfo(title:"Information on a lane",
            info: "Adapted to suit a specific situation"),
        const _TrafficSignInfo(title:"(I25) Information about lanes",
            info: "Certain lanes have been closed or obstacles"),
        const _TrafficSignInfo(title:"(I26) Information about lanes",
            info: "Certain lanes have been closed or obstacles"),
        const _TrafficSignInfo(title:"(I27) Information about lane",
            info: "Certain lane have been closed or obstacles"),
        const _TrafficSignInfo(title:"Map type sign when turning left is prohibited",
            info: "The sign shows which of the route to take when left turn is prohibited at next junction"),
        const _TrafficSignInfo(title:"Direction sign,  highway",
            info: "The ordinary geographical direction on public highway"),
        const _TrafficSignInfo(title:"Direction sign,  motorway and clearway signposts",
            info: "This signpost shows that you are approaching a motorway or clearway,  the sign appears on the last sign prior to the entry"),

        const _TrafficSignInfo(title:"Road sign to a local target in urban areas",
            info: "Public signposts"),

        const _TrafficSignInfo(title:"Direction sign,  private road",
            info: "The reason there is a sign indicating private road,  is because they are not strictly private. A private road is a road that "
                "is not maintained by the state or municipality,  but by a private person or association. "),
        const _TrafficSignInfo(title:"Direction sign,  local amenities",
            info: "To help you find destination such hospital,  town district etc"),
        const _TrafficSignInfo(title:"Lane assignment sign",
            info: "Map-type"),
        const _TrafficSignInfo(title:"Advance direction sign,  map-type",
            info: "Exit ahead from motorway or expressway"),
        const _TrafficSignInfo(title:"Stack-type sign with exit information",
            info: "Advance exit information,  the distance to the exit is given on the sign"),
        const _TrafficSignInfo(title:"Exist sign",
            info: "Exit sign position at the start of the exit"),
        const _TrafficSignInfo(title:"Sign for specific type of vehicle,  or a category of road users",
            info: "Other symbols may be use"),
        const _TrafficSignInfo(title:"Sign of a car",
            info: "Other symbols may be use"),

        const _TrafficSignInfo(title:"Sign bus",
            info: "Other symbols may be use"),
        const _TrafficSignInfo(title:"Sign airfield",
            info: "Other symbols may be use"),
        const _TrafficSignInfo(title:"Sign of airfield straight ahead",
            info: "Other symbols may be use"),
        const _TrafficSignInfo(title:"Sign of ferry",
            info: "Other symbols may be use"),
        const _TrafficSignInfo(title:"Place name",
            info: "Name of a place"),
        const _TrafficSignInfo(title:"Route number",
            info: "Green sign are use for European highway"),
        const _TrafficSignInfo(title:"Primary route number",
            info: "Blue signs are use for primary routes"),
        const _TrafficSignInfo(title:"Primary route number destination sign",
            info: "Destination sign to primary route"),
        const _TrafficSignInfo(title:"Permanently diverted route when normal route is closed",
            info: "E.g during an accident"),
        const _TrafficSignInfo(title:"Distance Signs",
            info: "Show distance in Kilometres"),
        const _TrafficSignInfo(title:"Junction number",
            info: "Sign state the number of the junction"),
        const _TrafficSignInfo(title:"Collective route directions",
            info: "To reach the destination inside the brace follow the direction under the brace"),
        const _TrafficSignInfo(title:"Dangerous good route",
            info: "Route for transport with dangerous goods"),
        const _TrafficSignInfo(title:"(F1a) Map-type sign",
            info: "Map-type"),
        const _TrafficSignInfo(title:"(F3)Stack-type sign",
            info: "Stack-type"),
        const _TrafficSignInfo(title:"Country border",
            info: "EU country border"),
        const _TrafficSignInfo(title:"Lane division before junction",
            info: "Adapted to suit destination"),

        const _TrafficSignInfo(title:"Park and ride",
            info: "Parking next to a public transport service in this case the underground,  other symbol may be used"),
        const _TrafficSignInfo(title:"Multi story car park",
            info: "Car park"),

        const _TrafficSignInfo(title:"(F27) Junction number",
            info: "Sign state the number of the junction"),
        const _TrafficSignInfo(title:"Direction of traffic diverted ",
            info: "Diverted traffic"),
        const _TrafficSignInfo(title:"Local ring road",
            info: "Ring road around city or town centre"),

        const _TrafficSignInfo(title:"Rescue site",
            info:"At road work for instance"),
        const _TrafficSignInfo(title:"Direction sign,  temporary events",
            info: "Use for sporting event,  etc"),
        const _TrafficSignInfo(title:"Map-type sign for diversion route",
            info: "Diversion road marking are yellow"),



        const _TrafficSignInfo(title:"Airport",
            info: "Direction sign,  information about airport"),
        const _TrafficSignInfo(title:"Post office",
            info: "Direction sign,  information about post  office"),
        const _TrafficSignInfo(title:"Emergency telephone",
            info: "Direction sign,  information about Emergency telephone"),
        const _TrafficSignInfo(title:"Radio Station",
            info: "Direction sign,  information about radio station"),
        const _TrafficSignInfo(title:"Trading area",
            info: "Direction sign,  information about trading area"),
        const _TrafficSignInfo(title:"Industrial estate",
            info: "Direction sign,  information about  Industrial area"),
        const _TrafficSignInfo(title:"Railway station",
            info: "Direction sign,  information about railway station"),
        const _TrafficSignInfo(title:"Bus station",
            info: "Direction sign,  information about bus station"),
        const _TrafficSignInfo(title:"Hospital with accident and emergency department",
            info: "Direction sign,  information about Hospital with accident and emergency department"),
        const _TrafficSignInfo(title:"Fire extinguisher",
            info: "Direction sign,  information about Hospital with accident and emergency department"),


//Direction sign for pedestrians
        const _TrafficSignInfo(title:"(F34) Direction sign",
            info: "Direction to centre of a place"),
        const _TrafficSignInfo(title:"Stack-map direction sign",
            info: "Direction sign of a stack-map"),
        const _TrafficSignInfo(title:"Place name",
            info: "Name of a place"),
        const _TrafficSignInfo(title:"(F37) Direction sign",
            info: "Direction to centre of a place with distance in kilometres"),
        const _TrafficSignInfo(title:"Cyclist route",
            info: "Route for cyclist"),



//information about services
        const _TrafficSignInfo(title:"Cottage for hire",
            info: "Direction sign for cottage for hire"),
        const _TrafficSignInfo(title:"Caravan site",
            info: "Direction sign for caravan site"),
        const _TrafficSignInfo(title:"Camping site",
            info: "Direction sign for camping site"),
        const _TrafficSignInfo(title:"Bathing beach",
            info: "Direction sign for bathing beach"),
        const _TrafficSignInfo(title:"Sign of interest",
            info: "Direction sign for sign of interest"),
        const _TrafficSignInfo(title:"Open air recreation area",
            info: "Direction sign for open air recreation area"),
        const _TrafficSignInfo(title:"Hiking trail",
            info: "Direction sign for hiking trail"),
        const _TrafficSignInfo(title:"Chair lift",
            info: "Direction sign for chair lift"),
        const _TrafficSignInfo(title:"Ski tow",
            info: "Direction sign for ski tow"),
        const _TrafficSignInfo(title:"Fish license for sale",
            info: "Direction sign for fish license for sale"),
        const _TrafficSignInfo(title:"Golf course",
            info: "Direction sign for Golf course"),
        const _TrafficSignInfo(title:"Handicraft",
            info: "Direction sign for handicraft"),
        const _TrafficSignInfo(title:"Picnic area",
            info: "Direction sign for Picnic area"),
        const _TrafficSignInfo(title:"Bed and breakfast",
            info: "Direction sign for bed and breakfast"),
        const _TrafficSignInfo(title:"Advance information about nearby services",
            info: "Direction sign for nearby services"),
        const _TrafficSignInfo(title:"Shop",
            info: "Direction for a shop"),
        const _TrafficSignInfo(title:"Fuel",
            info: "Direction sign for fuel"),
        const _TrafficSignInfo(title:"Light refreshment",
            info: "Direction sign for light refreshment"),
        const _TrafficSignInfo(title:"Toilet",
            info: "Direction sign for toilet"),
        const _TrafficSignInfo(title:"Information point",
            info: "Direction sign for information point"),

        const _TrafficSignInfo(title:"Restaurant",
            info: "Direction sign  for restaurant"),
        const _TrafficSignInfo(title:"Hotel",
            info: "Direction sign for hotel"),
        const _TrafficSignInfo(title:"Youth hostel",
            info: "Direction sign for youth hostel"),

        const _TrafficSignInfo(title:"car repairs",
            info: "Direction sign for car repairs"),

        const _TrafficSignInfo(title:"Charging station electric cars only",
            info: "Direction sign for charging station electric cars only"),
        const _TrafficSignInfo(title:"Holiday cottages for hire",
            info: "Direction sign for holiday cottages for hire"),
        const _TrafficSignInfo(title:"Vehicle gas propellant",
            info: "Direction sign for gas propellant vehicles"),
        const _TrafficSignInfo(title:"Special rule for stopping and parking",
            info: "Parking prohibited between the time stated"),
        const _TrafficSignInfo(title:"Tunnel category",
            info: "indication for tunnel category for carrying dangerous goods"),


        const _TrafficSignInfo(title:"Safe width",
            info: "indication for safe width"),
        const _TrafficSignInfo(title:"Distance to",
            info: "Supplement plate to a location"),
        const _TrafficSignInfo(title:"Time of the day",
            info: "Back or white figures without brackets refer to weekdays (Mon-Fri)."
                " Black or white figure within bracket refer to sunday or days before holidays"),
        const _TrafficSignInfo(title:"Distance to mandatory stop",
            info: "Supplement plate for mandatory stop"),
        const _TrafficSignInfo(title:"(T1A) Length of road section,  beginning ahead of the sign",
            info: "Supplement plate for length of road section"),
        const _TrafficSignInfo(title:"(T1B) Length of road section,  beginning ahead of the sign",
            info: "Supplement plate for length of road section"),
        const _TrafficSignInfo(title:"(T12) Direction ",
            info: "Supplement plate for direction adapt to suit specification"),
        const _TrafficSignInfo(title:"(T11B) Extend of rule",
            info: "Supplement plate for extend of rule both side of the sign"),
        const _TrafficSignInfo(title:"(T11C) Extend of rule",
            info: "Supplement plate for extend of rule both side of the sign"),
        const _TrafficSignInfo(title:"(T11A) Extend of rule",
            info: "Supplement plate for extend of rule both side of the sign"),
        const _TrafficSignInfo(title:"Vehicle parking spaces",
            info: "Supplement plate for vehicle parking spaces"),
        const _TrafficSignInfo(title:"Symbol plate",
            info: "Supplement plate for symbol plate,  other symbols may be used"),
        const _TrafficSignInfo(title:"Crossing where priority in the junction is indicated by broad line",
            info: "Supplement plate for Crossing,  Give way as traffic must be coming from the left"),
        const _TrafficSignInfo(title:"Charging station",
            info: "Supplement plate for Charging station for electric vehicles only"),
        const _TrafficSignInfo(title:"Special rule for parking and stopping",
            info: "Supplement plate for parking and stopping"),
        const _TrafficSignInfo(title:"Total weight",
            info: "Supplement plate for  total weight"),
        const _TrafficSignInfo(title:"(T15) Crossing where priority in the junction is indicated by broad line",
            info: "Supplement plate for Crossing,  Give way"),
        const _TrafficSignInfo(title:"Hear impaired hearing",
            info: "Supplement plate for impairment hearings"),
        const _TrafficSignInfo(title:"All road stop",
            info: "Supplement plate for all road stop,  all approaching the traffic must stoop"),
        const _TrafficSignInfo(title:"(T7A) Special rule for stopping and parking",
            info: "Supplement plate for stopping and parking. Parking is permitted during the time stated"),
        const _TrafficSignInfo(title:"Impaired vision",
            info: "Supplement plate for vision impaired, The visually impaired usually has white. A guide dog may have a white harness"),
        const _TrafficSignInfo(title:"Extent rules",
            info: "Supplement plate for extend rule,  both side of the of the sign"),
        const _TrafficSignInfo(title:"Residence",
            info: "Supplement plate for residence,  Residence with special permits may park in accordance with the special term"),
        const _TrafficSignInfo(title:"fee",
            info: "Supplement plate for fee,  Parking fee"),
        const _TrafficSignInfo(title:"Parking disc",
            info: "Supplement plate for parking disc"),
        const _TrafficSignInfo(title:"Duration of parking time permitted",
            info: "Supplement plate for duration for parking time permitted"),
        const _TrafficSignInfo(title:"(T20) Packing ticket",
            info: "Supplement plate for parking ticket,  ticket required for parking"),
        const _TrafficSignInfo(title:"Text",
            info: "Supplement plate for text that can not communicated through any other supplementary plate"),
//Central barrier
        const _TrafficSignInfo(title:"Central barrier begins",
            info: "Country road with two-way traffic becomes 1+1 road"),
        const _TrafficSignInfo(title:"Central barrier ends",
            info: "1+1 Country road becomes two-way traffic road"),
        const _TrafficSignInfo(title:"Reduction in number of lanes",
            info: "2+1 road becomes 1+1 road"),

//Central barrier ends





//Other devices for giving instruction
        const _TrafficSignInfo(title:"Marker for obstruction at side of road,  road hump etc",
            info: "Others devices,  slope down towards the side of the traffic to pass on"),
        const _TrafficSignInfo(title:"Marker for obstruction",
            info: "Others devices,  obstruction is close to carriageway"),
        const _TrafficSignInfo(title:"Exit marker",
            info: "Others devices,  dividing point between main carriageway and exit with deceleration lane"),
        const _TrafficSignInfo(title:"Chevron marker",
            info: "Others devices,  sharp deviation of route in direction of chevron"),
        const _TrafficSignInfo(title:"Illuminated amber arrows",
            info: "Others devices,  the light may either flash or fixed"),
        const _TrafficSignInfo(title:"(X3B) Marker for obstruction at side of road,  road hump etc",
            info: "Others devices,  slope down towards the side of the traffic to pass on"),
        const _TrafficSignInfo(title:"(X2B) Marker for obstruction",
            info: "Others devices,  obstruction is close to carriageway"),
        const _TrafficSignInfo(title:"(X1A) Chevron marker",
            info: "Others devices,  sharp deviation of route in direction of chevron"),
        const _TrafficSignInfo(title:"Circulation of traffic",
            info: "Others devices,  Circulation of traffic"),
        const _TrafficSignInfo(title:"Barrier",
            info: "Others devices,  completely or partially closed-off road"),
        const _TrafficSignInfo(title:"Special hazard",
            info: "The text is adapted to suit the situation,  in this case accident"),
        const _TrafficSignInfo(title:"Level crossing marker",
            info: "Others devices,  To help road users detect a level crossing"),

// Traffic officer
        const _TrafficSignInfo(title:"(X10) Stop",
            info: "Signal by traffic officers,  in darkness a red light is used"),
        const _TrafficSignInfo(title:"Drive forward",
            info: "Signal by traffic officers,  It is your turn even if you are going to turn"),
        const _TrafficSignInfo(title:"Identification mark",
            info: "Signal by traffic officers,  Identification mark"),

//Symbols

        const _TrafficSignInfo(title:"(S1) Heavy vehicle",
            info: "Used for direction sign supplement"),
        const _TrafficSignInfo(title:"(S2) Heavy vehicle",
            info: "Used for direction sign supplement"),
        const _TrafficSignInfo(title:"(S3) Heavy vehicle",
            info: "Used for direction sign supplement"),


// Police officers
        const _TrafficSignInfo(title:"(P1) Stop",
            info: "Signal by police,  Applies to those coming from the front or behind, "
                "the sign may also be giving using a hand-held stop sign"),
        const _TrafficSignInfo(title:"(P2) Stop",
            info: "Signal by police,  Applies to those coming from the front or behind, "
                "the sign may also be giving using a hand-held stop sign"),
        const _TrafficSignInfo(title:"(P3) Stop",
            info: "Signal by police,  Applies to those the lamp is facing"),
        const _TrafficSignInfo(title:"(P4) Reduce speed",
            info: "Signal by police,  reduce speed,  in darkness a signal maybe giving using white or yellow light"),


        const _TrafficSignInfo(title:"(P5) reduce speed",
            info: "Signal by police,  reduce speed,  in darkness a signal maybe giving using white or yellow light"),

        const _TrafficSignInfo(title:"(P6) reduce speed",
            info: "Signal by police,  reduce speed,  in darkness a signal maybe giving using white or yellow light"),
        const _TrafficSignInfo(title:"(P7) follow after and stay behind the police vehicle when it stops",
            info: "Signal by police,  the sign may be giving by the police with a hand-held stop sign"),
        const _TrafficSignInfo(title:"(P7) drive on the verge and stop in front of the police vehicle",
            info: "Signal by police,  the sign may be giving with alternative flashing blue and red"),
        const _TrafficSignInfo(title:"(P8) Drive forward",
            info: "Signal by police,  drive for forward"),

//Level crossing
        const _TrafficSignInfo(title:"Light and sound signal",
            info: "Alternatively flashing red light,  bell will sound and as the barrier goes down"),

        const _TrafficSignInfo(title:"Sound signal",
            info: "A bell signal as the barrier goes down"),
        const _TrafficSignInfo(title:"A barrier",
            info: "The road is closed for the passing train or tram"),
        const _TrafficSignInfo(title:"Fixed red",
            info: "The road is completely closed"),
        const _TrafficSignInfo(title:"Red cross ",
            info: "You must not drive in this lane"),
        const _TrafficSignInfo(title:"(A38A) Distance to level crossing",
            info: "Distance to the level crossing starts counting down from 3 and ends at 1"),
        const _TrafficSignInfo(title:"Cross sign one-track ",
            info: "Railway with single track"),
        const _TrafficSignInfo(title:"Cross sign multiple-track ",
            info: "Railway with more than one track"),



        const _TrafficSignInfo(title:"Warning tramway",
            info: "Light and signal is used to amplify the traffic sign,  it maybe use in combination with sound"),
        const _TrafficSignInfo(title:"(X8) Level crossing marker",
            info: "To help road users detect level crossing"),

//end of level crossing

//Tourist Attraction
        const _TrafficSignInfo(title:"(L1) Tourist route",
            info: "Direction sign for attraction tourist route"),
        const _TrafficSignInfo(title:"Tourist area",
            info: "Direction sign for attraction tourist area"),
        const _TrafficSignInfo(title:"World heritage site",
            info: "Direction sign for attraction world heritage site deign by UNESCO"),
        const _TrafficSignInfo(title:"Landmark",
            info: "Direction sign for attraction landmarks"),
//information signs
        const _TrafficSignInfo(title:"(J3) Danger high voltage",
            info: "Signal by police,  reduce speed"),
        const _TrafficSignInfo(title:"(J2) Information sign ",
            info: "winter road deicing ceases"),

//Police officer
        const _TrafficSignInfo(title:"(P65) reduce speed",
            info: "Signal by police,  reduce speed"),
        const _TrafficSignInfo(title:"(P4) Reduce speed",
            info: "Signal by police,  reduce speed"),


        const _TrafficSignInfo(title:"(P5) reduce speed",
            info: "Signal by police,  reduce speed"),

        const _TrafficSignInfo(title:"(P6) reduce speed",
            info: "Signal by police,  reduce speed"),
        const _TrafficSignInfo(title:"(P7) follow after and stay behind the police vehicle when it stops",
            info: "Signal by police,  the sign may be giving by the police with a hand-held stop sign"),
        const _TrafficSignInfo(title:"(P7) drive on the verge and stop in front of the police vehicle",
            info: "Signal by police,  the sign may be giving with alternative flashing blue and red"),
        const _TrafficSignInfo(title:"(P8) Drive forward",
            info: "Signal by police,  drive for forward"),



      ];




const List<Choice> _trafficSign = const <Choice>[
  const Choice(title:"🎴 Warning Signs", icon: Icons.warning, size: 36,
      info:"Warning signs give warning of danger and indicate what kind of warning of hazard lies ahead."
          "They are position at a distance prior to the hazard which render them most efficient,  both in "
          "daylight and in darkness. Because they warn of danger you should reduce your speed and avoid overtaking immediately after"
          "passing them. Supplement plate may indicate how far along the road the warning sign applies."),
  const Choice(title:"🎴 Give way signs", icon: Icons.change_history, size: 36,
      info: "Give way signs inform road users about give way rules"),
  const Choice(title:"🎴 Prohibitory Signs", icon: Icons.not_interested, size: 36,
      info: "A prohibition signs informs that something is forbidden,  for a example,  to show that certain type of traffic must not enter here"
          ". As a rule the prohibition normally applies from the sign to the next road junction."
          " The prohibition zone may also end with another sign cancelling the prohibition or at supplementary plate."),
  const Choice(title:"🎴 Speed Limits", icon: Icons.looks_6, size: 36, info: "Speed limit indicate the maximum "
      "permitted speed limit you allowed to drive and it applies to the point where another speed limit is erected"),
  const Choice(title:"🎴 Mandatory Signs", icon: Icons.directions_walk, size: 36, info: "Mandatory signs tells you what you must do just like the prohibited signs. They come into force"
      " at the sign and continue to apply up to the next road junction. The zone may end with another sign cancelling  the decree or a supplementary plate "
      " kind of traffic is mandatory or prohibited,  unless otherwise stated on the supplementary plate"),
 const Choice(title:"🎴 Direction Signs", icon: Icons.directions, size: 36, info: "Direction signs point a road user to a certain location. There are many direction signs and theyrr "
      "may be varying shape and appearance. "),
const Choice(title:"🎴 Direction Signs For Pedestrian And Cyclist", icon: Icons.directions, size: 36, info: "Direction signs point a road user to a certain location. There are many direction signs and they may be varying shape and appearance."),
  const Choice(title:"🎴 Direction Signs For Information About Public Establishments", icon: Icons.directions, size: 36, info: "Direction signs point a road user to a certain location. There are many direction signs and they "
      "may be varying shape and appearance."),

  const Choice(title:"🎴 Direction Signs For Information About Services", icon: Icons.directions, size: 36, info: "Direction signs point a road user to a certain location. There are many direction signs and they "
      "may be varying shape and appearance."),
  const Choice(title:"🎴 Direction Signs For Tourist Attractions", icon: Icons.directions, size: 36, info: "Direction signs point a road user to a certain location. There are many direction signs and they "
      "may be varying shape and appearance."),
  const Choice(title:"🎴 Instruction Signs", icon: Icons.call_merge, size: 36, info: "Instruction Signs tell a road user about a certain circumstance that apply at a place. Normally,  the marks apply until an end mark is set up."),
  const Choice(title:"🎴 Information Signs", icon: Icons.landscape, size: 36, info: "An Information sign informs about the accessibility and safety of a road."),
  const Choice(title:"🎴 Symbols", icon: Icons.directions_bus, size: 36, info: "The symbol boards are used on location marks and additional boards to indicate which vehicle is meant."),
  const Choice(title:"🎴 Supplementary Plates", icon: Icons.timer_10, size: 36, info: "Supplementary plates are only erected along with other traffic signs. Their function is to supplement the traffic sign above the plate"),
  const Choice(title:"🎴 Traffic Light Signs", icon: Icons.traffic, size: 36, info: "Main traffic light signals always have three colors,  the only time you "
      "can ignore traffic is when a police is directing traffic at a junction"),
  const Choice(title:"🎴 Traffic Officers", icon: Icons.pan_tool, size: 36, info: "Traffic officer gives instructions in situations such as traffic monitoring and traffic routing"),
  const Choice(title:"🎴 Police Officers", icon: Icons.local_car_wash, size: 36, info: "A police officer,  car inspector,  road transport manager or military police has the right to give"
      " signs and instructions in situations such as traffic monitoring and traffic routing."),
  const Choice(title:"🎴 Other Devices for Giving Instructions", icon: Icons.directions, size: 36, info: "Instruction sign tell road users about a certain circumstances that applies for a certain place or a certain section of the road,  the"
      " instruction normally applies to point where cancellation sign has been put up"),
  const Choice(title:"🎴 Railway Level Crossing", icon: Icons.tram, size: 36, info: "Level crossing for railway and tram"),
  const Choice(title:"🎴 Road Markings", icon: Icons.straighten, size: 36, info: "Road markings guide you as a road user. Road markings can occur in combination with signs"),
  const Choice(title:"🎴 Central Barrier Roads", icon: Icons.view_stream, size: 36, info: "Central barrier road is a road with one or two lane in each direction"),
  const Choice(title:"🎴 Delineator Posts", icon: Icons.wb_iridescent, size: 36, info: "Delineator posts are often found on wider roads that are unlit "
      "and are fitted with reflectors,  the normally white but lay-bys and exits roads they are yellow"),

];

const List<Choice> menuItems_choices = const <Choice>[
  const Choice(title: 'logo',  icon: Icons.directions_car, size: 15),
  const Choice(title: 'settings',  icon: Icons.settings_applications, size: 26),
  const Choice(title: 'Backspace',  icon: Icons.arrow_back_ios, size: 20),

  const Choice(title: 'Sign In',  icon: Icons.directions_boat, size: 15),
  const Choice(title: 'Register',  icon: Icons.directions_bus, size: 15),
  const Choice(title: 'Help',  icon: Icons.directions_railway, size: 15),
  const Choice(title: 'About',  icon: Icons.directions_walk, size: 15),

];
const List<Choice> _tab_choices = const <Choice>[
  const Choice(title:"Road Signs", icon: Icons.directions, size: 15),
  const Choice(title:"Theory", icon: Icons.book, size: 15),
  const Choice(title:"Final Test", icon: Icons.rate_review, size: 15),

];

const List<Choice> _tab_choices_bottom = const <Choice>[
  const Choice(title:"🎴 Tutor", icon: Icons.hot_tub, size: 15),
  const Choice(title:"🎴 Comments", icon: Icons.comment, size: 15),
];


main() {
  runApp(new _View());
}
