import 'package:flutter/material.dart';

class ExpenseEntryPage extends StatefulWidget {
  const ExpenseEntryPage({super.key});

  @override
  State<ExpenseEntryPage> createState() => _ExpenseEntryPageState();
}

class _ExpenseEntryPageState extends State<ExpenseEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descController = TextEditingController();

  String? _selectedCategory;
  bool _showDetails = false;

  final List<Map<String, dynamic>> categories = [
    {'name': '餐饮', 'icon': Icons.restaurant, 'color': Colors.red},
    {'name': '交通', 'icon': Icons.directions_car, 'color': Colors.blue},
    {'name': '购物', 'icon': Icons.shopping_bag, 'color': Colors.purple},
    {'name': '娱乐', 'icon': Icons.movie, 'color': Colors.orange},
    {'name': '居住', 'icon': Icons.home, 'color': Colors.green},
    {'name': '其他', 'icon': Icons.more_horiz, 'color': Colors.grey},
    {'name': '水电费', 'icon': Icons.electric_bolt, 'color': Colors.yellow},
    {'name': '通讯费', 'icon': Icons.phone, 'color': Colors.cyan},
    {'name': '医疗保健', 'icon': Icons.local_hospital, 'color': Colors.pink},
    {'name': '教育', 'icon': Icons.school, 'color': Colors.indigo},
    {'name': '旅游', 'icon': Icons.flight, 'color': Colors.teal},
    {'name': '美容美发', 'icon': Icons.cut, 'color': Colors.lime},
    {'name': '宠物', 'icon': Icons.pets, 'color': Colors.brown},
    {'name': '运动健身', 'icon': Icons.fitness_center, 'color': Colors.deepPurple},
    {'name': '礼物', 'icon': Icons.card_giftcard, 'color': Colors.amber},
    {'name': '书籍', 'icon': Icons.book, 'color': Colors.blueGrey},
    {'name': '数码产品', 'icon': Icons.computer, 'color': Colors.lightBlue},
    {'name': '家居用品', 'icon': Icons.home_work, 'color': Colors.lightGreen},
    {'name': '办公用品', 'icon': Icons.work, 'color': Colors.orangeAccent},
    {'name': '服装', 'icon': Icons.shopping_cart, 'color': Colors.purpleAccent},
    {'name': '饰品', 'icon': Icons.diamond, 'color': Colors.redAccent},
    {'name': '食品饮料', 'icon': Icons.fastfood, 'color': Colors.greenAccent},
    {'name': '烟酒', 'icon': Icons.local_bar, 'color': Colors.brown},
    {'name': '维修保养', 'icon': Icons.build, 'color': Colors.grey},
  ];
  
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 这里处理表单提交
      print('''
        分类: $_selectedCategory
        金额: ${_amountController.text}
        说明: ${_descController.text}
      ''');
      
      // 提交后重置表单
      _formKey.currentState!.reset();
      setState(() => _showDetails = false);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('记一笔'),
        actions: [
          if (_showDetails)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => setState(() => _showDetails = false),
            )
        ],
      ),
      body: Column(
        children: [
          // 分类选择网格
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return _CategoryItem(
                    icon: category['icon'] as IconData,
                    color: category['color'] as Color,
                    name: category['name'] as String,
                    isSelected: _selectedCategory == category['name'],
                    onTap: () {
                      setState(() {
                        _selectedCategory = category['name'];
                        _showDetails = true;
                      });
                    },
                  );
                },
              ),
            ),
          ),

          // 详细信息输入面板
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showDetails
                ? _DetailInputPanel(
                    formKey: _formKey,
                    category: _selectedCategory!,
                    amountController: _amountController,
                    descController: _descController,
                    onSubmit: _submitForm,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// 分类项组件
class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.color,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

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
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(name, style: TextStyle(color: Colors.grey.shade800)),
          ],
        ),
      ),
    );
  }
}

// 详细信息输入面板
class _DetailInputPanel extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String category;
  final TextEditingController amountController;
  final TextEditingController descController;
  final VoidCallback onSubmit;

  const _DetailInputPanel({
    required this.formKey,
    required this.category,
    required this.amountController,
    required this.descController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
              category,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: '金额',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
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
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: '备注说明',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
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