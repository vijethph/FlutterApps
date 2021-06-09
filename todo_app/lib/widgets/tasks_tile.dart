import 'package:flutter/material.dart';

// two types of state: local state - changes on setState(), and global state
// stateful widgets variables are not marked final because they can change

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {@required this.taskTitle,
      @required this.isChecked,
      @required this.checkboxCallback,
      @required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
        // this is same as onChanged: (newValue) { checkboxCallback(newValue) }
      ),
    );
  }
}
