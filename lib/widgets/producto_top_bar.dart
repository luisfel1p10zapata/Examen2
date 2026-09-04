import 'package:flutter/material.dart';

class ProductoTopBar extends StatelessWidget {
  final bool favorito;
  final VoidCallback onRegresar;
  final VoidCallback onFavorito;

  const ProductoTopBar({
    super.key,
    required this.favorito,
    required this.onRegresar,
    required this.onFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      color: Colors.white,
      child: Row(
        children: [
          // BOTÓN REGRESAR
          IconButton(
            onPressed: onRegresar,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 21,
              color: Color(0xFF5B514E),
            ),
          ),

          const Spacer(),

          // BOTÓN COMPARTIR
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              size: 23,
              color: Color(0xFF5B514E),
            ),
          ),

          // BOTÓN FAVORITO
          IconButton(
            onPressed: onFavorito,
            icon: Icon(
              favorito ? Icons.favorite : Icons.favorite_border,
              size: 25,
              color: const Color(0xFFE91E63),
            ),
          ),
        ],
      ),
    );
  }
}