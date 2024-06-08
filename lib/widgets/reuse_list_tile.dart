import 'package:flutter/material.dart';

class ReuseListTile extends StatelessWidget {
  final VoidCallback onTap;
  final Color colors;
  final IconData icon;
  final String text;

  const ReuseListTile({
    required this.onTap,
    required this.colors,
    required this.icon,
    required this.text,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,color: colors,size: 34,
        ),
      ),
      title: Text(
        text,style:
        const TextStyle(
          fontSize: 20,fontWeight: FontWeight.w500
        ),
      ),
      trailing:  const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
