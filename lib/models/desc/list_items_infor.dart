import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class List_items_infor extends StatelessWidget {
  List_items_infor({
    super.key,
    required this.listItems,
    required this.listIcon,
  });

  final List<String> listItems;
  final List<String> listIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) => ListTile(
        leading: SvgPicture.asset(listIcon[index]),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
        ),
        title: Text(
          listItems[index],
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        subtitle: const Text(
          'Самое необходимое',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ),
    );
  }
}
