import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final int cartItems;
  final Function(int) onItemSelected;

  const HomeBottomNav({
    super.key,
    required this.selectedIndex,
    required this.cartItems,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home,
        'label': 'Home',
      },
      {
        'icon': Icons.menu_book_outlined,
        'activeIcon': Icons.menu_book,
        'label': 'Catalog',
      },
      {
        'icon': Icons.shopping_bag_outlined,
        'activeIcon': Icons.shopping_bag,
        'label': 'Orders',
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'label': 'Profile',
      },
    ];

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final bool selected =
                selectedIndex == index;

            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onItemSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  padding:
                      const EdgeInsets.only(top: 7),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(
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
                              selected
                                  ? items[index]
                                      ['activeIcon']
                                      as IconData
                                  : items[index]['icon']
                                      as IconData,
                              key: ValueKey(
                                '${index}_$selected',
                              ),
                              size: 22,
                              color: selected
                                  ? const Color(
                                      0xFFE91E63,
                                    )
                                  : const Color(
                                      0xFF9AA4AE,
                                    ),
                            ),
                          ),

                          if (index == 2 &&
                              cartItems > 0)
                            Positioned(
                              right: -7,
                              top: -6,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration:
                                    const BoxDecoration(
                                  color:
                                      Color(0xFFE91E63),
                                  shape:
                                      BoxShape.circle,
                                ),
                                alignment:
                                    Alignment.center,
                                child: Text(
                                  '$cartItems',
                                  style:
                                      const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 3),

                      AnimatedDefaultTextStyle(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: selected
                              ? const Color(
                                  0xFFE91E63,
                                )
                              : const Color(
                                  0xFF9AA4AE,
                                ),
                        ),
                        child: Text(
                          items[index]['label']
                              as String,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}