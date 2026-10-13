import 'package:flutter/material.dart';
import '../models/travel_spot.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showReservationsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mis Viajes Agendados',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: userReservations.isEmpty
                        ? const Center(
                            child: Text(
                              'No tienes viajes agendados aún.',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            itemCount: userReservations.length,
                            itemBuilder: (context, index) {
                              final spot = userReservations[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      spot.imageUrl,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    spot.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('${spot.location} • ${spot.duration}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        userReservations.removeAt(index);
                                      });
                                      setModalState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Eduardo Becerra ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'viajero@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.card_travel, color: Colors.teal),
                    title: const Text('Mis Viajes Reservados'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (userReservations.isNotEmpty)
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.teal,
                            child: Text(
                              '${userReservations.length}',
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                    onTap: () => _showReservationsModal(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.teal),
                    title: const Text('Destinos Visitados'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.payment, color: Colors.teal),
                    title: const Text('Métodos de Pago'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar Sesión', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sesión cerrada correctamente')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}