import 'package:flutter/material.dart';
import 'MyBarChart.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget _buildMenu() {
    return Container(
      width: 200,
      height: 700,
      decoration: BoxDecoration(
        color: const Color(0xFFA3FA66),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo_chemical.jpg',
              width: 150,
            ),
          ),
          const SizedBox(height: 40),
          _buildMenuItem(context, 'Dashboards', icon: Icons.dashboard),
          const SizedBox(height: 10),
          _buildMenuItem(context, 'Cadastros', icon: Icons.add),
          const SizedBox(height: 10),
          _buildMenuItem(context, 'Listas', icon: Icons.list),
          const SizedBox(height: 10),
          _buildMenuItem(context, 'Perfil', icon: Icons.person),
          const SizedBox(height: 10),
          _buildMenuItem(context, 'Notificações', icon: Icons.notification_add),
          const SizedBox(height: 10),
          _buildMenuItem(context, 'Sair', icon: Icons.power_settings_new),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.black87) : null,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você selecionou: $title')),
        );
      },
    );
  }

  Widget _buildRectangle(String text, {double width = 20, double height = 20}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFA3FA66),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
            child: _buildMenu(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Seus KPIs críticos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRectangle('20L\nTotal de resíduos',
                          width: 150, height: 80),
                      const SizedBox(width: 30),
                      _buildRectangle('20L\nTotal de resíduos',
                          width: 150, height: 80),
                      const SizedBox(width: 30),
                      _buildRectangle('20L\nTotal de resíduos',
                          width: 150, height: 80),
                      const SizedBox(width: 30),
                      _buildRectangle('20L\nTotal de resíduos',
                          width: 150, height: 80),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200, // Altura desejada da caixa branca
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Análises em andamento',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Últimos 7 dias',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                            height: 10,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Determinação de Naftaleno e β-Naftol',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            5), // Espaçamento entre as linhas
                                    Text(
                                      'Caracterização de Antocianina',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
