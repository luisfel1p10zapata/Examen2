import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';
import '../widgets/home_header.dart';
import '../widgets/category_selector.dart';
import '../widgets/product_card.dart';
import '../widgets/home_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int _selectedCategory = 0;
  int _selectedBottomItem = 0;
  int _cartItems = 2;

  final List<String> _categories = ['All', 'Ropa', 'Accesorios', 'Bienestar'];

  final List<Map<String, dynamic>> _products = [
    {
      'category': 'Ropa',
      'name': 'Producto Premium',
      'price': 49.99,
      'oldPrice': null,
      'image': 'assets/images/img1.jpg',
      'isSale': false,
    },
    {
      'category': 'Accesorios',
      'name': 'Diseño Especial',
      'price': 34.50,
      'oldPrice': null,
      'image': 'assets/images/img2.jpg',
      'isSale': false,
    },
    {
      'category': 'Bienestar',
      'name': 'Producto Natural',
      'price': 18.00,
      'oldPrice': null,
      'image': 'assets/images/img3.jpg',
      'isSale': false,
    },
    {
      'category': 'Ropa',
      'name': 'Oferta Especial',
      'price': 55.00,
      'oldPrice': 75.00,
      'image': 'assets/images/img4.jpg',
      'isSale': true,
    },
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredProducts {
    if (_selectedCategory == 0) {
      return _products;
    }

    final category = _categories[_selectedCategory];

    return _products.where((product) {
      return product['category'] == category;
    }).toList();
  }

  void _changeCategory(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  void _addToCart() {
  setState(() {
    _cartItems++;
  });

  context.push('/producto');
}

  void _changeBottomItem(int index) {
    setState(() {
      _selectedBottomItem = index;
    });

    if (index == 0) {
      return;
    }

    if (index == 3) {
      _showProfileOptions();
      return;
    }

    String message;

    switch (index) {
      case 1:
        message = 'Catálogo próximamente';
        break;
      case 2:
        message = 'Pedidos próximamente';
        break;
      default:
        message = '';
    }

    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    }
  }

  void _showProfileOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 25),

                const Icon(
                  Icons.person_outline,
                  size: 45,
                  color: Color(0xFFE91E63),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Mi perfil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);

                      AuthService.logout();

                      context.go('/login');
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Cerrar sesión'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8FA),

        body: SafeArea(
          child: Column(
            children: [
              // HEADER
              HomeHeader(cartItems: _cartItems),

              // CONTENIDO
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // CATEGORÍAS
                      CategorySelector(
                        categories: _categories,
                        selectedIndex: _selectedCategory,
                        onSelected: _changeCategory,
                      ),

                      const SizedBox(height: 28),

                      // TÍTULO DE PRODUCTOS
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Featured Products',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF172033),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Filtros próximamente'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    'Filters',
                                    style: TextStyle(
                                      color: Color(0xFFE91E63),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.tune,
                                    size: 17,
                                    color: Color(0xFFE91E63),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // PRODUCTOS
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _filteredProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 14,
                                childAspectRatio: 0.68,
                              ),
                          itemBuilder: (context, index) {
                            final product = _filteredProducts[index];

                            return ProductCard(
                              key: ValueKey('${product['name']}_$index'),
                              category: product['category'],
                              name: product['name'],
                              price: product['price'],
                              oldPrice: product['oldPrice'],
                              imagePath: product['image'],
                              isSale: product['isSale'],
                              animationDelay: index * 120,
                              onAddToCart: _addToCart,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // BARRA INFERIOR
        bottomNavigationBar: HomeBottomNav(
          selectedIndex: _selectedBottomItem,
          cartItems: _cartItems,
          onItemSelected: _changeBottomItem,
        ),
      ),
    );
  }
}
