import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:tktw_test_app/pages/bloc/change_store_status/change_store_status_bloc.dart';
import 'package:tktw_test_app/pages/bloc/get_store_by_id/get_store_by_id_bloc.dart';

import 'package:tktw_test_app/data/models/error_validation_response.dart';

class FailedReceiveTTHDialog extends StatefulWidget {
  final int id;
  const FailedReceiveTTHDialog({super.key, required this.id});

  @override
  State<FailedReceiveTTHDialog> createState() => _FailedReceiveTTHDialogState();
}

class _FailedReceiveTTHDialogState extends State<FailedReceiveTTHDialog> {
  final formKey = GlobalKey<FormState>();
  String? selectedReason = '';

  final List<Map<String, dynamic>> reasons = [
    {'value': 'Toko Tutup', 'title': 'Toko Tutup'},
    {'value': 'Pemilik Toko Tidak Ada', 'title': 'Pemilik Toko Tidak Ada'},
  ];

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
              'Gagal Terima TTH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Pilih Alasan',
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
                initialValue: selectedReason,
                items: [
                  DropdownMenuItem<String>(
                    value: '',
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Pilih Alasan',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...reasons.map((reason) {
                    return DropdownMenuItem<String>(
                      value: reason['value'],
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            reason['title']!,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedReason = value;
                  });
                },
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Alasan tidak boleh kosong';
                  }
                  return null;
                },
              ),
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
                  child: Row(
                    children: [
                      Iconify(Ion.close_circled, color: Colors.teal, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "BATAL",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    return state.maybeWhen(
                      orElse: () {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<ChangeStoreStatusBloc>().add(
                                ChangeStoreStatusEvent.changeStatus(
                                  id: widget.id,
                                  status: 'Gagal Diterima',
                                  failedReason: selectedReason,
                                ),
                              );
                            }
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
                          child: Row(
                            children: [
                              Iconify(
                                MaterialSymbols.check_circle_outline,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "SIMPAN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
