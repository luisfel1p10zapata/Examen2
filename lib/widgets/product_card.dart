import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String category;
  final String name;
  final double price;
  final double? oldPrice;
  final String? imagePath;
  final bool isSale;
  final int animationDelay;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.category,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
    required this.isSale,
    required this.animationDelay,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _favorite = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(
        milliseconds: 500 + widget.animationDelay,
      ),
      tween: Tween(
        begin: 0,
        end: 1,
      ),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(
              0,
              35 * (1 - value),
            ),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _pressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _pressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _pressed = false;
          });
        },
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1,
          duration: const Duration(
            milliseconds: 120,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: _buildProductImage(),
                      ),

                      if (widget.isSale)
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE91E63),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'SALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _favorite = !_favorite;
                            });
                          },
                          child: AnimatedContainer(
                            duration:
                                const Duration(
                              milliseconds: 250,
                            ),
                            width: 32,
                            height: 32,
                            decoration:
                                const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration:
                                    const Duration(
                                  milliseconds: 200,
                                ),
                                transitionBuilder:
                                    (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: Icon(
                                  _favorite
                                      ? Icons.favorite
                                      : Icons
                                          .favorite_border,
                                  key: ValueKey(
                                    _favorite,
                                  ),
                                  size: 21,
                                  color: _favorite
                                      ? const Color(
                                          0xFFE91E63,
                                        )
                                      : const Color(
                                          0xFF9AA4AE,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 4,
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(
                      10,
                      8,
                      10,
                      9,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.category.toUpperCase(),
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 9,
                            letterSpacing: 0.6,
                            color: Color(0xFF8C969F),
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          widget.name,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF303845),
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          children: [
                            Text(
                              '\$${widget.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color:
                                    Color(0xFFE91E63),
                                fontWeight:
                                    FontWeight.w800,
                              ),
                            ),

                            if (widget.oldPrice != null) ...[
                              const SizedBox(width: 6),
                              Text(
                                '\$${widget.oldPrice!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color:
                                      Color(0xFF9AA4AE),
                                  decoration:
                                      TextDecoration
                                          .lineThrough,
                                ),
                              ),
                            ],
                          ],
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: ElevatedButton(
                            onPressed:
                                widget.onAddToCart,
                            style:
                                ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color(0xFFFFE7F1),
                              foregroundColor:
                                  const Color(
                                0xFFE91E63,
                              ),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(8),
                              ),
                            ),
                            child: const Text(
                              'ADD TO CART',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight:
                                    FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    if (widget.imagePath != null &&
        widget.imagePath!.isNotEmpty) {
      return Image.asset(
        widget.imagePath!,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) {
          return _placeholderImage();
        },
      );
    }

    return _placeholderImage();
  }

  Widget _placeholderImage() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F1EC),
            Color(0xFFD4E4DA),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          _getProductIcon(),
          size: 55,
          color: const Color(0xFF718579),
        ),
      ),
    );
  }

  IconData _getProductIcon() {
    switch (widget.category) {
      case 'Ropa':
        return Icons.checkroom_outlined;

      case 'Bienestar':
        return Icons.spa_outlined;

      case 'Accesorios':
        return Icons.watch_outlined;

      default:
        return Icons.shopping_bag_outlined;
    }
  }
}