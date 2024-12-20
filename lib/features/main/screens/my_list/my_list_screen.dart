import 'package:flutter/material.dart';

import '../../../../core/common/widgets/svg_widget.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: const SvgWidget(ic: 'assets/icons/ic_logo.svg'),
        title: Text('My List',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18)),
      ),
      body: const Column(children: [

      ],),
    );
  }
}
