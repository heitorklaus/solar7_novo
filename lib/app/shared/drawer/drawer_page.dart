import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../responsive/constants.dart';
import '../responsive/responsive_layout.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Configurações", icon: Icons.settings),
  ButtonsInfo(title: "Notificações", icon: Icons.notifications),
  ButtonsInfo(title: "Clientes", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Orçamentos/Leads", icon: Icons.sell),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonsInfo(title: "", icon: Icons.verified_user),
  ButtonsInfo(title: "Usuarios", icon: Icons.supervised_user_circle_rounded),
];

class DrawerPage extends StatefulWidget {
  SuggestionSelectionCallback<String> onSelect;

  DrawerPage({Key? key, required this.onSelect}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String page = '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding * 4),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                      )
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                          if (_buttonNames[index].title == 'Configurações') {
                            Scaffold.of(context).openEndDrawer();
                            // Modular.to
                            //     .pushNamed('/configuracoes')
                            //     .then((value) {
                            //   // store.getLista('');

                            //   if (value == '/itens_das_usinas') {
                            //     widget.onSelect((page = '$value'));
                            //   }
                            // });
                            Modular.to.pushNamed('/configuracoes',
                                arguments: {'pagina': '/configuracoes'});
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
