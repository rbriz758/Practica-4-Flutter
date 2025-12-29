// lib/detail_view.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/item.dart';

class DetailView extends StatelessWidget {
  final Item item;

  const DetailView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoSlab',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: item.id,
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[900],
                          child: const Center(child: Icon(Icons.broken_image, size: 48, color: Colors.white54)),
                        );
                      },
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black87,
                        ],
                        stops: [0.6, 0.85, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (item.year != null) ...[
                        Text('${item.year}', style: const TextStyle(color: Colors.white70)),
                        const SizedBox(width: 12),
                      ],
                      if (item.duration != null) ...[
                        const Icon(Icons.access_time, size: 16, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(item.duration!, style: const TextStyle(color: Colors.white70)),
                        const SizedBox(width: 12),
                      ],
                      if (item.rating != null) ...[
                        const FaIcon(FontAwesomeIcons.solidStar, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('${item.rating}', style: const TextStyle(color: Colors.white70)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (item.genre != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
                          ),
                          child: Text(
                            item.genre!,
                            style: const TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      const SizedBox(width: 16),
                      if (item.director != null)
                        Expanded(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.white70),
                              children: [
                                const TextSpan(text: 'Dir: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: item.director),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Sinopsis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Volver a la lista'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
