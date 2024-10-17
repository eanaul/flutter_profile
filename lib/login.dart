import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _sekolahController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  bool validateInputs(BuildContext context) {
    if (_nameController.text.isEmpty || 
        _roleController.text.isEmpty || 
        _sekolahController.text.isEmpty || 
        _descController.text.isEmpty) {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi")),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Silahkan Masukkan Data',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                
                buildInputField(
                    controller: _nameController, label: 'Nama'),
                const SizedBox(height: 10),

                buildInputField(
                    controller: _roleController, label: 'Role'),
                const SizedBox(height: 10),

                buildInputField(
                    controller: _sekolahController, label: 'Sekolah'),
                const SizedBox(height: 10),

                buildInputField(
                    controller: _descController, label: 'Deskripsi Singkat'),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (validateInputs(context)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(
                            name: _nameController.text,
                            role: _roleController.text,
                            sekolah: _sekolahController.text,
                            desc: _descController.text,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField buildInputField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black54,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
