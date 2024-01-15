import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Diego'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int factor = 1;
  int _counter = 0;
  int _paginaSeleccionada = 0;
  String imagen = 'assets/images/HojaVerde2.jpg';

  void _cambiarIncremento(String value) {
    setState(() {
      factor = int.parse(value);
    });
  }

  void _cambioDePagina(int newIdex) {
    setState(() {
      _paginaSeleccionada = newIdex;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + factor;
    });
  }

  void _limpiarContador() {
    setState(() {
      _counter = 0;
      factor = 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = _counter - factor;
    });
  }

  void _cambiarImagenVerde() {
    setState(() {
      imagen = 'assets/images/HojaVerde2.jpg';
    });
  }

  void _cambiarImagenAmarilla() {
    setState(() {
      imagen = 'assets/images/HojaAmarilla.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$imagen'), // Ruta de la imagen
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white.withAlpha(60),
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: FilledButton(
                      onPressed: _decrementCounter,
                      child: const Text('-',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ))),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: _limpiarContador,
                    child: const Text('Limpiar',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: FilledButton(
                      onPressed: _incrementCounter,
                      child: const Text('+',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        10.0), // Radio de esquinas redondas
                  ),
                  child: Text('Factor Actual: $factor',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$imagen'), // Ruta de la imagen
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(15.0),
        child: PanelConfiguracion(cambiarIncremento: _cambiarIncremento),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.transparent,
      body: pages[_paginaSeleccionada],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Contador',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
        backgroundColor: Colors.transparent,
        currentIndex: _paginaSeleccionada,
        onTap: _cambioDePagina,
      ),
      floatingActionButton: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _cambiarImagenVerde,
            tooltip: 'Increment',
            child: Container(
              width: 56.0, // Ancho del botón
              height: 56.0, // Alto del botón
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              child: Image.asset(
                'assets/images/HojaVerde.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          FloatingActionButton(
              onPressed: _cambiarImagenAmarilla,
              tooltip: 'Decrement',
              child: Container(
                width: 56.0, // Ancho del botón
                height: 56.0, // Alto del botón
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Image.asset(
                  'assets/images/HojaAmarilla.jpg',
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
