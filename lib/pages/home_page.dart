import 'package:contact_list_flutter/components/contact_tile.dart';
import 'package:contact_list_flutter/models/contact_model.dart';
import 'package:contact_list_flutter/storage/contacts_web_storage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var contacts = ContactsRepository();
  List<Results> data = [];
  bool loading = false;

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  carregarDados() async {
    loading = true;
    var contatos = await contacts.getAll();
    data = contatos.results!;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: (loading)
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemBuilder: (context, index) => contactTile(data[index]),
                  itemCount: data.length,
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
