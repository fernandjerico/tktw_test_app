import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/cil.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';

import '../widgets/total_prize_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedStoreId;

  final List<Map<String, dynamic>> storeModels = [
    {
      'id': '1',
      'name': 'Bintang Mandiri',
      'location': 'Tengku Iskandari (Blang Bintang Lama)',
      'status': 'Belum Diberikan',
      'phone': '+6281234567890',
      'gifts': {
        '1': {'name': 'Sepeda', 'quantity': 1},
        '2': {'name': 'Helm', 'quantity': 2},
        '3': {'name': 'Lampu Sepeda', 'quantity': 3},
      },
    },
    {
      'id': '2',
      'name': 'Mandiri Baru',
      'location': 'T Iskandar 4 Lamglumpang',
      'status': 'Belum Diberikan',
      'phone': '+6281234567890',
      'gifts': {
        '1': {'name': 'Sepeda', 'quantity': 1},
        '2': {'name': 'Helm', 'quantity': 2},
        '3': {'name': 'Lampu Sepeda', 'quantity': 3},
      },
    },
    {
      'id': '3',
      'name': 'Mirza',
      'location': 'Tengku Iskandar 5',
      'status': 'Belum Diberikan',
      'phone': '+6281234567890',
      'gifts': {
        '1': {'name': 'Sepeda', 'quantity': 1},
        '2': {'name': 'Helm', 'quantity': 2},
        '3': {'name': 'Lampu Sepeda', 'quantity': 3},
      },
    },
    {
      'id': '4',
      'name': 'Puga Jaya',
      'location': 'Kebun Raya Sp.4 Pineung Lamglumpang',
      'status': 'Belum Diberikan',
      'phone': '+6281234567890',
      'gifts': {
        '1': {'name': 'Sepeda', 'quantity': 1},
        '2': {'name': 'Helm', 'quantity': 2},
        '3': {'name': 'Lampu Sepeda', 'quantity': 3},
      },
    },
    {
      'id': '5',
      'name': 'Varia Muge Profil',
      'location': 'T.Iskandar, Lam Glumpang',
      'status': 'Belum Diberikan',
      'phone': '+6281234567890',
      'gifts': {
        '1': {'name': 'Sepeda', 'quantity': 1},
        '2': {'name': 'Helm', 'quantity': 2},
        '3': {'name': 'Lampu Sepeda', 'quantity': 3},
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Semua Toko',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      initialValue: selectedStoreId,
                      items: storeModels.map((store) {
                        return DropdownMenuItem<String>(
                          value: store['id'],
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  shape: BoxShape.circle,
                                ),
                                child: Iconify(
                                  Mdi.home_variant,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                store['name']!,
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedStoreId = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return TotalPrizeDialog();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Iconify(Ph.gift, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "Total Hadiah",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: storeModels.length,
                itemBuilder: (context, index) {
                  final store = storeModels[index];
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.teal),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store['name']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Iconify(
                                        Cil.location_pin,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        store['location']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    store['status']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Iconify(
                                        Cil.location_pin,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        store['phone']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 12,
                            bottom: 60,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              ...store['gifts'].entries.map((giftEntry) {
                                final gift = giftEntry.value;
                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.cyan.shade600,
                                        Colors.teal.shade500,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/gift-box.png',
                                        width: 32,
                                        height: 32,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        gift['name']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 16,
                                        ),
                                        backgroundColor: Colors.grey[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          side: BorderSide(color: Colors.teal),
                                        ),
                                      ),
                                      child: Text(
                                        'Tolak TTH',
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 16,
                                        ),
                                        backgroundColor: Colors.teal,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Terima TTH',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
