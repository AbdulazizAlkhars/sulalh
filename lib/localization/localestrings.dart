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
          'Welcome': 'مرحباً'
        },
      };
}