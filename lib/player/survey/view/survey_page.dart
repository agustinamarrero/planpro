import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SurveyView();
  }
}

class SurveyView extends StatelessWidget {
  const SurveyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PLANPROAppBar(
        textTitle: 'Encuesta',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _BodySurvey(),
            PLANPROOutlinedButton.primary(text: 'Enviar', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _BodySurvey extends StatelessWidget {
  const _BodySurvey({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TitleSurvey(),
        SizedBox(height: PLANPROSpacing.spaceUnit * 2),
        _SurveyRating(
          question: '¿Cómo te sientes hoy?',
        ),
        _SurveyRating(
          question: '¿Cómo te dormiste?',
        ),
        YesOrNoQuestion(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PLANPROSpacing.xxlg,
            vertical: PLANPROSpacing.md,
          ),
          child: Divider(),
        ),
        PLANPROMultilineInput(
          hintText: 'observaciones',
        ),
      ],
    );
  }
}

class _TitleSurvey extends StatelessWidget {
  const _TitleSurvey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Buen día!',
            style: PLANPROTextStyle.subtitle1
                .copyWith(fontWeight: FontWeight.w800, fontSize: 24),
          ),
          const SizedBox(height: PLANPROSpacing.spaceUnit),
          Text(
            'Realizar encuesta',
            style: PLANPROTextStyle.subtitle1
                .copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            'Siendo 1 mal y 5 excelente',
            style: PLANPROTextStyle.subtitle2
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _SurveyRating extends StatelessWidget {
  const _SurveyRating({
    required this.question,
  });

  final String question;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: PLANPROSpacing.spaceUnit,
            right: PLANPROSpacing.spaceUnit,
          ),
          child: Text(
            question,
            style: PLANPROTextStyle.subtitle1
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: PLANPROSpacing.spaceUnit),
        PLANPROSurveyRating(onRatingSelected: (value) {}),
        const SizedBox(height: PLANPROSpacing.spaceUnit * 2),
      ],
    );
  }
}

class YesOrNoQuestion extends StatelessWidget {
  const YesOrNoQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
          child: Text(
            'Como te sentis',
            style: PLANPROTextStyle.subtitle1
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        PLANPROSurveyRating.yesNo(onRatingSelected: (value) {}),
      ],
    );
  }
}
