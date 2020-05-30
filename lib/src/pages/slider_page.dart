import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _bloquearChek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
        
      ),
    );
  }

  Widget _crearSlider(){
    return Slider(
      activeColor: Colors.indigoAccent,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearChek ) ? null : (valor){
        setState(() {
          if (!_bloquearChek)
            _valorSlider = valor;
        });
      },
    );
  }

Widget _checkBox(){
  return Checkbox(
    value: _bloquearChek,
    onChanged: (value){
      setState(() {
        _bloquearChek = value;
      });
    },
  );
}

 Widget _crearImagen(){
   return Image(
     image: NetworkImage('https://i.ytimg.com/vi/-SE2WueAV9A/maxresdefault.jpg'),
     width: _valorSlider,
     fit: BoxFit.contain,
   );
  }

}