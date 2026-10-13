import 'package:flutter/material.dart';
import '../models/travel_spot.dart';

class DetailScreen extends StatefulWidget {
  final TravelSpot spot;

  const DetailScreen({super.key, required this.spot});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.spot.id,
                child: Image.network(
                  widget.spot.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.spot.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isFavorite ? 'Añadido a favoritos' : 'Eliminado de favoritos',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    widget.spot.location,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoItem(Icons.star, 'Calificación', widget.spot.rating.toString()),
                      _buildInfoItem(Icons.access_time, 'Duración', widget.spot.duration),
                      _buildInfoItem(Icons.attach_money, 'Precio', widget.spot.price),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Acerca del destino',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.spot.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Guardar la reserva en la lista global si no existe ya
                        if (!userReservations.any((spot) => spot.id == widget.spot.id)) {
                          userReservations.add(widget.spot);
                        }
                        
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('¡Reserva Exitosa!'),
                            content: Text('Has agendado tu viaje a ${widget.spot.title}. Puedes ver tus detalles en tu Perfil.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Reservar Ahora',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}