import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

class DriverAccountsModal extends StatefulWidget {
  const DriverAccountsModal({Key? key}) : super(key: key);

  @override
  _DriverAccountsModalState createState() => _DriverAccountsModalState();
}

class _DriverAccountsModalState extends State<DriverAccountsModal> {
  String? assignedDriver;

  final List<String> driverAccounts = [
    "Yasmine Al-Mansouri",
    "Ahmad Farid",
    "Layla Hassan",
    "Nour Ibrahim",
    "Omar Khalifa",
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                'Switch Account',
                style: AppFonts.title4(color: AppColors.grayscale90),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: driverAccounts.map((driveraccount) {
                    bool isSelected = assignedDriver == driveraccount;
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    'Confirm Selection',
                                    style: AppFonts.title4(
                                        color: AppColors.grayscale90),
                                  ),
                                  content: Text(
                                    'Are you sure you want to switch to $driveraccount?',
                                    style: AppFonts.body1(
                                        color: AppColors.grayscale70),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        isSelected = false;
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: AppFonts.body1(
                                            color: AppColors.grayscale80),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          assignedDriver = driveraccount;
                                        });
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: AppFonts.body1(
                                            color: AppColors.primary40),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.064, // Adjust the width as needed
                                height: MediaQuery.of(context).size.width *
                                    0.064, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary20
                                        : AppColors.grayscale30,
                                    width: isSelected ? 6.0 : 1.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                driveraccount,
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        'Confirm Deletion',
                                        style: AppFonts.title4(
                                            color: AppColors.grayscale90),
                                      ),
                                      content: Text(
                                        'Are you sure you want to delete $driveraccount?',
                                        style: AppFonts.body1(
                                            color: AppColors.grayscale70),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            isSelected = false;
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: AppFonts.body1(
                                                color: AppColors.grayscale80),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              driverAccounts
                                                  .remove(driveraccount);
                                              if (assignedDriver ==
                                                  driveraccount) {
                                                assignedDriver = null;
                                              }
                                            });
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text(
                                            'Delete',
                                            style: AppFonts.body1(
                                                color: AppColors.error100),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.delete_outlined,
                                color: AppColors.error100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AddNewAddress()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary50,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Add New Account',
                    style: AppFonts.body1(color: AppColors.grayscale0),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
