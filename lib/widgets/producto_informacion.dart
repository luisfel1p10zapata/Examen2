import 'package:flutter/material.dart';

import 'producto_especificacion.dart';

class ProductoInformacion extends StatelessWidget {

  final String nombre;

  final String precio;

  final String descripcion;

  final String material;

  final String duracion;

  const ProductoInformacion({

    super.key,

    required this.nombre,

    required this.precio,

    required this.descripcion,

    required this.material,

    required this.duracion,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      color: Colors.white,

      padding: const EdgeInsets.fromLTRB(
        18,
        0,
        18,
        25,
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ----------------------------------------------------
          // NOMBRE
          // ----------------------------------------------------

          Text(

            nombre,

            style: const TextStyle(

              fontSize: 22,

              fontWeight:
                  FontWeight.w700,

              height: 1.25,

              color:
                  Color(0xFF5B4843),

            ),

          ),

          const SizedBox(height: 8),

          // ----------------------------------------------------
          // PRECIO + BESTSELLER
          // ----------------------------------------------------

          Row(

            children: [

              Text(

                precio,

                style: const TextStyle(

                  fontSize: 29,

                  fontWeight:
                      FontWeight.w700,

                  color:
                      Color(0xFFE91E63),

                ),

              ),

              const SizedBox(width: 12),

              Container(

                padding:
                    const EdgeInsets.symmetric(

                  horizontal: 9,

                  vertical: 5,

                ),

                decoration: BoxDecoration(

                  color:
                      const Color(0xFFFCE4EC),

                  borderRadius:
                      BorderRadius.circular(6),

                ),

                child: const Text(

                  'BESTSELLER',

                  style: TextStyle(

                    fontSize: 11,

                    fontWeight:
                        FontWeight.w700,

                    color:
                        Color(0xFFE91E63),

                  ),

                ),

              ),

            ],

          ),

          const SizedBox(height: 25),

          // ----------------------------------------------------
          // DESCRIPCIÓN
          // ----------------------------------------------------

          const Text(

            'DESCRIPTION',

            style: TextStyle(

              fontSize: 13,

              fontWeight:
                  FontWeight.w700,

              letterSpacing: 0.8,

              color:
                  Color(0xFF5B4843),

            ),

          ),

          const SizedBox(height: 10),

          Text(

            descripcion,

            style: const TextStyle(

              fontSize: 15.5,

              height: 1.55,

              color:
                  Color(0xFF7B7B7B),

            ),

          ),

          const SizedBox(height: 28),

          // ----------------------------------------------------
          // ESPECIFICACIONES
          // ----------------------------------------------------

          Row(

            children: [

              Expanded(

                child:
                    ProductoEspecificacion(

                  titulo: 'MATERIAL',

                  valor: material,

                ),

              ),

              const SizedBox(width: 14),

              Expanded(

                child:
                    ProductoEspecificacion(

                  titulo: 'RUN TIME',

                  valor: duracion,

                ),

              ),

            ],

          ),

          const SizedBox(height: 28),

        ],

      ),

    );
  }
}