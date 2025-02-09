import 'package:flutter/material.dart';

/// 自定义 RadioFormField
class RadioFormField<T> extends StatefulWidget {
  final RadioFormFieldController<T>? controller;
  final String? labelText;
  final List<RadioOption<T>> items;
  final FormFieldValidator<T>? validator;

  const RadioFormField({
    Key? key,
    this.controller,
    this.labelText,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  RadioFormFieldState<T> createState() => RadioFormFieldState<T>();
}

class RadioFormFieldState<T> extends State<RadioFormField<T>> {
  late RadioFormFieldController<T> _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? RadioFormFieldController<T>();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(RadioFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      _controller = widget.controller ?? RadioFormFieldController<T>();
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
    return FormField<T>(
      initialValue: _controller.value,
      validator: widget.validator,
      onSaved: (value) {
        _controller.value = value; // 保存 Controller 的值
      },
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText != null)
              Text(
                widget.labelText!,
                style: const TextStyle(fontSize: 16),
              ),
            Row(
                children: widget.items.map(
              (item) {
                return Row(
                  children: [
                    Radio<T>(
                      value: item.value,
                      groupValue: _controller.value,
                      onChanged: (T? value) {
                        _controller.value = value; // 更新 Controller 的值
                        state.didChange(value); // 更新 FormField 的状态
                      },
                    ),
                    Text(item.label),
                  ],
                );
              },
            ).toList()),
            if (state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}

/// 自定义 Controller
class RadioFormFieldController<T> extends ChangeNotifier {
  T? _value;

  T? get value => _value;

  set value(T? newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners(); // 通知监听器
    }
  }
}

/// 单选按钮选项
class RadioOption<T> {
  final T value;
  final String label;

  RadioOption({required this.value, required this.label});
}
