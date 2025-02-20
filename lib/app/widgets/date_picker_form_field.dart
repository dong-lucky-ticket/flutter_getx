import 'package:flutter/material.dart';

// 参考TextFormField.dart

class DatePickerFormField extends FormField<String> {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  // final String? labelText;
  // final DateTime? initialDate; // 初始日期
  // final DateTime? firstDate; // 可选的最早日期
  // final DateTime? lastDate; // 可选的最晚日期

  DatePickerFormField({
    Key? key,
    this.controller,
    this.onChanged,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? labelText,
    String? initialValue,
  }) : super(
          key: key,
          initialValue: initialValue,
          builder: (FormFieldState<String> state) {
            return _DatePickerFormField(
              state: state,
              controller: controller,
              labelText: labelText,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
            );
          },
        );

  @override
  FormFieldState<String> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _datePickerFormField.controller ?? _controller!;

  DatePickerFormField get _datePickerFormField =>
      super.widget as DatePickerFormField;

  @override
  void initState() {
    super.initState();
    if (_datePickerFormField.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      _datePickerFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
    _datePickerFormField.onChanged?.call(_effectiveController.text);
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }
}

class _DatePickerFormField extends StatelessWidget {
  final FormFieldState<String> state;
  final TextEditingController? controller;
  final String? labelText;
  final DateTime? initialDate; // 初始日期
  final DateTime? firstDate; // 可选的最早日期
  final DateTime? lastDate; // 可选的最晚日期

  const _DatePickerFormField({
    required this.state,
    this.labelText,
    this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate!,
      lastDate: lastDate!,
    );
    if (picked != null && picked != initialDate) {
      state.didChange(formatDate(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.calendar_month),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        suffixIcon: controller?.text != ''
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  controller?.text = '';
                }, // 点击图标打开日期选择器
              )
            : null,
      ),
      readOnly: true, // 禁止手动输入
      onTap: () => _selectDate(context), // 点击输入框打开日期选择器
      onChanged: (String value) {
        // controller.text = value; // 更新 Controller 的值
        state.didChange(value); // 更新 FormField 的状态
      },
    );
  }
}

class DatePickerFormFieldController<T> extends ChangeNotifier {
  T? _value;
  T? get value => _value;
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }
}

String formatDate(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}



// class DatePickerFormField extends StatefulWidget {
//   final String labelText; // TextFormField的标签
//   final DateTime? initialDate; // 初始日期
//   final DateTime firstDate; // 可选的最早日期
//   final DateTime lastDate; // 可选的最晚日期
//   final ValueChanged<DateTime> onDateSelected; // 日期选择回调
//   final FormFieldValidator<String>? validator; // 验证函数
//   final TextEditingController? controller;

//   const DatePickerFormField({
//     Key? key,
//     required this.labelText,
//     this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     required this.onDateSelected,
//     this.validator,
//     this.controller,
//   }) : super(key: key);

//   @override
//   State<DatePickerFormField> createState() => _DatePickerFormFieldState();
// }

// class _DatePickerFormFieldState extends State<DatePickerFormField> {
//   late TextEditingController _controller;
//   DateTime? _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     _controller = widget.controller ?? TextEditingController();
//     // 初始化时设置初始日期
//     if (widget.initialDate != null) {
//       _selectedDate = widget.initialDate;
//       _controller.text = _formatDate(widget.initialDate!);
//     }
//     _controller.addListener(_onControllerChanged);
//   }

//   @override
//   void didUpdateWidget(DatePickerFormField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller != oldWidget.controller) {
//       oldWidget.controller?.removeListener(_onControllerChanged);
//       _controller = widget.controller ?? TextEditingController();
//       _controller.addListener(_onControllerChanged);
//     }
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }

//   void _onControllerChanged() {
//     setState(() {});
//   }

//   // 格式化日期为字符串
//   String _formatDate(DateTime date) {
//     // return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//     return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//   }

//   // 显示日期选择器
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: widget.firstDate,
//       lastDate: widget.lastDate,
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _controller.text = _formatDate(picked);
//       });
//       widget.onDateSelected(picked); // 回调选择的日期
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FormField<String>(
//       initialValue: _controller.text,
//       validator: widget.validator,
//       onSaved: (value) {
//         _controller.text = value ?? ''; // 保存 Controller 的值
//       },
//       builder: (FormFieldState<String> state) {
//         return TextField(
//           controller: _controller,
//           decoration: InputDecoration(
//             labelText: widget.labelText,
//             prefixIcon: const Icon(Icons.calendar_month),
//             border: const OutlineInputBorder(),
//             contentPadding: const EdgeInsets.symmetric(vertical: 12),
//             suffixIcon: _controller.text != '' ? IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 _controller.text = '';
//               }, // 点击图标打开日期选择器
//             ) : null,
//           ),
//           readOnly: true, // 禁止手动输入
//           onTap: () => _selectDate(context), // 点击输入框打开日期选择器
//           onChanged: (String value) {
//             _controller.text = value; // 更新 Controller 的值
//             state.didChange(value); // 更新 FormField 的状态
//           },
//         );
//       }
//     );
//         // return TextFormField();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return TextFormField(
//   //     controller: _controller,
//   //     decoration: InputDecoration(
//   //       labelText: widget.labelText,
//   //       prefixIcon: const Icon(Icons.calendar_month),
//   //       border: const OutlineInputBorder(),
//   //       contentPadding: const EdgeInsets.symmetric(vertical: 12),
//   //       suffixIcon: _controller.text != '' ? IconButton(
//   //         icon: const Icon(Icons.close),
//   //         onPressed: () {
//   //           _controller.text = '';
//   //         }, // 点击图标打开日期选择器
//   //       ) : null,
//   //     ),
//   //     readOnly: true, // 禁止手动输入
//   //     onTap: () => _selectDate(context), // 点击输入框打开日期选择器
//   //     validator: widget.validator, // 验证函数
//   //   );
//   // }
// }


// /// 自定义 Controller
// class DatePickerFormFieldController<String> extends ChangeNotifier {
//   String? _value;

//   String? get value => _value;

//   set value(String? newValue) {
//     if (_value != newValue) {
//       _value = newValue;
//       notifyListeners(); // 通知监听器
//     }
//   }
// }