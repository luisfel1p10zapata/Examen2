import 'package:flutter/material.dart';

class ProductoImagen extends StatelessWidget {

  final String imagen;

  const ProductoImagen({
    super.key,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        // ------------------------------------------------------
        // IMAGEN
        // ------------------------------------------------------

        Container(

          width: double.infinity,

          height: 347,

          color:
              const Color(0xFFB63B0E),

          child: Image.asset(

            imagen,

            fit: BoxFit.cover,

            errorBuilder:
                (context, error, stackTrace) {

              return const Center(

                child: Icon(
                  Icons.image_outlined,
                  size: 70,
                  color: Colors.white,
                ),

              );

            },

          ),

        ),

        // ------------------------------------------------------
        // INDICADORES
        // ------------------------------------------------------

        Container(

          height: 28,

          color: Colors.white,

          child: Row(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              _crearIndicador(
                activo: true,
              ),

              _crearIndicador(
                activo: false,
              ),

              _crearIndicador(
                activo: false,
              ),

            ],

          ),

        ),

      ],

    );
  }

  Widget _crearIndicador({
    required bool activo,
  }) {

    return Container(

      margin:
          const EdgeInsets.symmetric(
        horizontal: 4,
      ),

      width: 7,

      height: 7,

      decoration: BoxDecoration(

        shape:
            BoxShape.circle,

        color: activo
            ? const Color(0xFFE91E63)
            : const Color(0xFFD1D1D1),

      ),

    );
  }
}