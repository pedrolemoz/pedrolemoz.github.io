import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/core/core_states.dart';
import '../controllers/person/person_bloc.dart';
import '../controllers/person/person_events.dart';
import '../controllers/person/person_states.dart';
import '../packages/service_locator/service_locator.dart';
import 'left_side.dart';
import 'right_side.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final personBloc = ServiceLocator.getInstance<PersonBloc>();
  final scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final experienceKey = GlobalKey();

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64),
                      child: LeftSide(
                        personDataModel: personDataModel,
                        scrollController: scrollController,
                        aboutKey: aboutKey,
                        educationKey: educationKey,
                        experienceKey: experienceKey,
                      ),
                    ),
                  ),
                  Flexible(
                    child: RightSide(
                      personDataModel: personDataModel,
                      scrollController: scrollController,
                      aboutKey: aboutKey,
                      educationKey: educationKey,
                      experienceKey: experienceKey,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
