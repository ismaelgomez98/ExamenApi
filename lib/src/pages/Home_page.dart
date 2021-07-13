import 'package:exame_api/src/providers/cerveza_state.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final cervezaState = Get.put(CervezaState());
    cervezaState.obtenerCervezas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('MENU DE CERVEZAS ',
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.red)),
      ),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<CervezaState>(builder: (CervezaState cervezaState) {
              return GridView.builder(
                itemCount: cervezaState.cerveza.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int i) {
                  // ignore: unused_local_variable
                  final _cerveza = cervezaState.cerveza[i];
                  return Container(
                    child: Stack(
                      children: [
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.black,
                            child: Container(
                                child: Stack(
                              children: [
                                Positioned(
                                  right: -80.0,
                                  bottom: -60.0,
                                  child: Opacity(
                                      opacity: 0.9,
                                      child: Image.asset(
                                        'assets/bar.jpg',
                                        height: 350.0,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '   Nombre:               Reseña:             Descripcion:',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                    Text(_cerveza.name,
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    Text(_cerveza.tagline,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(_cerveza.description,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ),
                        Positioned(
                            bottom: 1.0,
                            right: 1.0,
                            child: Container(
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                height: 250.0,
                                placeholder: AssetImage('assets/cargando.gif'),
                                image: NetworkImage(_cerveza.imageUrl),
                              ),
                            ))
                      ],
                    ),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
