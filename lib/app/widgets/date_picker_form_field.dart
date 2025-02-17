import 'package:flutter/material.dart';

class DatePickerFormField extends StatefulWidget {
  final String labelText; // TextFormField的标签
  final DateTime? initialDate; // 初始日期
  final DateTime firstDate; // 可选的最早日期
  final DateTime lastDate; // 可选的最晚日期
  final ValueChanged<DateTime> onDateSelected; // 日期选择回调
  final FormFieldValidator<String>? validator; // 验证函数
  final TextEditingController? controller;

  const DatePickerFormField({
    Key? key,
    required this.labelText,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  late final TextEditingController _controller;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    // 初始化时设置初始日期
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
      _controller.text = _formatDate(widget.initialDate!);
    }
    _controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(TextEditingController oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      _controller = widget.controller ?? TextEditingController();
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

  // 格式化日期为字符串
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // 显示日期选择器
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });
      widget.onDateSelected(picked); // 回调选择的日期
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _controller.text = '';
          }, // 点击图标打开日期选择器
        ),
      ),
      readOnly: true, // 禁止手动输入
      onTap: () => _selectDate(context), // 点击输入框打开日期选择器
      validator: widget.validator, // 验证函数
    );
  }
}
