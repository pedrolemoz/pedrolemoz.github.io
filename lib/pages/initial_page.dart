import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../controllers/core/core_states.dart';
import '../controllers/person/person_bloc.dart';
import '../controllers/person/person_events.dart';
import '../controllers/person/person_states.dart';
import '../models/person_data_model.dart';
import '../packages/service_locator/service_locator.dart';
import '../widgets/expandable_button.dart';
import '../widgets/experience_card.dart';
import '../widgets/social_media_button.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final personBloc = ServiceLocator.getInstance<PersonBloc>();
  final scrollController = ScrollController();

  @override
  void initState() {
    personBloc.add(GetPersonDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: BlocBuilder<PersonBloc, IAppState>(
              bloc: personBloc,
              builder: (context, state) {
                if (state is InitialState || state is GettingPersonDataState) {
                  return const CircularProgressIndicator();
                }

                if (state is UnableToGetPersonDataState) {
                  return Text(
                    'Cannot get person data.\n\n${state.exception}',
                    style: textTheme.headlineMedium,
                  );
                }

                final personDataModel =
                    (state as SuccessfullyGotPersonDataState).personDataModel;

                return Row(
                  children: [
                    Flexible(
                      child: _LeftSide(
                        personDataModel: personDataModel,
                        scrollController: scrollController,
                      ),
                    ),
                    Flexible(
                      child: _RightSide(
                        personDataModel: personDataModel,
                        scrollController: scrollController,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _LeftSide extends StatelessWidget {
  final PersonDataModel personDataModel;
  final ScrollController scrollController;

  const _LeftSide({
    required this.personDataModel,
    required this.scrollController,
  });

  void _moveToOffset({required double offset}) {
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              personDataModel.fullName,
              style: textTheme.displayMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              personDataModel.bio,
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              personDataModel.shortDescription,
              style: textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandableButton(
              label: 'About',
              onClick: () => _moveToOffset(offset: 0),
            ),
            ExpandableButton(
              label: 'Experience',
              onClick: () {},
            ),
            ExpandableButton(
              label: 'Projects',
              onClick: () => _moveToOffset(offset: 2000),
            ),
          ],
        ),
        const Expanded(child: SizedBox(height: 16)),
        Row(
          children: [
            SocialMediaButton(
              icon: UniconsLine.github,
              onClick: () {},
            ),
            SocialMediaButton(
              icon: UniconsLine.linkedin,
              onClick: () {},
            ),
            SocialMediaButton(
              icon: UniconsLine.envelope,
              onClick: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _RightSide extends StatelessWidget {
  final PersonDataModel personDataModel;
  final ScrollController scrollController;

  const _RightSide({
    required this.personDataModel,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            personDataModel.fullDescription,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            itemCount: personDataModel.experiences.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 32,
            ),
            itemBuilder: (context, index) {
              final experienceModel =
                  personDataModel.experiences.elementAt(index);
              return ExperienceCard(experienceModel: experienceModel);
            },
          ),
        ],
      ),
    );
  }
}
