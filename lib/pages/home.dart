import 'dart:async';
import 'package:atlas/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentBottomSheetController _bottomSheetController; // <------ Instance variable
  final _homePageScaffoldKey = GlobalKey<ScaffoldState>();

  Completer<GoogleMapController> _controller = Completer();

  LocationData currentLocation ;

  var location = new Location();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final CameraPosition _qlicue = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-6.7708897, 39.2261339),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);



  @override
  void initState() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homePageScaffoldKey,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _goToCurrentLocation();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        child: Icon(Icons.search),
      ),
    );
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.search),
//      ),
//    );

  }



  Future<void> _goToCurrentLocation() async {
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('ERROR -XXX- ${e.code}');
        //error = 'Permission denied';
      }
      currentLocation = null;
    }
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(currentLocation.latitude,currentLocation.longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)
    ));


  }

int rate = 4;


  void _openBottomSheet() {
    _bottomSheetController =  _homePageScaffoldKey.currentState.showBottomSheet((context){

       return Container(
         height: 420.0,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
              child: Text('Technicians:', style: TextStyle(fontSize: 18.0),),
            ),
            Wrap(
              children: <Widget>[
                Text('Filters:', style: TextStyle(fontSize: 14.0),),
                Row(

                  children: <Widget>[
                    Container(width: 8.0,),
                    Text('Rate'),
                    SizedBox(width: 10,),
                    DropdownButton(
                      value: rate,
                      items: [
                        DropdownMenuItem(child: Text('5'), value: 5),
                        DropdownMenuItem(child: Text('4'), value: 4),
                        DropdownMenuItem(child: Text('3'), value: 3),
                        DropdownMenuItem(child: Text('2'), value: 2),
                        DropdownMenuItem(child: Text('1'), value: 1),
                      ],
                      onChanged: (value){
                        _bottomSheetController.setState(() {
                          rate = value;
                        });

                      },
                    )

                  ],
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  childAspectRatio: 5,
                  padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 2.0) ,
                  children:_technicians()
              ),
            ),
          ],
      ),
       );
    },);

  }

  void _bottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                child: Text('Technicians:', style: TextStyle(fontSize: 18.0),),
              ),
              Wrap(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Rate'),
                      DropdownButton(
                        value: rate,
                        items: [
                          DropdownMenuItem(child: Text('5'), value: 5),
                          DropdownMenuItem(child: Text('4'), value: 4),
                          DropdownMenuItem(child: Text('3'), value: 3),
                          DropdownMenuItem(child: Text('2'), value: 2),
                          DropdownMenuItem(child: Text('1'), value: 1),
                        ],
                        onChanged: (value){
                          _homePageScaffoldKey.currentState.setState(() {
                            rate = value;
                          });

                        },
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                    padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 2.0) ,
                    // Generate 100 widgets that display their index in the List.
                    children:_technicians()
                ),
              ),
            ],
          );
        }
    );
  }

  List<Widget> _technicians(){
    List<Widget> children = [];
    technicians.forEach((String tech){
      children.add(ListTile(
        leading: Icon(Icons.photo_album),
        title: Text(tech),
        onTap: (){
          setState(() {

          });
        },
      ));
    });
    return children;
  }


}
