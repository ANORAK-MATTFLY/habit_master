import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/time_option_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/type_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/when_cubit.dart';
import 'package:habit_master/shared/static/options.dart';

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
      dropdownColor: const Color.fromARGB(255, 27, 0, 35),
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
        selectedOption as String;
        setState(() {
          valueIndex = widget.options!.indexOf(selectedOption);
        });
        if (widget.title == "moment") {
          context.read<MomentTaskCubit>().updateState(selectedOption);
        }
        if (widget.title == "type") {
          context.read<TypeTaskCubit>().updateState(selectedOption);
        }
        if (widget.title == "time") {
          context.read<TimeOptionCubit>().updateState(selectedOption);
        }

        if (selectedOption == typeOptions[1]) {
          context.read<TimerTaskCubit>().updateState(true);
        }
        if (selectedOption == typeOptions[0]) {
          context.read<TimerTaskCubit>().updateState(false);
        }
      },
    );
  }
}
