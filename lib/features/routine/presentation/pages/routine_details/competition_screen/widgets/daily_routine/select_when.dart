import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/models/habit_option.dart';
import 'package:habit_master/features/routine/presentation/cubit/timer_task.dart';
import 'package:habit_master/shared/static/options.dart';

import '../../bloc/bloc_logic/select_option_logic.dart';
import '../../bloc/events/select_option.dart';

class SelectWhen extends StatefulWidget {
  final List<String>? options;
  final String? title;
  const SelectWhen({
    Key? key,
    required this.options,
    required this.title,
  }) : super(key: key);

  @override
  State<SelectWhen> createState() => _SelectWhenState();
}

class _SelectWhenState extends State<SelectWhen> {
  int valueIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.black,
      iconDisabledColor: Colors.white,
      iconEnabledColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: "Twitterchirp",
        fontSize: 15.0,
        decoration: TextDecoration.none,
        overflow: TextOverflow.ellipsis,
      ),
      items: widget.options!
          .map((optionValue) => DropdownMenuItem(
                value: optionValue,
                child: Text(optionValue),
              ))
          .toList(),
      value: widget.options![valueIndex],
      onChanged: (selectedOption) {
        setState(() {
          valueIndex = widget.options!.indexOf(selectedOption as String);
        });
        if (selectedOption == typeOptions[1]) {
          context.read<TimerTaskCubit>().updateState(true);
        }
        if (selectedOption == typeOptions[0]) {
          context.read<TimerTaskCubit>().updateState(false);
        }
        final optionData = OptionInterface(
          title: widget.title,
          selectedOptionValue: selectedOption as String,
        );
        context.read<SelectOptionsBloc>().add(
              SelectOptionAction(
                optionData: optionData,
              ),
            );
      },
    );
  }
}
