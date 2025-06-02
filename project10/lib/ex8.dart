import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => const ProductPage(),
        '/profile': (context) => const ProfilePage(),
        '/first': (context) => const FirstScreen(),
      },
    );
  }
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Jane Doe'),
          accountEmail: Text('jane.doe@example.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1485290334039-a3c69043e517?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60'),
          ),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Product'),
          onTap: () => Navigator.pushReplacementNamed(context, '/product'),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.send),
          title: const Text('Kirim Data'),
          onTap: () => Navigator.pushReplacementNamed(context, '/first'),
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Halaman Home')),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Product')),
      body: const Center(child: Text('Halaman Product')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Halaman Profile')),
    );
  }
}

// ===================
// Kirim Terima Data
// ===================

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? hasil;

  void panggilSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );
    setState(() {
      hasil = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => panggilSecondScreen(context),
              child: const Text('Buka Screen 2'),
            ),
            const SizedBox(height: 20),
            Text(hasil != null ? 'Data diterima: $hasil' : 'Belum ada data'),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Data dari Screen 2: 2000');
          },
          child: const Text('Kembali ke Screen 1 dan kirim data'),
        ),
      ),
    );
  }
}
