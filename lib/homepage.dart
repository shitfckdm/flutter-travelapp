
import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome, Muslih!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'NIM: 232101042',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Gambar utama (dari internet)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Kolom pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari destinasi, hotel, atau aktivitas...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Booking (Hotel, Pesawat, Kegiatan)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookingButton(Icons.hotel, "Hotel"),
                _buildBookingButton(Icons.flight, "Pesawat"),
                _buildBookingButton(Icons.hiking, "Kegiatan"),
                _buildBookingButton(Icons.bus_alert_outlined, "Bus"),
                _buildBookingButton(Icons.train, "Kereta Api"),
              ],
            ),

            const SizedBox(height: 24),

            // Judul 
            const Text(
              "Ulasan Destinasi Populer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Kartu review pertama
            _buildReviewCard(
              imageUrl: "assets/cabin.jpg", // Gambar lokal
              title: "Curug Tilu",
              rating: 4.8,
              review: "Tempat yang menenangkan, cocok untuk liburan keluarga dengan nuansa alami!",
            ),

            // Kartu review kedua
            _buildReviewCard(
              imageUrl: "assets/valley.jpeg", // Gambar lokal
              title: "Ciwidey Valley Resort",
              rating: 4.7,
              review: "Resort mewah deengan view kebun teh!",
            ),
          ],
        ),
      ),
    );
  }

  // Widget tombol booking
  Widget _buildBookingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  // Widget kartu review
  Widget _buildReviewCard({
    required String imageUrl,
    required String title,
    required double rating,
    required String review,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Gambar lokal dari assets
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),

          // Isi teks ulasan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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