import '../model/product.dart';

const mockProducts = <Product>[
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    description:
        'Comfortable, noise-reducing headphones with long battery life.',
    price: 59.99,
    imageUrl: 'https://picsum.photos/seed/p1/600/400',
  ),
  Product(
    id: 'p2',
    name: 'Smart Watch',
    description:
        'Track workouts, sleep, and notifications with a sleek design.',
    price: 89.99,
    imageUrl: 'https://picsum.photos/seed/p2/600/400',
  ),
  Product(
    id: 'p3',
    name: 'Portable Speaker',
    description: 'Big sound in a compact body. Great for travel.',
    price: 39.99,
    imageUrl: 'https://picsum.photos/seed/p3/600/400',
  ),
];
