import 'package:flutter/material.dart';

// 修复后的 RadioFormField 
class RadioFormField<T> extends FormField<T> {
  final RadioFormFieldController<T>? controller;
  final String? labelText;
  final List<RadioOption<T>> items;

  RadioFormField({
    Key? key,
    this.controller,
    this.labelText,
    required this.items,
    FormFieldValidator<T>? validator,
    T? initialValue,
  }) : super(
          key: key,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<T> state) {
            return _RadioFormField(
              state: state,
              labelText: labelText,
              items: items,
            );
          },
        );

  @override
  FormFieldState<T> createState() => _RadioFormFieldState<T>();
}

class _RadioFormFieldState<T> extends FormFieldState<T> {
  RadioFormFieldController<T>? _controller;

  @override
  void initState() {
    super.initState();
    _controller = (widget as RadioFormField<T>).controller;
    _controller?.addListener(_handleControllerChange);
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    _controller?.value = value;
  }

  @override
  void reset() {
    super.reset(); // 关键点
    _controller?.value = widget.initialValue;
  }

  void _handleControllerChange() {
    if (_controller?.value != value) {
      didChange(_controller?.value);
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleControllerChange);
    super.dispose();
  }
}

class _RadioFormField<T> extends StatelessWidget {
  final FormFieldState<T> state;
  final String? labelText;
  final List<RadioOption<T>> items;

  const _RadioFormField({
    required this.state,
    this.labelText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) Text(labelText!),
        ...items.map((option) => Row(
          children: [
            Radio<T>(
              value: option.value,
              groupValue: state.value, // 关键点：绑定到FormField的value
              onChanged: (value) => state.didChange(value),
            ),
            Text(option.label),
          ],
        )),
        if (state.hasError) 
          Text(state.errorText!, style: TextStyle(color: Colors.red)),
      ],
    );
  }
}

// Controller基类
abstract class FormFieldController<T> extends ChangeNotifier {
  T? _value;
  T? get value => _value;
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }
}

class RadioFormFieldController<T> extends FormFieldController<T> {}

class RadioOption<T> {
  final T value;
  final String label;
  RadioOption({required this.value, required this.label});
}

















// import 'package:flutter/material.dart';

// /// 自定义 RadioFormField
// class RadioFormField<T> extends StatefulWidget {
//   final RadioFormFieldController<T>? controller;
//   final String? labelText;
//   final List<RadioOption<T>> items;
//   final FormFieldValidator<T>? validator;

//   const RadioFormField({
//     Key? key,
//     this.controller,
//     this.labelText,
//     required this.items,
//     this.validator,
//   }) : super(key: key);

//   @override
//   RadioFormFieldState<T> createState() => RadioFormFieldState<T>();
// }

// class RadioFormFieldState<T> extends State<RadioFormField<T>> {
//   late RadioFormFieldController<T> _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = widget.controller ?? RadioFormFieldController<T>();
//     _controller.addListener(_onControllerChanged);
//   }

//   @override
//   void didUpdateWidget(RadioFormField<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller != oldWidget.controller) {
//       oldWidget.controller?.removeListener(_onControllerChanged);
//       _controller = widget.controller ?? RadioFormFieldController<T>();
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

//   @override
//   Widget build(BuildContext context) {
//     return FormField<T>(
//       initialValue: _controller.value,
//       validator: widget.validator,
//       onSaved: (value) {
//         _controller.value = value; // 保存 Controller 的值
//       },
//       builder: (FormFieldState<T> state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (widget.labelText != null)
//               Text(
//                 widget.labelText!,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             Row(
//                 children: widget.items.map(
//               (item) {
//                 return Row(
//                   children: [
//                     Radio<T>(
//                       value: item.value,
//                       groupValue: _controller.value,
//                       onChanged: (T? value) {
//                         _controller.value = value; // 更新 Controller 的值
//                         state.didChange(value); // 更新 FormField 的状态
//                       },
//                     ),
//                     Text(item.label),
//                   ],
//                 );
//               },
//             ).toList()),
//             if (state.hasError)
//               Text(
//                 state.errorText!,
//                 style: const TextStyle(color: Colors.red),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

// /// 自定义 Controller
// class RadioFormFieldController<T> extends ChangeNotifier {
//   T? _value;

//   T? get value => _value;

//   set value(T? newValue) {
//     if (_value != newValue) {
//       _value = newValue;
//       notifyListeners(); // 通知监听器
//     }
//   }
// }

// /// 单选按钮选项
// class RadioOption<T> {
//   final T value;
//   final String label;

//   RadioOption({required this.value, required this.label});
// }
