import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onSelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
        ),
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          final bool selected =
              selectedIndex == index;

          return GestureDetector(
            onTap: () => onSelected(index),
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.easeOut,
              width: index == 0 ? 62 : 95,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFFE91E63)
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selected
                      ? const Color(0xFFE91E63)
                      : const Color(0xFFE1E4E8),
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFE91E63)
                              .withOpacity(0.20),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              alignment: Alignment.center,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(
                  milliseconds: 250,
                ),
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF3E4652),
                  fontSize: 14,
                  fontWeight: selected
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                child: Text(
                  categories[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}