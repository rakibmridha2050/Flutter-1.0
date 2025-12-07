import 'package:flutter/material.dart';

void main() {
  runApp(const Ecompractice());
}

class Ecompractice extends StatelessWidget {
  const Ecompractice({super.key});

  // Sample product list
  final List<Map<String, String>> products = const [
    {"name": "Shoes", "image": "https://picsum.photos/200/200?1"},
    {"name": "Watch", "image": "https://picsum.photos/200/200?2"},
    {"name": "Bag", "image": "https://picsum.photos/200/200?3"},
    {"name": "Headphone", "image": "https://picsum.photos/200/200?4"},
    {"name": "Camera", "image": "https://picsum.photos/200/200?5"},
    {"name": "Mobile", "image": "https://picsum.photos/200/200?6"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ShopBD"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: "Cart",
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search product...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories horizontal scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("All")),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Shoes"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Watch"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text("Bag")),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Popular Product Text
              const Text(
                "Popular Product..",
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 65, 83),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Grid of products
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            product['image']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add to Cart"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
