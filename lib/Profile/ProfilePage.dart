import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/AboutApp/AboutApp.dart';
import 'package:hathera_demo/Profile/AppSettings/AppSettings.dart';
import 'package:hathera_demo/Profile/AuthorizationMethods/AuthorizationMethodsPage.dart';
import 'package:hathera_demo/Profile/Collaboration/ListOfStaff.dart';
import 'package:hathera_demo/Profile/CustomerSupport/CustomerSupport.dart';
import 'package:hathera_demo/Profile/NotificationSettings/NotificationsPause.dart';
import 'package:hathera_demo/Profile/PaymentMethods/PaymentPage.dart';
import 'package:hathera_demo/Profile/PrivacySecurity/PrivacySecurityPage.dart';
import 'package:hathera_demo/Profile/EditProfileInformation.dart';
import 'package:hathera_demo/Profile/Subscription/Subscription.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
  }

  Future<void> fetchDataFromBackend() async {
    // Simulate fetching data from the backend
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final firstName = ref.watch(firstNameProvider);
    final lastName = ref.watch(lastNameProvider);
    final email = ref.watch(emailProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final selectedCountryCode = ref.watch(selectedCountryCodeProvider);
    final profilePicture = ref.watch(proflePictureProvider);
    final emailAddressVisibility = ref.watch(emailAddressVisibilityProvider);
    final phoneNumberVisibility = ref.watch(phoneNumberVisibilityProvider);
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile'.tr,
          style: AppFonts.title3(color: AppColors.grayscale90),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileInformation(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Image(
                  image: AssetImage(
                      'assets/icons/frame/24px/edit_icon_button.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 16 * widthMediaQuery, right: 16 * widthMediaQuery),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 40 * heightMediaQuery),
                    CircleAvatar(
                      backgroundColor: AppColors.grayscale10,
                      radius: 60 * widthMediaQuery,
                      backgroundImage: profilePicture != null
                          ? FileImage(profilePicture)
                          : null,
                      child: profilePicture == null
                          ? Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: AppColors.grayscale90,
                            )
                          : null,
                    ),
                    SizedBox(
                      height: 16 * heightMediaQuery,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              firstName.tr,
                              style:
                                  AppFonts.title4(color: AppColors.grayscale90),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              lastName.tr,
                              style:
                                  AppFonts.title4(color: AppColors.grayscale90),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '123-456-7890'.tr,
                          style: AppFonts.body2(color: AppColors.grayscale70),
                        ),
                        SizedBox(height: 16 * heightMediaQuery),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (emailAddressVisibility) // Check if email visibility is true
                                Text(
                                  email,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              if (phoneNumberVisibility)
                                Row(
                                  children: [
                                    Text(
                                      selectedCountryCode.tr,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      '-',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      phoneNumber.tr,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ), // Check if email visibility is true
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Head of Farm'.tr,
                      style: AppFonts.body2(color: AppColors.grayscale70),
                    ),
                    SizedBox(height: 32 * heightMediaQuery),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListOfStaff()),
                          );
                          // Add function of the button below
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 36, 86, 38),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Collaboration'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F5EC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '24',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Animals'.tr,
                                  style: AppFonts.caption2(
                                      color: AppColors.grayscale70),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1',
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Farm'.tr,
                                style: AppFonts.caption2(
                                    color: AppColors.grayscale70),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4',
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Collaborations'.tr,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Accounts',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AuthorizationMethodsPage()),
                        );
                      }),
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.payment_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Payment Methods',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                        );
                      }),
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.star_outline_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Subscriptions',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubscriptionPage()),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Notifications',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingsPage()),
                        );
                      }),
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.lock_outline,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'Privacy and Security',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PrivacySecurityPage()),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.settings_outlined,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'App Settings',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppSettings()),
                        );
                      }),
                  ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6 * widthMediaQuery),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayscale0,
                        ),
                        child: const Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.primary30,
                        ),
                      ),
                      title: Text(
                        'About App',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutApp()),
                        );
                      }),
                  ListTile(
                      leading: Container(
                          padding: EdgeInsets.all(6 * widthMediaQuery),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayscale0,
                          ),
                          child: const Icon(Icons.contact_support_outlined,
                              color: AppColors.primary30)),
                      title: Text(
                        'Customer Support',
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerSupport()),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(6 * widthMediaQuery),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grayscale0,
                      ),
                      child: const Icon(Icons.logout_rounded,
                          color: AppColors.grayscale90),
                    ),
                    title: Text(
                      'Sign Out',
                      style: AppFonts.body2(color: AppColors.error100),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        showDragHandle: true,
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sign Out?'.tr,
                                  style: AppFonts.title3(
                                      color: AppColors.grayscale90),
                                ),
                                SizedBox(height: 32 * heightMediaQuery),
                                SizedBox(
                                  height: 52 * heightMediaQuery,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          255, 232, 232, 232),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Text(
                                      'Yes'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 52 * heightMediaQuery,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          255, 232, 232, 232),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Text(
                                      'Cancel'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
