import 'package:flutter/material.dart';

class GroceryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Icon(Icons.burger), // Replace with burger icon
            SizedBox(width: 8),
            Text("Burger"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Implement filter action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Grid of grocery items
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  childAspectRatio: 0.8, // Adjust the height/width ratio
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: groceryItems.length, // Replace with your item count
                itemBuilder: (context, index) {
                  return GroceryItemCard(groceryItem: groceryItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryItemCard extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryItemCard({Key? key, required this.groceryItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  groceryItem.imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groceryItem.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text("${groceryItem.rating}"),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "\$${groceryItem.discountedPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 4),
                        if (groceryItem.price != groceryItem.discountedPrice)
                          Text(
                            "\$${groceryItem.price}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Favorite Icon
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Implement favorite action
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryItem {
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discountedPrice;

  GroceryItem({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discountedPrice,
  });
}

// Sample data
final List<GroceryItem> groceryItems = [
  GroceryItem(
    title: "Chicken Burger",
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
    rating: 4.9,
    price: 12.0,
    discountedPrice: 6.0,
  ),
  GroceryItem(
    title: "Beef Burger",
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747609/assessment/lna3djrzaqmlyoyfdeag.jpg",
    rating: 4.9,
    price: 12.0,
    discountedPrice: 10.0,
  ),
  // Add more items here
];
// import 'package:flutter/material.dart';

// class GroceryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             // Icon(Icons.burger), // Replace with burger icon
//             SizedBox(width: 8),
//             Text("Burger"),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt_outlined),
//             onPressed: () {
//               // Implement filter action
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search bar
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: "Search",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Grid of grocery items
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // Two items per row
//                   childAspectRatio: 0.8, // Adjust the height/width ratio
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                 ),
//                 itemCount: groceryItems.length, // Use the length of your data list
//                 itemBuilder: (context, index) {
//                   return GroceryItemCard(groceryItem: groceryItems[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GroceryItemCard extends StatelessWidget {
//   final GroceryItem groceryItem;

//   const GroceryItemCard({Key? key, required this.groceryItem}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 child: Image.network(
//                   groceryItem.imageUrl,
//                   height: 100,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       groceryItem.title,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.orange, size: 16),
//                         SizedBox(width: 4),
//                         Text("${groceryItem.rating}"),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text(
//                           "\$${groceryItem.discountedPrice}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         if (groceryItem.price != groceryItem.discountedPrice)
//                           Text(
//                             "\$${groceryItem.price}",
//                             style: TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               color: Colors.grey,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Favorite Icon
//           Positioned(
//             top: 8,
//             right: 8,
//             child: IconButton(
//               icon: Icon(Icons.favorite_border),
//               onPressed: () {
//                 // Implement favorite action
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GroceryItem {
//   final String title;
//   final String imageUrl;
//   final double rating;
//   final double price;
//   final double discountedPrice;

//   GroceryItem({
//     required this.title,
//     required this.imageUrl,
//     required this.rating,
//     required this.price,
//     required this.discountedPrice,
//   });
// }

// // Sample data
// final List<GroceryItem> groceryItems = [
//   GroceryItem(
//     title: "Chicken Burger",
//     imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
//     rating: 4.9,
//     price: 12.0,
//     discountedPrice: 6.0,
//   ),
//   GroceryItem(
//     title: "Beef Burger",
//     imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747609/assessment/lna3djrzaqmlyoyfdeag.jpg",
//     rating: 4.9,
//     price: 12.0,
//     discountedPrice: 10.0,
//   ),
//   // Add more items here
// ];
