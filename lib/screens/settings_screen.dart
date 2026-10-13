import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Preferencias de la App',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text('Notificaciones Push'),
            subtitle: const Text('Recibe alertas de ofertas y recordatorios'),
            secondary: const Icon(Icons.notifications, color: Colors.teal),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            subtitle: const Text('Cambiar la apariencia visual'),
            secondary: const Icon(Icons.dark_mode, color: Colors.teal),
            value: darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                darkModeEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tema cambiado (modo visual)')),
              );
            },
          ),
          const Divider(height: 30),
          const Text(
            'General',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: const Text('Idioma'),
            trailing: const Text('Español', style: TextStyle(color: Colors.grey)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.teal),
            title: const Text('Acerca de la Aplicación'),
            subtitle: const Text('Versión 1.0.0 Pro W'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Guía de Viajes W',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2026 W Corp.',
              );
            },
          ),
        ],
      ),
    );
  }
}