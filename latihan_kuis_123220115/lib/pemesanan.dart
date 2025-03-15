import 'package:flutter/material.dart';

class Pesan extends StatefulWidget {
  final Map<String, dynamic> menu;

  Pesan(this.menu);

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  int jumlah = 1;

  void _buatPesanan() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil memesan ${widget.menu["name"]}"),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.menu["price"] * jumlah;

    return Scaffold(
      appBar: AppBar(title: Text("Pesan ${widget.menu["name"]}")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  widget.menu["image"],
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  widget.menu["name"],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Rp. ${widget.menu["price"]} x $jumlah = Rp. $totalPrice",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (jumlah > 1) jumlah--;
                        });
                      },
                    ),
                    Text(jumlah.toString(), style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          jumlah++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _buatPesanan,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Pesan Sekarang", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
