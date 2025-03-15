import 'package:flutter/material.dart';
import 'pemesanan.dart';
import 'login.dart';

class Menu extends StatelessWidget {
  final List<Map<String, dynamic>> menu = [
    {"name": "Nasi Goreng", "price": 15000, "image": "assets/nasi_goreng.jpg"},
    {"name": "Mie Ayam", "price": 12000, "image": "assets/mie_ayam.jpg"},
    {"name": "Sate Ayam", "price": 20000, "image": "assets/sate_ayam.png"},
    {"name": "Bakso", "price": 10000, "image": "assets/bakso.jpg"},
    {"name": "Mie Goreng", "price": 12000, "image": "assets/mie_goreng.jpg"},
    {"name": "Ayam Bakar", "price": 20000, "image": "assets/ayam_bakar.jpg"},
  ];

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Halo Tsani"),
            Text(
              "Mau makan apa hari ini?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: ()=> _logout(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/header.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            menu[index]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                menu[index]["name"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp. ${menu[index]["price"]}",
                                style: TextStyle(color: Colors.green),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:(context) => Pesan(menu[index]),
                                    ),
                                  );
                                },
                                child: Text("Pesan"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
