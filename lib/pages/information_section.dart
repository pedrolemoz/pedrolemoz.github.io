import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../models/person_data_model.dart';
import '../utils/layout_extension.dart';
import '../widgets/expandable_button.dart';
import '../widgets/external_link_button.dart';

class InformationSection extends StatefulWidget {
  final GlobalKey aboutKey;
  final GlobalKey educationKey;
  final GlobalKey experienceKey;
  final PersonDataModel personDataModel;
  final ScrollController scrollController;

  const InformationSection({
    super.key,
    required this.aboutKey,
    required this.educationKey,
    required this.experienceKey,
    required this.personDataModel,
    required this.scrollController,
  });

  @override
  State<InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<InformationSection> {
  late double _aboutOffset;
  late double _educationOffset;
  late double _experienceOffset;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _aboutOffset = _getOffsetForElement(elementKey: widget.aboutKey);
      _educationOffset = _getOffsetForElement(elementKey: widget.educationKey);
      _experienceOffset =
          _getOffsetForElement(elementKey: widget.experienceKey);
    });

    super.initState();
  }

  void _moveToOffset({required double offset}) {
    widget.scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCirc,
    );
  }

  double _getOffsetForElement({required GlobalKey elementKey}) {
    final renderBox =
        elementKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy - 64;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    if (size.isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.personDataModel.fullName,
            style:
                textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            widget.personDataModel.bio,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            widget.personDataModel.shortDescription,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandableButton(
                label: 'About',
                onClick: () => _moveToOffset(offset: _aboutOffset),
              ),
              ExpandableButton(
                label: 'Education',
                onClick: () => _moveToOffset(offset: _educationOffset),
              ),
              ExpandableButton(
                label: 'Experience',
                onClick: () => _moveToOffset(offset: _experienceOffset),
              ),
            ],
          ),
          const Expanded(child: SizedBox(height: 16)),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.personDataModel.contacts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final contactModel =
                  widget.personDataModel.contacts.elementAt(index);
              return ExternalLinkButton(
                name: contactModel.name,
                url: contactModel.url,
              );
            },
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 64),
        Text(
          widget.personDataModel.fullName,
          style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          widget.personDataModel.bio,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          widget.personDataModel.shortDescription,
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.personDataModel.contacts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final contactModel =
                widget.personDataModel.contacts.elementAt(index);
            return ExternalLinkButton(
              name: contactModel.name,
              url: contactModel.url,
            );
          },
        ),
      ],
    );
  }
}
