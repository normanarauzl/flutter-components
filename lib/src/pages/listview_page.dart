import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {


  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();

  @override
  void initState() {
    super.initState();
    _agregarImagenes();
    _scrollController.addListener(() { 
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas component')
      ),
      body: Stack(
       children: <Widget>[
          _crearLista(context),
          _crearLoading()
       ],
      )
      
    );
  }

  Widget _crearLista(BuildContext context) {

    return RefreshIndicator(
          onRefresh: obtenerPagina,
          child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (context, int index){
            final indexImage = _listaNumeros[index];
            try {
                  return _crearCard(indexImage);
              } catch (e) {
                print(e.toString());
              }
        },
      ),
    );
  }


  Widget _crearCard(int indexImage){
    SizedBox(height: 30.0);
    final card = Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$indexImage'),
            placeholder: AssetImage('assets/original.gif'),
            height: 200.0,
            fit: BoxFit.cover
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              FlatButton (
                  child: Icon(Icons.favorite, color: Colors.red),
                  onPressed: null,
                )]
            ),
            padding: EdgeInsets.all(5.0),
            )
        ],
      ),
    );

    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card
      ),
    );
  }


  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds : 1);
    Timer(duration, (){
      _listaNumeros.clear();
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }

  void _agregarImagenes()
  {
    for (var i = 1; i < 10; i++) {
        var random = new Random();
        int imagen = random.nextInt(100);
        _listaNumeros.add(imagen);
    }
    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 1);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250)
    );

    _agregarImagenes();

  }

  Widget _crearLoading(){
    if (_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox( height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

}