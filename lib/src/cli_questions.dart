import 'package:dcli/dcli.dart';

class CliQuestions {
  void continueWithDefaultConfig() {
    final result = menu(
      prompt:
          "Hi, I don't found before_publish.json so I created it for you so start Editing it and continue by typing 1 and click enter ",
      options: [
        'Go on',
      ],
    );

  }
}
