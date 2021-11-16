import 'package:flutter/material.dart';
import 'package:projeto001/controllers/home_controller.dart';
import 'package:projeto001/models/post_models.dart';
import 'package:projeto001/repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context).pushNamed(
                '/details',
                arguments: list[index],
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
