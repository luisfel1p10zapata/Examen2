import 'package:flutter/material.dart';

class ProductoBottomBar
    extends StatelessWidget {

  final int cantidad;

  final VoidCallback onRestar;

  final VoidCallback onSumar;

  final VoidCallback onAgregar;

  const ProductoBottomBar({

    super.key,

    required this.cantidad,

    required this.onRestar,

    required this.onSumar,

    required this.onAgregar,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 82,

      padding: const EdgeInsets.fromLTRB(
        18,
        12,
        14,
        12,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        boxShadow: [

          BoxShadow(

            color:
                Colors.black.withOpacity(0.08),

            blurRadius: 10,

            offset:
                const Offset(0, -3),

          ),

        ],

      ),

      child: Row(

        children: [

          // ----------------------------------------------------
          // CANTIDAD
          // ----------------------------------------------------

          Container(

            width: 103,

            height: 49,

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(7),

              border: Border.all(

                color:
                    const Color(0xFFE1E1E1),

              ),

            ),

            child: Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [

                // MENOS
                InkWell(

                  onTap: onRestar,

                  child: const Padding(

                    padding:
                        EdgeInsets.all(8),

                    child: Text(

                      '−',

                      style: TextStyle(

                        fontSize: 18,

                        color:
                            Color(0xFF5B514E),

                      ),

                    ),

                  ),

                ),

                // CANTIDAD
                Text(

                  '$cantidad',

                  style: const TextStyle(

                    fontSize: 15,

                    fontWeight:
                        FontWeight.w600,

                    color:
                        Color(0xFF403A38),

                  ),

                ),

                // MÁS
                InkWell(

                  onTap: onSumar,

                  child: const Padding(

                    padding:
                        EdgeInsets.all(8),

                    child: Text(

                      '+',

                      style: TextStyle(

                        fontSize: 18,

                        color:
                            Color(0xFF5B514E),

                      ),

                    ),

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(width: 15),

          // ----------------------------------------------------
          // BOTÓN CARRITO
          // ----------------------------------------------------

          Expanded(

            child: SizedBox(

              height: 51,

              child: ElevatedButton(

                onPressed: onAgregar,

                style:
                    ElevatedButton.styleFrom(

                  backgroundColor:
                      const Color(0xFFE91E63),

                  foregroundColor:
                      Colors.white,

                  elevation: 3,

                  shadowColor:
                      const Color(0x55E91E63),

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(7),

                  ),

                ),

                child: const Text(

                  'ADD TO CART',

                  style: TextStyle(

                    fontSize: 15,

                    fontWeight:
                        FontWeight.w700,

                    letterSpacing: 0.3,

                  ),

                ),

              ),

            ),

          ),

        ],

      ),

    );
  }
}