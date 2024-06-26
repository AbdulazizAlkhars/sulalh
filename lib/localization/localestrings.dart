import 'package:get/get.dart';

class LocalStrings extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        // English Language
        'en_US': {
          'Hello': 'Hello World',
          'Message': ' Welocome to Sulalh',
          'ChangeLang': 'Change Language',
          'SearchFarms': 'Search For Farms',
          'SearchAnimals': 'Search For Aniamls',
          'Findfarms': 'Find Farms',
          'Findanimals': 'Find Animals',
          'Wannajoin': 'Want To Start Your Farm Right Now & Join',
          'Joinnow': 'Join Now',
          'SignIn': 'Sign In',
          'Welcome': 'Welcome'
        },
        // Hindi Language
        'hi_IN': {
          'Hello': 'हैलो वर्ल्ड',
          'Message': 'सलालाह में आपका स्वागत है',
          'ChangeLang': 'भाषा बदलें',
          'SearchFarms': 'खेतों की खोज करें',
          'SearchAnimals': 'जानवरों की खोज करें',
          'Findfarms': 'फार्म खोजें',
          'Findanimals': 'पशु खोजें',
          'Wannajoin': 'अभी अपना फार्म शुरू करना चाहते हैं और जुड़ना चाहते हैं',
          'Joinnow': 'अब शामिल हों',
          'SignIn': 'दाखिल करना',
          'Welcome': 'स्वागत'
        },
        // Arabic Language
        'ar_SA': {
          // signup page localstrings starts
          'Welcome To': 'مرحبا بكم',
          'Hathera!': ' في هاثيرا',
          'Continue': 'يكمل',
          'Enter Phone Number': 'أدخل رقم الهاتف',
          '+971': '+٩٧١',
          '+966': '+٩٦٦',
          '+965': '+٩٦٥',
          '+964': '+٩٦٤',
          '+975': '+٩٧٥',
          '+976': '+٩٧٦',
          'Continue With Apple': 'تواصل مع أبل',
          'Continue With Google': 'تواصل مع جوجل',
          'Use Email Address': 'استخدم عنوان البريد الإلكتروني',
          'Enter Email': 'أدخل البريد الإلكتروني',
          'Use Phone Number': 'استخدم رقم الهاتف',
          'Enter Code': 'ادخل الرمز',
          'We sent a verification code to the following':
              'قمنا بإرسال رمز التحقق إلى التالي',
          'Phone Number:': 'رقم التليفون',
          'Send New Code:': 'إرسال رمز جديد',
          'Confirm': 'يتأكد',
          'Email ID:': 'عنوان الايميل:',
          'Create Password': 'إنشاء كلمة المرور',
          'Password': 'كلمة المرور',
          'Confirm Password': 'تأكيد كلمة المرور',
          "Passwords don't match": 'كلمة المرور غير مطابقة',
          // signup page localstrings ends
          //Account Setup - Profile Page Localstrings Starts
          'Add Personal Information': 'إضافة معلومات شخصية',
          "What's your name?": 'ما اسمك؟',
          'Enter First Name': 'أدخل الاسم الأول',
          'Enter Last Name': 'إدخال اسم آخر',
          'Contacts': 'جهات الاتصال',
          'Add contact details to help other people contact you for collaboration':
              'أضف تفاصيل الاتصال لمساعدة الأشخاص الآخرين على الاتصال بك للتعاون',
          'Email': 'بريد إلكتروني',
          'Phone Number': 'رقم التليفون',
          'Camera': 'آلة تصوير',
          'Gallery': 'صالة عرض',
          'Skip For Now': 'تخطي في الوقت الراهن',
          'Add Some Details': 'أضف بعض التفاصيل',
          'Add Profile Photo': 'إضافة صورة الشخصي',
          "What's your address?": 'ما هو عنوانك؟',
          'City': 'المدينة',
          'Add Photo': 'أضف صورة',
          // Account Setup - Profile Page Localstrings ends
          // Profile Main Page Starts
          'Profile': 'الملف الشخصي',
          'Edit Profile Information': 'تعديل معلومات الملف الشخصي',
          'John Smith': 'جون سميث',
          '123-456-7890': '123-456-7890',
          'Collaboration': 'التعاون',
          'Animals': 'الحيوانات',
          'Farm': 'المزرعة',
          'Head of Farm': 'رئيس المزرعة',
          'Collaborations': 'التعاون',
          'Accounts': 'الحسابات',
          'Payment Methods': 'طرق الدفع',
          'Subscriptions': 'الاشتراكات',
          'Notifications': 'الإشعارات',
          'Privacy and Security': 'الخصوصية والأمان',
          'App Settings': 'إعدادات التطبيق',
          'About App': 'حول التطبيق',
          'Customer Support': 'دعم العملاء',
          'Sign Out': 'تسجيل الخروج',
          'Sign Out?': 'هل تريد تسجيل الخروج؟',
          'Yes': 'نعم',
          'Cancel': 'إلغاء',
          'Head Of Farm': "رئيس المزرعة",
          // Profile Main Page Ends
          // Edit Profile Page Starts
          'Edit Personal Information': 'تعديل المعلومات الشخصية',
          'Change Photo': 'تغيير الصورة',
          'General Info': 'معلومات عامة',
          'First Name': 'الاسم الأول',
          'Second Name': 'الاسم الثاني',
          'Contact Details': 'تفاصيل الاتصال',
          'Email Address': 'عنوان البريد الإلكتروني',
          'Address': 'العنوان',
          'Save Changes': 'حفظ التغييرات',
          'Delete Avatar': 'احذف الصورة الرمزية',
          // Edit Profile Page Ends
// About App Starts
          'Version Of The App: 0.1.12': 'إصدار التطبيق: 0.1.12',
          'Terms Of Use': 'شروط الاستخدام',
          'Privacy Policy': 'سياسة الخصوصية',
// About App Ends
// AppSettings Starts
          'Language Of The App': 'لغة التطبيق',
          'English': 'الإنجليزية',
          'Arabic': 'عربي',
          'French': 'الفرنسية',
          'Save': 'حفظ',
          'Language': 'اللغة',
// App Setting Ends
// Bottom NB Screen Starts
          'Home': 'الصفحة الرئيسية',
// Bottom NB Screen Ends
//List Of Staff -  Collaboration Starts
          'Invite A Member': 'دعوة عضو',
          'Share this link that will provide users access to your farm':
              'شارك هذا الرابط الذي سيوفر للمستخدمين الوصول إلى مزرعتك',
          'Copy Link': 'نسخ الرابط',
          'Your Staff': 'موظفيك',
          'Paul Rivera': 'بول ريفيرا',
          'Rebecca Wilson': 'ريبيكا ويلسون',
          'Patricia Williams': 'باتريشيا ويليامز',
          'Scott Simmons': 'سكوت سيمونز',
          'Lee Hall': 'لي هال', 'Helper': 'مساعد',
          'Worker': 'عامل',
          'Viewer': 'مشاهد',
          'Link Copied To Clipboard': 'تم نسخ الرابط إلى الحافظة',
          'Share Link': 'مشاركة الرابط',
// List Of Staff - Collaboration Ends
// Staff Details - Collaboration Starts
          'Member Of Your Staff': 'عضو في فريق العمل الخاص بك',
          'Delete Member?': 'حذف العضو؟',
          'Delete the member from your staffs?':
              "حذف العضو من فريق العمل الخاص بك؟",
          'This act can not be undone': "لا يمكن التراجع عن هذا الإجراء",
          'Delete': 'حذف',
          'Manage Permissions': 'إدارة الصلاحيات',
          'Role': 'الدور',
          'When the staff member is given permission to edit, they can add/edit data':
              'عندما يتم منح عضو الفريق الإذن بالتحرير، يمكنه إضافة/تعديل البيانات',
          'What Info Can This Member Edit?':
              'ما هي المعلومات التي يمكن لهذا العضو تحريرها؟',
          'Breeding Info': 'معلومات التربية',
          'Medical Info': 'معلومات طبية',
          'View Only': 'للاطلاع فقط',
          'Member Permissions': "صلاحيات العضو",
// Staff Details - Collaboration Ends
// Customer Support Starts
          'FAQs': 'الأسئلة الشائعة',
          'Question #1': 'سؤال #1',
          'Subtitle': 'عنوان فرعي',
          'Question #2': 'سؤال #2',
          'Question #3': 'سؤال #3',
          'Question #4': 'سؤال #4',
          'Question #5': 'سؤال #5',
          'WhatsApp': 'واتساب',
          'Chat With Support': 'الدردشة مع الدعم',
          '+965 96721717': '+965 96721717',
          'Call Us': 'اتصل بنا',
          'Contact Us': 'اتصل بنا',
          'Need Help': 'تحتاج إلى مساعدة',
// Customer Support Ends
// Notification Settings Starts
          'Pause All': 'إيقاف الكل',
          'System Notifications': 'إشعارات النظام',
          'Animal Management': 'إدارة الحيوانات',
// Notification Starts Ends
// Privacy & Security Starts
          'Privacy & Security': 'الخصوصية والأمان',
          'Allow Collaboration': 'السماح بالتعاون',
          'Show List Of Animals': 'عرض قائمة الحيوانات',
          'Show Family Tree': 'عرض شجرة العائلة',
          'Contact Information': 'معلومات الاتصال',
          'Show Contact Information': 'عرض معلومات الاتصال',
// Privacy & Security Ends
          'Hello': 'مرحبا بالعالم',
          'Message': 'مرحبا بكم في صلالة',
          'ChangeLang': 'تغيير اللغة',
          'SearchFarms': 'ابحث عن مزارع',
          'SearchAnimals': 'ابحث عن الحيوانات',
          'Findfarms': 'البحث عن مزارع',
          'Findanimals': 'البحث عن الحيوانات',
          'Wannajoin': 'تريد أن تبدأ مزرعتك الآن والانضمام',
          'Joinnow': 'نضم الان',
          'SignIn': 'تسجيل الدخول',
          'Welcome': 'مرحباً',
          // Animal General Info Page Starts
          'My Farm': 'مزرعتي',
          'General': 'عام',
          'Breeding': 'تربية',
          'Medical': 'طبي',
          'Type': 'نوع',
          'Species': 'صِنف',
          'Sex': 'الجنس',
          'General Information': 'معلومات عامة',
          'Age': 'عمر',
          'Breed': 'تكاثر',
          'Date Of Hatching': "تاريخ الفقس",
          'Date Of Sale': 'الموعد للبيع',
          'Addtional Notes': 'ملاحظات إضافية',
          // Animal General Info Page Ends
          //  Create Animal Starts
          'Create': "يخلق",
          'Animal': 'حيوان',
          'Create Animal': "إنشاء حيوان",
          'Animal Type': "نوع الحيوان",
          'Mammal': 'الحيوان الثديي',
          'Oviparous': 'بياض',
          'Animal Species': "أنواع الحيوانات",
          'Animal Breeds': "السلالات الحيوانية",
          'Chosen Options': "الخيارات المختارة",
          'You can apply any changes': "يمكنك تطبيق أي تغييرات",
          'Name': 'اسم',
          'Enter Name': 'أدخل الاسم',
          'Family Tree': 'شجرة العائلة',
          "Add Parents If They're In The System":
              "أضف أولياء الأمور إذا كانوا في النظام",
          'Add Parents': "إضافة أولياء الأمور",
          'Sire (Father)': "سيدي (الأب)",
          'Dam (Mother)': "السد (الأم)",
          "Animal Sex": "الجنس الحيواني",
          'Add Children': "إضافة أطفال",
          'Unknown': 'غير معروف',
          'Male': 'رجل',
          'Female': 'أنثى',
          'Dates': 'تاريخ',
          'Date Of Birth': 'تاريخ الميلاد',
          'Add': 'يضيف',
          'Add Tags +': "إضافة علامات +",
          "Add Tag": "إضافة علامة",
          'Custom': 'حسب الطلب',
          'Fields': 'حقول النص',
          'Additional Notes': 'ملاحظات إضافية',
          'Add Additional Information If Needed':
              "أضف معلومات إضافية إذا لزم الأمر",
          "Search By Name Or ID": "البحث بالاسم أو المعرف",
          'Show More >': "إظهار المزيد >",
          'Create ': 'يخلق ',
          'Add Date +': "إضافة تاريخ +",
          "Add Custom Fields": "إضافة حقول مخصصة",
          'Add Custom Field +': "إضافة حقل مخصص +",
          //  Create Animal Ends
// Registered HomePage Starts
          'Current State': 'الوضع الحالي',
          'Borrowed': 'استعار',
          'Adopted': 'مُتَبنى',
          'Donated': "تم التبرع",
          'Escaped': "هرب",
          'Stolen': 'مسروق',
          'Transferred': 'نقل',
          'Medical State': "الحالة الطبية",
          'Injured': 'مصاب',
          'Sick': 'مريض',
          'Quarantined': "معزول",
          'Medication': 'دواء',
          'Testing': 'اختبارات',
          'Others': 'آحرون',
          'Sold': 'مُباع',
          'Dead': 'ميت',
          'Clear All': 'امسح الكل',
          'Apply': 'يتقدم',
          'Overview': 'ملخص',
          'Upcoming Events': 'الأحداث القادمة',

          // MarketPlace Starts From here

          'Sulala': 'سلالة', 'My Animal': 'حيواني',
          "Search Anything": "ابحث عن أي شيء",
          'Category Filters': 'مرشحات الفئة',
          'Top Shops': 'أفضل المتاجر',
          'View All': 'عرض الكل', 'Brands': 'العلامات التجارية',
          'Previously Bought For': 'تم الشراء سابقًا لـ',
          'See More': 'عرض المزيد', 'Catalog': 'الكتالوج',

          'Top Products For': 'أفضل المنتجات لـ', 'Filters': 'مرشحات',
          //categories
          'Food & Treats': 'الطعام والحلويات',
          'Toys': 'الألعاب',
          'Health & Wellness': 'الصحة والعافية',
          'Cleaning & Hygiene': 'التنظيف والنظافة',
          'Carriers & Crates': 'الحمالات والصناديق',
          'Housing & Habitat': 'السكن والموئل',
          'Identification & Safety': 'التعريف والسلامة',
          'Speciality Items': 'العناصر المتخصصة',
          //subcategories
          'Dry Food': 'الطعام الجاف',
          'Wet Food': 'الطعام الرطب',
          'Bird Feed': 'طعام الطيور',
          'Fish Feed': 'طعام الأسماك',
          'Natural Food': 'طعام طبيعي',
          'Others': 'آخر',
          'Chew Toys': 'ألعاب للمضغ',
          'Interactive': 'تفاعلية',
          'Balls': 'كرات',
          'Stuffed Toys': 'ألعاب محشوة',
          'Puzzles': 'ألعاب ألغاز',
          'Medications': 'الأدوية',
          'Supplements': 'المكملات الغذائية',
          'First Aid': 'إسعافات أولية',
          'Vet Visits': 'زيارات الطبيب البيطري',
          'Dental': 'الأسنان',
          'Cleaners': 'منظفات',
          'Grooming': 'تجميل',
          'Waste Mgmt': 'إدارة النفايات',
          'Shampoos': 'الشامبو',
          'Deodorizers': 'معطرات الهواء',
          'Carriers': 'الحمالات',
          'Travel Kits': 'طقم السفر',
          'Safety Gear': 'معدات السلامة',
          'Water Bowls': 'أواني الماء',
          'Travel Beds': 'أسرة السفر',
          'Houses': 'المنازل',
          'Aquariums': 'أحواض السمك',
          'Cages': 'القفص',
          'Bedding': 'الفراش',
          'Terrariums': 'التراث',
          'Collars': 'الأطواق',
          'Tags': 'العلامات',
          'GPS Trackers': 'متتبعات GPS',
          'Leashes': 'المقاود',
          'Safety Vests': 'سترات السلامة',
          'Custom': 'مخصصة',
          'Unique Toys': 'ألعاب فريدة من نوعها',
          'Personalized': 'شخصية',
          'Seasonal Gifts': 'هدايا موسمية',
          'Special Diet': 'نظام غذائي خاص',
          //BrandsModal
          'Choose A Brand': 'اختر علامة تجارية',
          'Select Brand': 'حدد العلامة التجارية',
          'Search The Brand': 'ابحث عن العلامة التجارية',
          //vendors
          'Vendors': 'البائعون',
          'Have A Pet Business & Want To Sell On Sulala?\nPlease Click The Add Store Button On Top':
              'هل لديك عمل للحيوانات الأليفة وترغب في البيع على سولالا؟\nالرجاء النقر فوق زر إضافة المتجر في الأعلى',
          'List Of Shops': 'قائمة المتاجر',
          'Search': 'بحث', 'Top Rated': 'الأعلى تقييماً',
          'Verified': 'موثق',
          'New': 'جديد', 'View Shop': 'عرض المتجر',
          //shoptfilter
          'Filters': 'الفلاتر',
          'Apply Filters': 'تطبيق الفلاتر',
          'Animal': 'الحيوان',
          'Sort By': 'ترتيب حسب',
          'Shops': 'المتاجر',
          'Location': 'الموقع',
          'Price': 'السعر',
          'Reviews': 'التقييمات',
          'Cat': 'قطة',
          'Dog': 'كلب',
          'Cow': 'بقرة',
          'Horse': 'حصان',
          'Sheep': 'خروف',
          'Chicken': 'دجاجة',
          'Duck': 'بطة',
          'Price Range': 'نطاق السعر',
          'Min Price': 'الحد الأدنى للسعر',
          'Max Price': 'الحد الأقصى للسعر', 'Top Rated': 'أعلى التقييمات',
          'Growing': 'نمو',
          'New': 'جديد',
          'Above': 'فوق',
          'Stars': 'نجوم', 'Ascending': 'تصاعدي',
          'Descending': 'تنازلي', 'Al Ahmadi': 'الأحمدي',
          'Hawalli': 'حولي',
          'Farwaniya': 'الفروانية',
          'Al Asimah': 'العاصمة',
          'Jahra': 'الجهراء',
          'Mubarak Al-Kabeer': 'مبارك الكبير',
          'Fahaheel': 'الفحيحيل',
          'Mangaf': 'المنقف',
          'Mahboula': 'المهبولة',
          'Salmiya': 'السالمية',
          'Bayan': 'بيان',
          'Al-Farwaniyah': 'الفروانية',
          'Al-Rai': 'الراي',
          'Rabiya': 'الرابية',
          'Kuwait City': 'مدينة الكويت',
          'Dasma': 'الدسمة',
          'Qortuba': 'القرطبة',
          'Naseem': 'النسيم',
          'Qasr': 'القصر',
          'Al-Abdali': 'العبدلي',
          'Wafra': 'الوفرة',
          'Mutlaa': 'المطلع', 'Vendor Information': 'معلومات البائع',
          'Add a Review': 'أضف تقييم',
          'Reviews': 'التقييمات',
          'Orders': 'الطلبات',
          'Contact Details': 'بيانات الاتصال',
          'Facebook': 'فيسبوك',
          'Instagram': 'انستغرام',
          'Website': 'الموقع الإلكتروني',
          'Description': 'الوصف',
          'General Information': 'معلومات عامة',
          'Legal Address': 'العنوان القانوني',
          'View More': 'عرض المزيد',
          'View Products': 'عرض المنتجات', 'Categories': 'الفئات',
          'All Products For': 'كل المنتجات لـ', 'For': 'لـ',
          'Best Deals For': 'أفضل العروض لـ', 'Discount': 'خصم',
          'Deals': 'عروض',
          'Low To High': 'من الأدنى إلى الأعلى',
          'High To Low': 'من الأعلى إلى الأدنى',
          '10% Off or more': 'خصم 10% أو أكثر',
          '25% Off or more': 'خصم 25% أو أكثر',
          '35% Off or more': 'خصم 35% أو أكثر',
          '50% Off or more': 'خصم 50% أو أكثر',
          '60% Off or more': 'خصم 60% أو أكثر',
          '70% Off or more': 'خصم 70% أو أكثر',
          'Best Seller': 'الأفضل مبيعاً',
          'Sale': 'تخفيضات',
          'Promoted': 'مُعلَن', 'stars & above': 'نجوم وأكثر',
          //address
          'Change Address': 'تغيير العنوان',
          'Add New Address': 'إضافة عنوان جديد',
          'Select Address': 'اختر العنوان',
          'Address': 'العنوان',
          'Delivery On': 'التوصيل على',
          'Enter Address': 'أدخل العنوان',
          'Apartment, Suite etc.,': 'شقة، جناح، إلخ.',
          'Enter Apartment, Suite etc.,': 'أدخل الشقة، الجناح، إلخ.',
          'Additional Information': 'معلومات إضافية',
          'Enter Additional Information': 'أدخل معلومات إضافية',
          'Confirm Address': 'تأكيد العنوان',
          'Verify Address': 'تحقق من العنوان',
          //select your animal modal
          'Select Your Animal': 'اختر حيوانك',
          'Select Animal': 'اختر الحيوان',
          'Search The Animal': 'ابحث عن الحيوان',
          'List Of Your Animals': 'قائمة حيواناتك',
          'When you select animal from your list, all the products will be filtered based on your animal details!!':
              'عند اختيارك للحيوان من قائمة الحيوانات الخاصة بك، سيتم تصفية جميع المنتجات استنادًا إلى تفاصيل حيوانك!!',
          'Add Your Animal': 'أضف حيوانك',
          'No Animals Found In Your List':
              'لم يتم العثور على حيوانات في قائمتك',
          'Select By Species': 'حدد حسب الفصيلة',
          'If you do not have list of your animals, select by species of the animal to filter all the items based on the species!!':
              'إذا لم يكن لديك قائمة بحيواناتك، اختر حسب فصيلة الحيوان لتصفية جميع العناصر استنادًا إلى الفصيلة!!',
          'Select Breed': 'اختر السلالة',
          'Please select a species': 'يرجى تحديد فصيلة',
          //product cards
          'Bought Past Month': 'تم الشراء خلال الشهر الماضي',
          'Add To Cart': 'أضف إلى السلة',
          'Best Seller': 'الأكثر مبيعًا',
          'Sale': 'تخفيضات',
          'Promoted': 'مُروّج',
          '% Off': '٪ خصم',
          //cart
          'Cart': 'العربة',
          'Items In The Cart': 'العناصر في العربة',
          'Save Package': 'حفظ الحزمة',
          'Re-Order Your Packages': 'إعادة طلب الحزم الخاصة بك',
          'Total': 'الإجمالي',
          'Checkout': 'الشروع في الخروج',
          'KD': 'د.ك',
          "Delete The Package?": "هل أنت متأكد أنك تريد حذف هذه الحزمة؟",
          "Are you sure you want to delete this package?":
              "هل أنت متأكد أنك تريد حذف هذه الحزمة؟",
          "Cancel": "إلغاء",
          "Delete": "حذف",
          'Items In The Package': 'العناصر في الحزمة',
          'Select Delivery Date': 'اختر تاريخ التسليم',
          'You can select any day within the next 5 days for your delivery.':
              'يمكنك اختيار أي يوم خلال الأيام الخمسة القادمة لتسليم طلبك.',
          'Today,': 'اليوم،',
          'Your Order': 'طلبك',
          'Items': 'العناصر',
          'Discount': 'الخصم',
          'Delivery': 'التوصيل',
          'Free': 'مجاني',
          'Delivery Address': 'عنوان التسليم',
          'Schedule The Delivery': 'جدولة التسليم',
          'Cart Items': 'عناصر السلة',
          'Special Instruction (Optional)': 'تعليمات خاصة (اختياري)',
          'Enter Special Instructions': 'أدخل التعليمات الخاصة',
          'Payment Methods': 'طرق الدفع',
          'Credit Cards & Debit Cards': 'بطاقات الائتمان وبطاقات الخصم',
          'Add New Card': 'إضافة بطاقة جديدة',
          'Other Payment Methods:': 'طرق دفع أخرى:',
          'Pay': 'الدفع', 'Item': 'العنصر,'
        },
      };
}
