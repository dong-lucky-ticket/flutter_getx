import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/model/account.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_app_bar.dart';
import 'package:flutter_getx/app/widgets/date_picker_form_field.dart';
import 'package:flutter_getx/app/widgets/font_icon.dart';
import 'package:flutter_getx/app/widgets/select_form_field.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descController = TextEditingController();
  final _dateController =
      TextEditingController(text: formatDate(DateTime.now()));
  final _selectedController = SelectFormFieldController();

  final _scrollController = ScrollController();

  late TabController controller;
  late final List<TypeIcons> typeValues;
  late final List<GlobalKey> _categoryKeys;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    typeValues = TypeIcons.values;
    _categoryKeys = typeValues.map((e) => GlobalKey()).toList();
    super.initState();
  }

  TypeIcons? _activeTypeIcons;

  bool isBillDetailsVisible = false;

  void _onCategorySelected(TypeIcons category, int index) {
    setState(() {
      _activeTypeIcons = category;
      isBillDetailsVisible = true;
    });

    /// 精准滚动到选中项
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _categoryKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          alignment: 1, // 控制项在可视区域的位置（0=顶部，1=底部
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        final scrollOffset = _scrollController.offset; // 当前滚动位置
        final formHeight = _formKey.currentContext!.size!.height; // 表单的高度
        var formWrapperPadding = 16; // 表单的内边距
        var gridItemBorder = 2; // 网格项的边框
        _scrollController.animateTo(
          scrollOffset + formHeight + formWrapperPadding * 2 + gridItemBorder,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 这里处理表单提交
      debugPrint('''
        分类: ${_activeTypeIcons!.title}
        金额: ${_amountController.text}
        日期: ${_dateController.text}
        网购: ${_selectedController.text}
        说明: ${_descController.text}
      ''');

      final data = AccountModal(
        type: '收入',
        money: double.parse(_amountController.text),
        recordDate: _dateController.text,
        desc: _descController.text,
        category: _activeTypeIcons!.title,
        chennel: _selectedController.text,
      );

      debugPrint(data.toString());

      // 提交后重置表单
      _formKey.currentState!.reset();
      _selectedController.text = null;

      // setState(() => isBillDetailsVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: TabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          tabs: const [Tab(text: '收入'), Tab(text: '支出')],
        ),
        actions: [
          if (isBillDetailsVisible)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                _formKey.currentState!.reset();
                _selectedController.text = null;
                // setState(() => isBillDetailsVisible = false);
              },
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                      cacheExtent: 500,
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, // 每行的列数
                        crossAxisSpacing: 10, // 列与列之间的间隔
                        mainAxisSpacing: 10, // 行与行之间的间隔
                      ),
                      itemCount: typeValues.length,
                      itemBuilder: (context, index) {
                        final typeValue = typeValues[index];

                        return _CategoryItem(
                          key: _categoryKeys[index],
                          icon: typeValue.icon,
                          name: typeValue.title,
                          color: Colors.blue,
                          isSelected: typeValue == _activeTypeIcons,
                          onTap: () => _onCategorySelected(typeValue, index),
                        );
                      }),
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          // 详细信息输入面板
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isBillDetailsVisible
                ? _DetailInputPanel(
                    formKey: _formKey,
                    category: _activeTypeIcons!,
                    amountController: _amountController,
                    dateController: _dateController,
                    descController: _descController,
                    selectController: _selectedController,
                    onSubmit: _submitForm,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.name,
    required this.color,
    required this.isSelected,
    required this.onTap,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.transparent,
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 4),
            Text(name, style: TextStyle(color: Colors.grey.shade800)),
          ],
        ),
      ),
    );
  }
}

class _DetailInputPanel extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TypeIcons category;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController descController;
  final SelectFormFieldController selectController;
  final VoidCallback onSubmit;

  const _DetailInputPanel({
    required this.formKey,
    required this.category,
    required this.amountController,
    required this.descController,
    required this.onSubmit,
    required this.selectController,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: '金额',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入金额';
                }
                if (double.tryParse(value) == null) {
                  return '请输入有效数字';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DatePickerFormField(
              controller: dateController,
              labelText: '日期',
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              initialDate: DateTime.now(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: '备注说明',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            SelectFormField(
              controller: selectController,
              labelText: '网购',
              hintText: '网购',
              items: [
                SelectOption(value: 'jd', label: '京东'),
                SelectOption(value: 'tb', label: '淘宝'),
                SelectOption(value: 'pdd', label: '拼多多'),
                SelectOption(value: 'dy', label: '抖音'),
                SelectOption(value: 'other', label: '其它'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('确认保存'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
