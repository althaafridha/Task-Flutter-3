import 'package:flutter/material.dart';
import 'package:task_flutter_3/model/usersmodel.dart';
import 'package:task_flutter_3/service/users_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Data>?>(
        future: UsersService().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(snapshot.data![index].firstName!),
                      Text(snapshot.data![index].lastName!),
                      Text(snapshot.data![index].email!),
                      Image(image: NetworkImage(snapshot.data![index].avatar!)),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
