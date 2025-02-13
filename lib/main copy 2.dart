import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Fixed Form Demo')),
        body: CustomFormDemo(),
      ),
    );
  }
}

class CustomFormDemo extends StatefulWidget {
  @override
  _CustomFormDemoState createState() => _CustomFormDemoState();
}

class _CustomFormDemoState extends State<CustomFormDemo> {
  final _formKey = GlobalKey<FormState>();
  final SelectFormFieldController<String> _selectController = SelectFormFieldController();
  final RadioFormFieldController<String> _radioController = RadioFormFieldController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('[Submitted] Select: ${_selectController.value}, Radio: ${_radioController.value}');
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset(); // 触发所有FormField的reset方法
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SelectFormField<String>(
              controller: _selectController,
              labelText: 'Select an option',
              items: [
                SelectOption(value: 'Option 1', label: 'Option 1'),
                SelectOption(value: 'Option 2', label: 'Option 2'),
                SelectOption(value: 'Option 3', label: 'Option 3'),
              ],
              validator: (value) => value == null ? 'Required' : null,
              initialValue: 'Option 1',
            ),
            SizedBox(height: 20),
            RadioFormField<String>(
              controller: _radioController,
              labelText: 'Gender',
              items: [
                RadioOption(value: 'Male', label: 'Male'),
                RadioOption(value: 'Female', label: 'Female'),
                RadioOption(value: 'Other', label: 'Other'),
              ],
              validator: (value) => value == null ? 'Required' : null,
              initialValue: 'Male',
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
            ElevatedButton(onPressed: _resetForm, child: Text('Reset Form')),
            ElevatedButton(
              onPressed: () => _selectController.value = 'Option 2', 
              child: Text('Set Select to Option 2'),
            ),
            ElevatedButton(
              onPressed: () => _radioController.value = 'Female', 
              child: Text('Set Radio to Female'),
            ),
          ],
        ),
      ),
    );
  }
}

// 修复后的 SelectFormField
class SelectFormField<T> extends FormField<T> {
  final SelectFormFieldController<T>? controller;
  final String? labelText;
  final List<SelectOption<T>> items;

  SelectFormField({
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
            return _SelectFormField(
              state: state,
              labelText: labelText,
              items: items,
              controller: controller,
            );
          },
        );

  @override
  FormFieldState<T> createState() => _SelectFormFieldState<T>();
}

class _SelectFormFieldState<T> extends FormFieldState<T> {
  SelectFormFieldController<T>? _controller;

  @override
  void initState() {
    super.initState();
    _controller = (widget as SelectFormField<T>).controller;
    _controller?.addListener(_handleControllerChange);
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    _controller?.value = value;
  }

  @override
  void reset() {
    super.reset(); // 关键点：调用父类reset方法恢复初始值
    print(widget.initialValue);
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

class _SelectFormField<T> extends StatelessWidget {
  final FormFieldState<T> state;
  final String? labelText;
  final List<SelectOption<T>> items;
  final SelectFormFieldController<T>? controller;

  const _SelectFormField({
    required this.state,
    this.labelText,
    required this.items,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<T>(
          value: state.value, // 关键点：绑定到FormField的value
          decoration: InputDecoration(
            labelText: labelText,
            errorText: state.errorText,
          ),
          items: items
              .map((option) => DropdownMenuItem(
                    value: option.value,
                    child: Text(option.label),
                  ))
              .toList(),
          onChanged: (value) {
            state.didChange(value); // 关键点：通过FormField更新值
          },
        ),
      ],
    );
  }
}

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
              controller: controller,
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
  final RadioFormFieldController<T>? controller;

  const _RadioFormField({
    required this.state,
    this.labelText,
    required this.items,
    this.controller,
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

class SelectFormFieldController<T> extends FormFieldController<T> {}
class RadioFormFieldController<T> extends FormFieldController<T> {}

// 选项类
class SelectOption<T> {
  final T value;
  final String label;
  SelectOption({required this.value, required this.label});
}

class RadioOption<T> {
  final T value;
  final String label;
  RadioOption({required this.value, required this.label});
}