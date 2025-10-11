import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:tktw_test_app/pages/bloc/get_store_by_id/get_store_by_id_bloc.dart';
import 'package:tktw_test_app/widgets/store_card.dart';

import '../widgets/total_prize_dialog.dart';
import 'bloc/get_store/get_store_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedStoreId;

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() {
    setState(() {
      selectedStoreId = null;
    });
    return Future.microtask(() {
      if (mounted) {
        context.read<GetStoreBloc>().add(GetStoreEvent.getAllStores());
        context.read<GetStoreByIdBloc>().add(GetStoreByIdEvent.getStoreById());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return fetchAllData();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<GetStoreBloc, GetStoreState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return DropdownButtonFormField<int>(
                                dropdownColor: Colors.white,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                items: [
                                  DropdownMenuItem<int>(
                                    value: null,
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
                                          'Semua Toko',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onChanged: (value) {},
                              );
                            },
                            loaded: (data) {
                              return DropdownButtonFormField<int>(
                                dropdownColor: Colors.white,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                items: [
                                  DropdownMenuItem<int>(
                                    value: null,
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
                                          'Semua Toko',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ...data.data!.map((store) {
                                    return DropdownMenuItem<int>(
                                      value: store.id,
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
                                            '${store.name}',
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedStoreId = value;
                                  });
                                  if (value != null) {
                                    context.read<GetStoreByIdBloc>().add(
                                      GetStoreByIdEvent.getStoreById(id: value),
                                    );
                                  } else {
                                    context.read<GetStoreByIdBloc>().add(
                                      GetStoreByIdEvent.getStoreById(),
                                    );
                                  }
                                },
                              );
                            },
                          );
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
                child: BlocBuilder<GetStoreByIdBloc, GetStoreByIdState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => Center(child: CircularProgressIndicator()),
                      loaded: (data) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.data?.length,
                          itemBuilder: (context, index) {
                            final store = data.data![index];
                            return StoreCard(store: store);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
