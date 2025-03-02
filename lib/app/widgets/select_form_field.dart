import 'package:flutter/material.dart';

/// 自定义 SelectFormField
class SelectFormField<T> extends StatefulWidget {
  final SelectFormFieldController<T>? controller;
  final String? labelText;
  final String? hintText;
  final List<SelectOption<T>> items;
  final FormFieldValidator<T>? validator;

  const SelectFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  SelectFormFieldState<T> createState() => SelectFormFieldState<T>();
}

class SelectFormFieldState<T> extends State<SelectFormField<T>> {
  late SelectFormFieldController<T> _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? SelectFormFieldController<T>();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(SelectFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      _controller = widget.controller ?? SelectFormFieldController<T>();
      _controller.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: _controller.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.store),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(12),
      ),
      items: widget.items.map((SelectOption<T> option) {
        return DropdownMenuItem<T>(
          value: option.value,
          child: Text(option.label),
        );
      }).toList(),
      validator: widget.validator,
      onChanged: (T? value) {
        _controller.text = value; // 更新 Controller 的值
      },
      onSaved: (T? value) {
        _controller.text = value; // 保存 Controller 的值
      },
    );
  }
}

/// 自定义 Controller
class SelectFormFieldController<T> extends ChangeNotifier {
  T? _value;

  T? get text => _value;

  set text(T? newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners(); // 通知监听器
    }
  }
}

/// 下拉选项
class SelectOption<T> {
  final T value;
  final String label;

  SelectOption({required this.value, required this.label});
}

/// 试图支持Form的reset方法的失败品
// class SelectFormField<T> extends StatefulWidget {
//   final SelectFormFieldController<T>? controller;
//   final String? labelText;
//   final String? hintText;
//   final List<SelectOption<T>> items;
//   final FormFieldValidator<T>? validator;
//   final T? initialValue;

//   SelectFormField({
//     Key? key,
//     this.controller,
//     this.labelText,
//     this.hintText,
//     required this.items,
//     this.validator,
//     this.initialValue,
//   }) : super(key: key);

//   @override
//   _SelectFormFieldState<T> createState() => _SelectFormFieldState<T>();
// }

// class _SelectFormFieldState<T> extends State<SelectFormField<T>> {
//   late SelectFormFieldController<T> _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = widget.controller ?? SelectFormFieldController<T>();
//     _controller.value = widget.initialValue; // 初始化值
//     _controller.addListener(_onControllerChanged);
//   }

//   @override
//   void didUpdateWidget(SelectFormField<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller != oldWidget.controller) {
//       oldWidget.controller?.removeListener(_onControllerChanged);
//       _controller = widget.controller ?? SelectFormFieldController<T>();
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
//       initialValue: widget.initialValue, // 设置初始值
//       validator: widget.validator,
//       onSaved: (value) {
//         _controller.value = value; // 保存 Controller 的值
//       },
//       builder: (FormFieldState<T> state) {
//         // 监听 reset 回调
//         state.didChange(_controller.value);
//         // state.setValue(_controller.value);

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButtonFormField<T>(
//               value: _controller.value,
//               decoration: InputDecoration(
//                 labelText: widget.labelText,
//                 hintText: widget.hintText,
//                 border: OutlineInputBorder(),
//               ),
//               items: widget.items.map((SelectOption<T> option) {
//                 return DropdownMenuItem<T>(
//                   value: option.value,
//                   child: Text(option.label),
//                 );
//               }).toList(),
//               onChanged: (T? value) {
//                 _controller.value = value; // 更新 Controller 的值
//                 state.didChange(value); // 更新 FormField 的状态
//               },
//             ),
//             if (state.hasError)
//               Text(
//                 state.errorText!,
//                 style: TextStyle(color: Colors.red),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }