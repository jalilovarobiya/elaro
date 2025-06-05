import 'package:elaro/features/home/view/pages/home_page.dart';
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
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.orange[700],
        title: Column(
          children: [
            Text("elaro"),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Qidirish",
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return IndexedStack(
            index: value,
            children: [
              HomePage(),
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
