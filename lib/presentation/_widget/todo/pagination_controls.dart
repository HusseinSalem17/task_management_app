import 'package:flutter/material.dart';

Widget paginationControls({
  required int currentPage,
  required int totalPages,
  required ValueChanged<int> onPageChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed:
            currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
      ),
      Text('$currentPage / $totalPages'),
      IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: currentPage < totalPages
            ? () => onPageChanged(currentPage + 1)
            : null,
      ),
    ],
  );
}
