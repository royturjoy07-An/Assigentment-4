import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turjoy1069/container_page.dart' show ContainerPage;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello dude!", style: GoogleFonts.lobster(fontSize: 26)),
        backgroundColor: const Color.fromARGB(255, 36, 169, 225),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Turjoy"),
              accountEmail: Text("royturjoy26@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              hoverColor: Colors.blue.shade100,
              title: const Text("Homepage"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),

            const Divider(color: Colors.grey),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              hoverColor: Colors.blue.shade100,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContainerPage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              hoverColor: Colors.blue.shade100,
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(color: Colors.grey),
          ],
        ),
      ),

      endDrawer: const Drawer(
        child: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 20)),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Add button clicked!")));
        },
        backgroundColor: const Color.fromARGB(255, 164, 103, 124),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        tooltip: "Add",
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.waving_hand,
              size: 55,
              color: Color.fromARGB(255, 231, 9, 27),
            ),

            const SizedBox(height: 12),

            Text(
              "Welcome to my app!",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 172, 184),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Choose your favorite color",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 118, 118, 118),
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContainerPage()),
                  );
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 59, 102, 137),
                  ),
                  backgroundColor: const Color.fromARGB(255, 59, 102, 137),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color.fromARGB(255, 255, 193, 7),
                  elevation: 5,
                  fixedSize: const Size(150, 50),
                ),
                child: const Text("Container Page"),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContainerPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 76, 175, 80),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                fixedSize: const Size(150, 50),
              ),
              child: const Text("Go to Container Page "),
            ),

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You selected Pink!")),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 255, 105, 180),
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 105, 180),
                ),
                fixedSize: const Size(150, 50),
              ),
              child: const Text("Pink"),
            ),
          ],
        ),
      ),
    );
  }
}
