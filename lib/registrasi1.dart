import 'package:flutter/material.dart';
import 'registrasi2.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _jurusanList = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Manajemen Informatika',
    'Teknik Elektro',
    'Teknik Mesin',
    'Teknik Sipil',
  ];

  final List<String?> _selectedJurusan = List.generate(4, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Registrasi | [Nama Calon Mahasiswa]',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/regis.png',
                height: 200,
              ),
              const SizedBox(height: 30),
              ..._buildJurusanDropdowns(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEFF6F0),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 250, // Lebar sidebar
      backgroundColor: const Color(0xFFEAF4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Calon Mahasiswa',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Biodata'),
                  onTap: () {
                    Navigator.pop(context);
                    // navigasi ke biodata
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Keluar'),
                  onTap: () {
                    Navigator.pop(context);
                    // algoritma logout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildJurusanDropdowns() {
    const dropdownLabels = [
      'Pilihan Jurusan 1*',
      'Pilihan Jurusan 2',
      'Pilihan Jurusan 3',
      'Pilihan Jurusan 4',
    ];

    return List<Widget>.generate(dropdownLabels.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: DropdownButtonFormField<String>(
          value: _selectedJurusan[index],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: dropdownLabels[index],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          items: _jurusanList
              .map((jurusan) => DropdownMenuItem(
                    value: jurusan,
                    child: Text(jurusan),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedJurusan[index] = value;
            });
          },
        ),
      );
    });
  }
}