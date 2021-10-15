import 'package:difiaz_space/presenter/home/scroll_special_home.dart';
import 'package:flutter/material.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({Key? key}) : super(key: key);

  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: 71,);
  }
}
