import 'package:flutter/material.dart';
import 'page2.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"), // Background image
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.shortestSide,
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color.fromRGBO(252, 219, 138, 1).withOpacity(0.5), // Menambah opacity
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage: AssetImage('assets/images/han2.jpg'),
                      ),

                      const Text(
                        "Reyhan Aulia Treeana",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22, 
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Backend Developer | Java | Laravel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16, 
                            color: Colors.black,
                          ),
                        ),
                      ),

                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Page2()),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,  // Warna background
                            side: const BorderSide(
                              color: Colors.blue,  // Warna border
                              width: 2.0,         // Ketebalan border
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),  // Membuat sudut border melengkung
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),  // Padding di dalam tombol
                          ),
                          child: const Text(
                            "See More",
                            style: TextStyle(
                              color: Colors.blue,  // Warna teks
                            ),
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
