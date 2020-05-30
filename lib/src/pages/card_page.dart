import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards '),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cartdTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          _cartdTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          _cartdTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          _cartdTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          _cartdTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
        ],
      ),
    );
  }

  Widget _cartdTipoUno() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Tarjeta tipo uno'),
            subtitle: Text('Aqui la descripcion'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            FlatButton (
                child: Text('Cancelar'),
                onPressed: null,
              ),
            FlatButton (
              child: Text('Ok'),
              onPressed: null,
            )
            ],
          )
        ],
      )
    );
  }

  Widget _cardTipoDos() {
    
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://www.nationalgeographic.com/content/dam/travel/rights-exempt/2019-travel-photo-contest/epic-landscapes/2019-travel-photo-contest-epic-landscapes031.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
          ),

          Container(
            child: Text('text'),
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
}