import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import 'Lists.dart';
import 'community_avatars.dart';

import 'product_details_page.dart';
import 'vendors_avatars.dart';

class MarketplaceAnimal extends StatefulWidget {
  const MarketplaceAnimal({Key? key}) : super(key: key);

  @override
  State<MarketplaceAnimal> createState() => _MarketplaceAnimalState();
}

class _MarketplaceAnimalState extends State<MarketplaceAnimal> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15), // Add spacing between the boxes

          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 22 / 8,
                  viewportFraction: 1.0,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: animaladvertisements.map((ad) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                          child: Image.asset(
                            ad,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: animaladvertisements.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? AppColors.primary50
                          : AppColors.grayscale10,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Top Vendors',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                animalVendorData.length,
                (index) => AnimalVendorAvatars(
                  imageAsset: animalVendorData[index]['imageAsset'],
                  name: animalVendorData[index]['name'],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Community Help',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                CharityOrgData.length,
                (index) => CommunityAvatars(
                  imageAsset: CharityOrgData[index]['imageAsset'],
                  name: CharityOrgData[index]['name'],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Catalog',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        color: AppColors.primary50,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Filters',
                          style: AppFonts.body1(color: AppColors.primary40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // Adjust aspect ratio as needed
              ),
              itemCount: AnimalList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final animal = AnimalList[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(index: index),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors
                              .grayscale10, // Background color for the container
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Image at the top of the container
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(animal.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // Content (text) below the image
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          animal.animalName,
                                          style: AppFonts.caption1(
                                              color: AppColors.grayscale100),
                                        ),
                                        const Spacer(),
                                        Text(
                                          animal.animalAge,
                                          style: AppFonts.caption2(
                                              color: AppColors.grayscale90),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      animal.gender,
                                      style: AppFonts.caption2(
                                          color: AppColors.grayscale90),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          animal.discountedPrice,
                                          style: AppFonts.headline3(
                                              color: AppColors.primary40),
                                        ),
                                        const SizedBox(width: 3),
                                        const Text(
                                          '\$100',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grayscale50,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(Icons.star,
                                            color: AppColors.secondary50),
                                        const SizedBox(width: 5),
                                        Text(animal.rating.toString(),
                                            style: AppFonts.caption2(
                                                color: AppColors.grayscale90)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
