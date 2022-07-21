// ignore_for_file: curly_braces_in_flow_control_structures

///  Stepper widget ile adım adım kullacıdan bilgi alabilir veya talimat gösterebiliriz.
///

import 'package:flutter/material.dart';

class StepperLearn extends StatefulWidget {
  const StepperLearn({Key? key}) : super(key: key);

  @override
  State<StepperLearn> createState() => _StepperLearnState();
}

class _StepperLearnState extends State<StepperLearn> {
  int currentIndex = 0;
  final List<Step> _steps = const [
    /// [Step] widget'ini incelemek istersek
    Step(
      /// [title] parametresi, adını gösterir.
      title: Text('Step 1'),

      /// [content] parametresi, içeriğini gösterir.
      content: Text('This is the first step'),

      /// [isActive] parametresi, aktif olup olmadığını belirler.
      /// Aşağıda [isActive] parametresini kullanarak sonraki adımın aktifliğini kullanarak,
      /// Bir kontrol yaptık.
      isActive: true,

      /// [state] parametresi, ise o adımın durumunu gösterir.
      state: StepState.complete,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('This is the second step'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('This is the third step'),
      isActive: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Kullanımı'),
      ),
      body: Center(
        child: Stepper(
          /// [steps] parametresi, bizden içerisinde [Step] widget'ler bulunan bir Liste bekler.
          steps: _steps,

          /// [currentStep] parametresi, bizden o anki adımın indexini bekler.
          currentStep: currentIndex,

          /// [onStepTapped] parametresi, bizden bir adıma tıklandığında ne olacakğını bekleyen,
          /// Ve içinde bir o an ki tıklanan [Step]'in parametre olarak indexini verir.
          onStepTapped: (int i) {
            setState(() {
              _steps[i].isActive ? currentIndex = i : null;
            });
          },

          /// [onStepContinue] ve [onStepCancel] parametresi, bizden bir adımın devamını ve iptal durumlarına has iki adet button verir
          /// Ve bu butonlara basıldığında ne olmasını istediğimiz ele alan bir callback alır.
          onStepCancel: () => setState(() {
            /// Burda daha önce tanımladığımız bir değişkeni kullanarak,
            /// Bir kontrol yaparak,[_currentIndex]', güncelleyerek bir önceki stepe gidiyoruz.
            (_steps[currentIndex].isActive && currentIndex > 0)
                ? currentIndex--
                : null;
          }),
          onStepContinue: () {
            /// Tıpkı [onStepCancel] parametresiyle aynı şekilde bir kontrol yaparak, bir sonraki stepe gidiyoruz.
            setState(() {
              (currentIndex < _steps.length - 1 &&
                      _steps[currentIndex + 1].isActive)
                  ? currentIndex++
                  : null;
            });
          },
        ),
      ),
    );
  }
}
