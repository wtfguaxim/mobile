// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors, duplicate_ignore

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});
  final String title;
  @override
  State<Principal> createState() => _PrincipalEstado();
}

class _PrincipalEstado extends State<Principal> {
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxp06mJCnDcMvYSs26zKOHe4Br5-NLjB85yw6xJLJxLsEZ3Jw-3-KZbY9OeeMlfOTOq6I&usqp=CAU"),
    radius: 150,
  );
  final nome = const Text(
    'lorenna',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );
  final obs = const Text(
    'programador full stack',
    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
    textAlign: TextAlign.center,
  );
  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      // ignore: unused_local_variable
      launchUrl(Uri(
        scheme: 'malito',
        path: 'lorenna.3902@aluno.pr.senac.br',
        queryParameters: {
          'subject': 'assunto do Email',
          'body': 'corpo do Email',
        },
      ));
    },
  );
  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
      scheme: 'tel',
     path : '44997649562',
      ),
      );
    },
  );
   final sms = IconButton(
    icon: const Icon(Icons.sms),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
      scheme: 'sms',
     path : '44997649562',
      ),
      );
    },
  );
  final site = IconButton(
    icon: const Icon(Icons.open_in_browser),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri.parse(
      'https://www.linkedin.com/in/lorenna-do-nascimento-719366281/'
      ),
      );
    },
  );
  final whatsApp = IconButton(
    icon: const Icon(Icons.wechat),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri.parse(
      'https://web.whatsapp.com/'
      ),
      );
    },
  );
  final mapa = IconButton(
    icon: const Icon(Icons.map),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri.parse(
      'https://www.google.com.br/maps/place/R.+José+dos+Santos+Píres,+113+-+Nova+Londrina,+PR,+87970-000/@-22.7632785,-52.9877164,17z/data=!4m5!3m4!1s0x948d97693f860f2d:0xf0dd5af211af0571!8m2!3d-22.7620419!4d-52.9852166?entry=ttu'
      ),
      );
    },
  );
  @override
  // ignore: avoid_types_as_parameter_names
  Widget build(BuildContext) {
    // ignore: duplicate_ignore
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'aplicativo de contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 136, 167, 220),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      // ignore: prefer_const_constructors
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            foto,
            nome,
            obs,
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                email,telefone,site, whatsApp, mapa,
           
          
              ],
            )
          ]),
    );
  }
}
