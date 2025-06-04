import 'package:elaro/features/products/view/pages/products_pages.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return IndexedStack(
            index: value,
            children: [
              ProductsPage(),
              Container(color: Colors.yellow),
              Container(color: Colors.green),
              Container(color: Colors.grey),
              Container(color: Colors.pink),
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return BottomNavigationBar(
            currentIndex: value,
            onTap: (index) {
              currentIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: "category",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                label: "orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
