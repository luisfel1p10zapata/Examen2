import 'package:flutter/material.dart';

class ProductoEspecificacion
    extends StatelessWidget {

  final String titulo;

  final String valor;

  const ProductoEspecificacion({

    super.key,

    required this.titulo,

    required this.valor,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 55,

      padding: const EdgeInsets.fromLTRB(
        12,
        7,
        8,
        7,
      ),

      decoration: BoxDecoration(

        color:
            const Color(0xFFF8F9FA),

        borderRadius:
            BorderRadius.circular(7),

        border: Border.all(

          color:
              const Color(0xFFF0F0F0),

        ),

      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Text(

            titulo,

            style: const TextStyle(

              fontSize: 9,

              fontWeight:
                  FontWeight.w700,

              color:
                  Color(0xFF777777),

            ),

          ),

          const SizedBox(height: 3),

          Text(

            valor,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(

              fontSize: 12,

              color:
                  Color(0xFF4F4441),

            ),

          ),

        ],

      ),

    );
  }
}