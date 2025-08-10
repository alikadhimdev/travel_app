import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/trip.dart';

class DataService {
  static const String _dataUrl =
      'https://raw.githubusercontent.com/alikadhimdev/data/refs/heads/main/app_data.json';

  static List<Category> _categories = [];
  static List<Trip> _trips = [];

  static List<Category> get categories => _categories;
  static List<Trip> get trips => _trips;

  static Future<void> loadData() async {
    try {
      final response = await http.get(Uri.parse(_dataUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // تحميل الفئات
        if (data['categories'] != null) {
          _categories = (data['categories'] as List)
              .map((categoryJson) => Category.fromJson(categoryJson))
              .toList();
        }

        // تحميل الرحلات
        if (data['trips'] != null) {
          _trips = (data['trips'] as List)
              .map((tripJson) => Trip.fromJson(tripJson))
              .toList();
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading data: $e');
      // في حالة فشل التحميل، استخدم البيانات الافتراضية
      _loadDefaultData();
    }
  }

  static void _loadDefaultData() {
    _categories = [
      Category(
        id: 'c1',
        title: 'جبال',
        imageUrl:
            'https://images.unsplash.com/photo-1575728252059-db43d03fc2de?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTh8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=',
      ),
      Category(
        id: 'c2',
        title: 'بحيرات',
        imageUrl:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
      Category(
        id: 'c3',
        title: 'شواطىء',
        imageUrl:
            'https://images.unsplash.com/photo-1493558103817-58b2924bce98?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      ),
    ];

    _trips = [
      Trip(
        id: 'm1',
        categories: ['c1'],
        title: 'جبال الألب',
        tripType: TripType.exploration,
        season: Season.winter,
        imageUrl:
            'https://images.unsplash.com/photo-1611523658822-385aa008324c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bmF0aW5zfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        duration: 20,
        activities: [
          'زيارة المواقع الأثرية',
          'جولة سياحية على الأقدام',
          'زيارة المراكز التجارية للتبضع',
          'تناول وجبة الغداء',
          'استمتاع المناظر الجملية',
        ],
        program: [
          'أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.',
          'يسكينج أليايت سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.',
          'لوريم ايبسوم دولار ات دولار ماجنا أليكيوا.',
        ],
        isInSummer: false,
        isForFamilies: true,
        isInWinter: true,
      ),
    ];
  }
}
