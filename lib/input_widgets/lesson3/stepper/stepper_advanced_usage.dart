import 'package:flutter/material.dart';

/// Bu kısımda Stepper kullanarak biraz daha ileri seviye kullanımını öğrenelim.

class StepperAdvancedLearn extends StatefulWidget {
  const StepperAdvancedLearn({Key? key}) : super(key: key);

  @override
  State<StepperAdvancedLearn> createState() => _StepperAdvancedLearnState();
}

class _StepperAdvancedLearnState extends State<StepperAdvancedLearn> {
  String? userName, email, password;
  bool error = false;
  int currentIndex = 0;
  final _formKey0 = GlobalKey<FormFieldState>();
  final _formKey1 = GlobalKey<FormFieldState>();
  final _formKey2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    /// Ilk olarak içerisinde bize Step listesi dönderen bir method yazdık.
    List<Step> allSteps = stepList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Advanced'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          /// onStepTapped parametresi biz validation kullanacağımız için,
          /// problem yaşatabileceği için kullanmıyoruz.
          /// Bunun yerine onStepContinue ve onStepComplete parametresini kullanıyoruz.
          onStepContinue: () {
            setState(() {
              /// Burda Continue butonuna tıklandığında,
              /// Çalışacak kontrol methodunu çağırıyoruz.
              continueButtonControl();
            });
          },
          onStepCancel: (() {
            setState(() {
              /// Burda Cancel butonuna tıklandığında, [currentIndex] değerini kontorol ederek bir önceki step'e gönderiyoruz.
              currentIndex > 0 ? currentIndex-- : currentIndex;
            });
          }),
          steps: allSteps,
          currentStep: currentIndex,
        ),
      ),
    );
  }

  /// Reusable olması için bir method yazdık.
  List<Step> stepList() {
    return [
      /// Bize [Step] dönderecek bir method yazdık.
      stepCreator(
        key: _formKey0,
        state: _stepState(0),
        title: 'Step 1',
        label: 'User Name',
        hint: 'Enter your user name',
        onSaved: ((newValue) => userName = newValue),
        validator: ((value) {
          if (value!.isEmpty || value.length < 3) {
            return 'User name must be at least 3 characters long';
          }
        }),
      ),
      stepCreator(
        key: _formKey1,
        state: _stepState(1),
        title: 'Step 2',
        label: 'Email',
        hint: 'Enter your email',
        onSaved: ((newValue) => email = newValue),
        validator: ((value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email';
          }
        }),
      ),
      stepCreator(
        key: _formKey2,
        state: _stepState(2),
        title: 'Step 3',
        label: 'Password',
        hint: 'Enter your password',
        onSaved: ((newValue) => password = newValue),
        validator: ((value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
        }),
      ),
    ];
  }

  Step stepCreator({
    Key? key,
    required String title,
    required String label,
    required String hint,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
    required StepState state,
  }) {
    return Step(
      state: state,
      title: Text(title),
      content: TextFormField(
        onSaved: onSaved,
        key: key,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      isActive: true,
    );
  }

  StepState _stepState(int stateIndex) {
    /// Bu method, [currentIndex] değerini [stateIndex] ile kendi değeri ile karşılaştırıyor.
    /// Ve eğer değerler eşit ise ve [error] değeri false ise,tekrar bir kontrole girip ,
    /// [currentIndex], [stateIndex]'ten büyükse [StepState.complete] çünkü bu step'i tamamlamış sayılıyor.
    /// Eğer [currentIndex] değeri [stateIndex]'den küçükse [StepState.indexed] çünkü bu step'i tamamlamamış sayılıyor.
    /// Eğer değerler eşit değilse ve [error] değeri true ise, kontorlleri tamamlamadığı için [StepState.error] döndürüyor.
    return currentIndex == stateIndex
        ? error
            ? StepState.error
            : StepState.editing
        : currentIndex > stateIndex
            ? StepState.complete
            : StepState.indexed;
  }

  void continueButtonControl() {
    /// Bu methodda is eğer [currentIndex] değerine göre o step'e ait formun validasyonunu kontrol ediyoruz.
    /// Ve [GlobalKey]'leri kullanarak o formun state'ine erişerek kontrol edebiliyoruz.
    switch (currentIndex) {
      case 0:
        if (_formKey0.currentState!.validate() &&
            currentIndex < stepList().length - 1) {
          /// Eğer formun validasyonu tamamlandı ve [currentIndex] değeri step listemizin lenght'den küçükse,
          /// [currentIndex]'i bir artırıyoruz. Bir sonraki [Step]'e geçmek için.
          /// Ve her ihtimale karşı [error] değeri false yapıyoruz. Daha önceden değişmiş olabilir çünkü.
          _formKey0.currentState!.save();
          error = false;
          currentIndex++;
        } else {
          /// Eğer formun validasyonu tamamlanmadı ise, [error] değeri true yapıyoruz.
          /// Bu durumda bir sonraki Step'e geçemememizi sağlıyor.
          error = true;
        }
        break;
      case 1:
        if (_formKey1.currentState!.validate() &&
            currentIndex < stepList().length - 1) {
          _formKey1.currentState!.save();
          error = false;
          currentIndex++;
        } else {
          error = true;
        }
        break;
      case 2:
        if (_formKey2.currentState!.validate() &&
            currentIndex == stepList().length - 1) {
          setState(() {});
          _formKey2.currentState!.save();
          error = false;
          successInfo();
        } else {
          error = true;
        }
        break;
    }
  }

  Future<dynamic> successInfo() {
    /// Bu dialog penceresi ile de son [Step]'e geçtiğimizde,
    /// Yani [continueButtonControl] içindeki son case'de çağırıyoruz,
    /// Ve [successDialog] methodu ile ekranda bir adımları tamamladığımıza dair bir pencere çıkıyor.
    return showDialog(
        context: context,
        builder: (contextof) => AlertDialog(
              title: const Text('Success'),
              content: const Text('You have successfully registered'),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
