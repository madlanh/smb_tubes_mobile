import 'package:flutter/material.dart';
import 'package:smb_mobil/biodata.dart';
import 'registrasi1.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            'Seleksi Mahasiswa baru | SMB',
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
              _buildDashboardCard(
                title: 'BIODATA',
                description: 'Segera lengkapi biodata Anda\nagar dapat melakukan registrasi',
                imagePath: 'assets/dashBio.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BiodataPage())
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildDashboardCard(
                title: 'REGISTRASI',
                description: 'Pilih jurusan impianmu!\nAnda dapat memilih hingga 4 jurusan',
                imagePath: 'assets/dashRegis.png',
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const RegistrationPage())
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildDashboardCard(
                title: 'HASIL KELULUSAN',
                description: 'Lihat hasil seleksi Anda.\nSemoga beruntung!',
                imagePath: 'assets/dashLulus.png',
                onTap: () {
                  // Navigate to results page
                  // Tambahkan navigasi ke halaman hasil kelulusan ketika sudah dibuat
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF6B9080),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFB2D3C2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 120,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 40),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 250,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BiodataPage())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.app_registration),
                  title: const Text('Registrasi'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const RegistrationPage())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list_alt),
                  title: const Text('Hasil Kelulusan'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator ke halaman hasil kelulusan
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Keluar'),
                  onTap: () {
                    Navigator.pop(context);
                    // Kembali ke halaman login
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}