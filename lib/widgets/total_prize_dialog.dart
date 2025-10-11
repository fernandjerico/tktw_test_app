import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:tktw_test_app/pages/bloc/get_prize/get_prize_bloc.dart';

class TotalPrizeDialog extends StatefulWidget {
  const TotalPrizeDialog({super.key});

  @override
  State<TotalPrizeDialog> createState() => _TotalPrizeDialogState();
}

class _TotalPrizeDialogState extends State<TotalPrizeDialog> {
  @override
  void initState() {
    super.initState();
    context.read<GetPrizeBloc>().add(GetPrizeEvent.getPrize());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/gift-box.png',
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Total Hadiah",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ],
          ),
          BlocBuilder<GetPrizeBloc, GetPrizeState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Center(
                  child: CircularProgressIndicator(color: Colors.lime),
                ),
                loaded: (data) {
                  final totalQty = (data.data ?? []).fold<int>(
                    0,
                    (sum, prize) => sum + (prize.qty ?? 0),
                  );
                  return Column(
                    children: [
                      Divider(color: Colors.lime, thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: List.generate(data.data?.length ?? 0, (
                            index,
                          ) {
                            final prize = data.data?[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Iconify(
                                          Ph.gift,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text('${prize?.title}'),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '${prize?.qty} ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.teal,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' ${prize?.qtyUnit}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      Divider(color: Colors.lime, thickness: 2),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Text.rich(
                          TextSpan(
                            text: '$totalQty',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.teal,
                            ),
                            children: [
                              TextSpan(
                                text: ' Hadiah',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
