import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tktw_test_app/data/models/error_validation_response.dart';
import 'package:tktw_test_app/pages/bloc/change_store_status/change_store_status_bloc.dart';
import 'package:tktw_test_app/pages/bloc/get_store_by_id/get_store_by_id_bloc.dart';

class HaveReceivedTthDialog extends StatefulWidget {
  final int id;
  const HaveReceivedTthDialog({super.key, required this.id});

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
                BlocConsumer<ChangeStoreStatusBloc, ChangeStoreStatusState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (data) {
                        context.read<GetStoreByIdBloc>().add(
                          GetStoreByIdEvent.getStoreById(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(data.message!),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      error: (error) {
                        String message;
                        if (error is String) {
                          message = error;
                        } else if (error is ErrorValidationResponse) {
                          message = error.message;
                        } else {
                          message = 'Terjadi kesalahan';
                        }
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                        Navigator.pop(context);
                      },
                    );
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<ChangeStoreStatusBloc>().add(
                          ChangeStoreStatusEvent.changeStatus(
                            id: widget.id,
                            status: 'Sudah Diterima',
                          ),
                        );
                      },
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
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
