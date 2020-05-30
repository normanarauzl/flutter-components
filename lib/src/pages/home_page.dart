import 'package:app_demo/src/providers/menu_provider.dart';
import 'package:app_demo/src/utils/icono_string.dart';
import 'package:flutter/material.dart';

import 'alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes flutter'),
      ),
      body: _lista(),
          );
        }
      
      Widget _lista() {


        return FutureBuilder(
          future: menuProvider.cargarData(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

              return ListView(
                children: _listaItems(snapshot.data, context),
              );

          },
        );
      }
            
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    if (data == null) {return [];}

    data.forEach((opt) {
        final temp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.brown),
          onTap: (){
            Navigator.pushNamed(context, opt['ruta']);
          },
        );

        opciones..add(temp)
                ..add(Divider());
     });

     return opciones;
  }

      
}