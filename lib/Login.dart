import 'package:chemical_stock/Menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chemical Stock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 133, 237, 136),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 133, 237, 136),
                height: 200, //altura da caixinha branca
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 50,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 500, //altura caixa branca
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height:
                            75), //distancia das caixinhas ate a palavra login
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      height: 50, // Ajuste a altura do campo de e-mail aqui
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.17),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.25)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'CPF',
                          labelText: 'CPF',
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.35)),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      height: 50, // Ajuste a altura do campo de senha aqui
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.17),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.25)),
                      ),
                      child: TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          labelText: 'Senha',
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.35)),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black.withOpacity(
                                  0.3), // Definindo a cor do ícone com opacidade reduzida
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //container para colocar botao em "esqueceu senha"
                      height: 60,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          'Esqueceu sua Senha?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.green, fontSize: 15.6),
                        ),
                        onPressed: () {
                          //Navigator.push(
                          //context,
                          //MaterialPageRoute(builder: (context) => resetSenha()),
                          //);
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navega para a página de login quando o botão é pressionado
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Menu()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Altere para a cor desejada
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.36,
                            50), // Defina a largura e a altura desejadas
                      ),
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(color: Colors.white),
                      ), // Texto do botão
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: kToolbarHeight -
                65, // Adiciona a distância do topo igual à altura da AppBar menos um valor adicional (20)
            left: 0,
            right: 0, // Centraliza horizontalmente
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Alinha os elementos do Row no centro horizontalmente
              children: [
                const Text(
                  'Chemical',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold), // Adiciona a fonte mais grossa
                ),
                Text(
                  'Stock',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.green.shade300,
                      fontWeight:
                          FontWeight.bold), // Adiciona a fonte mais grossa
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
