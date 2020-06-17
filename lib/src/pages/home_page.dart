import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  final PeliculasProvider peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSwiper()
          ],
        ),
      )
    );
  }

  Widget _crearSwiper(){
    return FutureBuilder(
      future:peliculasProvider.getEnCines(),
      builder:(BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data);
        }else{
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child:CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }
}