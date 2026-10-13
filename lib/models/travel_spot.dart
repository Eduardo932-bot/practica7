class TravelSpot {
  final String id;
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;
  final String price;
  final String duration;

  TravelSpot({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.duration,
  });
}

// Lista global para almacenar las reservas agendadas en tiempo de ejecución
List<TravelSpot> userReservations = [];

// Mock Data (Datos ficticios)
final List<TravelSpot> dummySpots = [
  TravelSpot(
    id: '1',
    title: 'Kioto Tradicional',
    location: 'Japón',
    description: 'Explora los hermosos templos budistas, los tranquilos jardines zen y los tradicionales bosques de bambú en el corazón de Japón.',
    imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=800&q=80',
    rating: 4.8,
    price: '\$1,200 USD',
    duration: '5 días',
  ),
  TravelSpot(
    id: '2',
    title: 'Santorini Mágico',
    location: 'Grecia',
    description: 'Disfruta de puestas de sol inolvidables, arquitectura blanca con cúpulas azules y vistas impresionantes al Mar Egeo.',
    imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?auto=format&fit=crop&w=800&q=80',
    rating: 4.9,
    price: '\$1,500 USD',
    duration: '4 días',
  ),
  TravelSpot(
    id: '3',
    title: 'Machu Picchu',
    location: 'Perú',
    description: 'Una de las maravillas del mundo moderno. Sumérgete en la historia del imperio inca rodeado de imponentes montañas andinas.',
    imageUrl: 'https://images.unsplash.com/photo-1526392060635-9d6019884377?auto=format&fit=crop&w=800&q=80',
    rating: 4.7,
    price: '\$900 USD',
    duration: '3 días',
  ),
  TravelSpot(
    id: '4',
    title: 'Alpes Suizos',
    location: 'Suiza',
    description: 'Paisajes alpinos de ensueño, ideales para practicar senderismo en verano o disfrutar de la nieve y el esquí en invierno.',
    imageUrl: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?auto=format&fit=crop&w=800&q=80',
    rating: 4.9,
    price: '\$1,800 USD',
    duration: '6 días',
  ),
];