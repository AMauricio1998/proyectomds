import 'package:escaner/src/pages/direcciones_page.dart';
import 'package:escaner/src/pages/mapas_page.dart';
import 'package:flutter/material.dart';


// import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: () {},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearbottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.filter_center_focus ),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
        ),
    );
  }

  _scanQR() async {
    // https://fernando-herrera.com
    // geo:40.724233047051705,-74.00731459101564
      String futureString = '';
      // try {
      //   futureString = await BarcodeScanner.scan();
      // } catch(e) {
      //   futureString = e.toString();
      // }
      // print ('Future String: $futureString');
      //  if ( futureString != null ){
      //    print('tenemos informacion');
      //  }
  }


  Widget _callPage ( int paginaActual ) {

    switch( paginaActual ) {

      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default:
        return MapasPage();
    }
  }

  Widget _crearbottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          title: Text('Mapas')
          ),
          BottomNavigationBarItem(
          icon: Icon( Icons.brightness_5 ),
          title: Text('Direcciones')
          ),
      ],
    );
  }
}