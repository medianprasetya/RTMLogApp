import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 226, 241, 255).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 22,
            offset: Offset(1, 2), // pergeseran bayangan
          ),
        ],
      ),
      child: Card(
        elevation: 0, // Set elevation Card ke 0 karena bayangan sudah ditangani secara manual
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          hoverColor: Colors.black26,
          minLeadingWidth: 2,
          leading: CircleAvatar(
            radius: 30, // Mengurangi radius agar sesuai dengan UI umumnya
            child: Text(
              "?",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.lightBlue,
          ),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          title: Text("Title"),
        ),
      ),
    );
  }
}
