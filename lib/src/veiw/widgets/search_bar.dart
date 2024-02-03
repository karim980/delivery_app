import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodSearchBar extends StatelessWidget {
  final Function(String) onSearchTextChanged;

  FoodSearchBar({required this.onSearchTextChanged});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    _searchController
        .addListener(() => onSearchTextChanged(_searchController.text));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for food...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.0),
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
