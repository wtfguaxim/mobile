import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Color.fromARGB(255, 191, 234, 223),
          title: const Text(
            'Flutter é divertido!',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 300,
            width: 300,
            child: const Text(
              'Flutter foi criado pelo google, usa a linguagem DART',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'arial',
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: const Icon(Icons.add),
          backgroundColor: Colors.white,
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Negocios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
        ]),
      // ignore: prefer_const_constructors
      drawer:  Drawer(
        backgroundColor: Colors.white,

        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const DrawerHeader(
              decoration:BoxDecoration(color:Colors.black), 
              child: Text(
                'Menu App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,

                ),
              ),
              
            ),
            ListTile(
              leading: const Icon(Icons.home),
              // ignore: prefer_const_constructors
              title: Text('Pagina Inicial'),
              onTap: () {},
              
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              // ignore: prefer_const_constructors
              title: Text('confuguraçoes'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.circle),
              // ignore: prefer_const_constructors
              title: Text('perfil'),
              onTap: () {},
            ),
          ],

        ),
      ),
      ),
    );
  }
}

