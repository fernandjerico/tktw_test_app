import 'package:flutter/material.dart';

class HaveReceivedTthDialog extends StatefulWidget {
  const HaveReceivedTthDialog({super.key});

  @override
  State<HaveReceivedTthDialog> createState() => _HaveReceivedTthDialogState();
}

class _HaveReceivedTthDialogState extends State<HaveReceivedTthDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sudah Terima TTH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/confirmation-dialog.jpg', height: 200),
            SizedBox(height: 20),
            Text(
              'Yakin ingin menyimpan sudah terima TTH?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "TIDAK",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "YA, SUDAH TERIMA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
