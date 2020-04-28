import 'package:flutter/material.dart';
import 'settings_list.dart';
import 'settings_section.dart';
import 'languages_screen.dart';
import 'settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opciones')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Cambios',
            tiles: [
              SettingsTile(
                title: 'Lenguaje',
                subtitle: 'Español',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                  title: 'Entorno',
                  subtitle: 'Tecnologia',
                  leading: Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
            title: 'Cuenta',
            tiles: [
              SettingsTile(title: 'Numero de Telefono', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Correo Electronico', leading: Icon(Icons.email)),
              SettingsTile(title: 'Cerrar sesion', leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: 'Busqueda',
            tiles: [
              SettingsTile.switchTile(
                title: 'Todas las marcas',
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Mostrar solo opciones  compatibles',
                  leading: Icon(Icons.fingerprint),
                  onToggle: (bool value) {},
                  switchValue: false),
              SettingsTile.switchTile(
                title: 'Cualquir precio',
                leading: Icon(Icons.lock),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: '....',
            tiles: [
              SettingsTile(
                  title: 'Accesorios', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Descuentos',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
}
