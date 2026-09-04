import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/producto_top_bar.dart';
import '../widgets/producto_imagen.dart';
import '../widgets/producto_informacion.dart';
import '../widgets/producto_bottom_bar.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({super.key});

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  final String nombreProducto = 'Velvet Touch Rechargeable Wand';

  final String precioProducto = '\$89.00';

  final String descripcionProducto =
      'Experience ultimate relaxation with the Velvet Touch. '
      'Crafted from premium materials, this powerful product '
      'offers multiple vibration modes and a flexible design '
      'for versatile use.';

  final String materialProducto = 'Premium Silicone';

  final String duracionProducto = '120 Minutes';

  // Por ahora utilizamos una imagen que ya existe en tu proyecto.
  // Después puedes cambiarla por tu imagen del producto.
  final String imagenProducto = 'assets/images/producto.jpg';

  int cantidad = 1;

  bool favorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      // BARRA INFERIOR
      bottomNavigationBar: ProductoBottomBar(
        cantidad: cantidad,

        onRestar: () {
          if (cantidad > 1) {
            setState(() {
              cantidad--;
            });
          }
        },

        onSumar: () {
          setState(() {
            cantidad++;
          });
        },

        onAgregar: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '$cantidad producto(s) agregado(s) al carrito',
              ),
            ),
          );
        },
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // BARRA SUPERIOR
                    ProductoTopBar(
                      favorito: favorito,

                      onRegresar: () {
                        Navigator.pop(context);
                      },

                      onFavorito: () {
                        setState(() {
                          favorito = !favorito;
                        });
                      },
                    ),

                    // IMAGEN
                    ProductoImagen(
                      imagen: imagenProducto,
                    ),

                    // INFORMACIÓN
                    ProductoInformacion(
                      nombre: nombreProducto,
                      precio: precioProducto,
                      descripcion: descripcionProducto,
                      material: materialProducto,
                      duracion: duracionProducto,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}