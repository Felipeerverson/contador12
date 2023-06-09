import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;


  void decrement() {
    setState(() {
      count --;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count ++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imagens/comida-dof-2.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull? 'lotado' : 'Pode Entrar',
                style:  TextStyle(
                  fontSize: 30,
                  color: isFull? Colors.red : Colors.green,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child:  Text(
                  count.toString(),
                  style:  TextStyle(
                    fontSize: 100,
                    color: isFull? Colors.red : Colors.green,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty? Colors.white.withOpacity(0.2):
                        Colors.greenAccent,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.green,fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40,),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull? Colors.white.withOpacity(0.2): Colors.greenAccent,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}


