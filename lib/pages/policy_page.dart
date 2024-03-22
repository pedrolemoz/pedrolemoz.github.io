import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../controllers/core/core_states.dart';
import '../controllers/privacy_policy/privacy_policy_bloc.dart';
import '../controllers/privacy_policy/privacy_policy_events.dart';
import '../controllers/privacy_policy/privacy_policy_states.dart';
import '../packages/service_locator/service_locator.dart';
import '../utils/layout_extension.dart';

class PolicyPage extends StatefulWidget {
  final String url;

  const PolicyPage({super.key, required this.url});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  final privacyPolicyBloc = ServiceLocator.getInstance<PrivacyPolicyBloc>();
  final scrollController = ScrollController();

  @override
  void initState() {
    privacyPolicyBloc.add(GetPrivacyPolicyEvent(url: widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.isDesktop ? 64 : 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: BlocBuilder<PrivacyPolicyBloc, IAppState>(
              bloc: privacyPolicyBloc,
              builder: (context, state) {
                if (state is InitialState ||
                    state is GettingPrivacyPolicyState) {
                  return const CircularProgressIndicator();
                }

                if (state is UnableToGetPrivacyPolicyState) {
                  return Text(
                    'Cannot get privacy policy.\n\n${state.exception}',
                    style: textTheme.headlineMedium,
                  );
                }

                final privacyPolicy =
                    (state as SuccessfullyGotPrivacyPolicyState).privacyPolicy;

                return Scrollbar(
                  controller: scrollController,
                  child: Markdown(
                    controller: scrollController,
                    selectable: true,
                    data: privacyPolicy,
                    styleSheet: MarkdownStyleSheet(
                      h1: textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                      p: textTheme.bodyMedium,
                      h2: textTheme.headlineMedium,
                      h4: textTheme.titleMedium,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 64),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
