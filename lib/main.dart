import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/push_and_replacement/push_and_replacement_learn.dart';
import 'package:flutter_samples/input_widgets/lesson3/stepper/stepper_learn.dart';

import 'basic_widgets/lesson3/custom_scroll_view_learn/customscroll_view_learn.dart';

/// HER LESSON DOSYADA BULUNAN CLASS'I [home] İÇERSİNDE KULLANIP ÖRNEKLERİ GÖREBİLİRSİNİZ.
/// TAMAMLANDIĞINDA TÜM LESSON'LAR İÇİN İSİMLENDİRİLMİŞ ROUTER'LER İLE KULLANIMINI ENTEGRE EDECEĞİM.

void main() => runApp(const CourseApp());

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});
  @override
  Widget build(BuildContext context) {
    String title = 'This will take 92 hours.';
    return MaterialApp(
      routes: {
        /// Burda ya home parametresini kullanmayacağız, ya da [root] '/' olarak bu route'ı kullanmayacağız.
        // '/': (context) => const CourseApp(),
        /// [NamedRouteLearn] içinde bahsettiğimiz gibi,
        /// route'ların key'lerine ' / ' ile başlarız,
        /// key olarak bir String, value olarak içerisine bir context alan ve bir Widget dönderen yapı kullanırız.
        '/push_and_replacement': (context) => const PushAndReplacementLearn(),
        '/custom_scroll_view': (context) => const CustomScrollViewLearn(),
      },

      /// ? Burda [routes_learn] kısmında bahsettiğimiz onUnknownRoute ve onGenerateRoute parametrelerini kullanabileceğimiz,
      /// ? Bazı durumlardan bahsetmek gerekirse,
      /// ? Akıl karıştırmadan []
      /// ? Öncelikle onGenerateRoute ile tıpkı [routes] gibi bir yapı kullanırız.
      /// ? Fakat bu bizden {Route<dynamic>? Function(RouteSettings)? onUnknownRoute} şeklinde bir yapı bekliyor,
      /// ? Bu yapı bizim [routes] ile kontrol edemeyeceğimiz özellikleri kontrol etmemize olanak sağlar,
      /// ? Ve sayfadan sayfaya veri gönderip alabilmemizi sağlayan [RouteSettings] kullanabiliriz.
      /// ? Cookbook [https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments]
      /// -------------------------------------------------------------------------------------------------------
      /// ? [onUnknownRoute] parametresi, sayfa bulunamadığında ne yapacağını belirten bir yapıdır.
      /// ? İşleyiş olarak şöyle düşünebiliriz. [routes] --> [onGenerateRoute] --> [onUnknownRoute]
      theme: ThemeData(
        /// I like M3.
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          color: Colors.red,
        ),
        primarySwatch: Colors.red,
      ),
      title: title,
      home: const StepperLearn(),
    );
  }
}
