import 'package:flutter/material.dart';
import 'package:paperless_client/model/correspondent.dart';
import 'package:paperless_client/api/rest_api.dart';

class CorrespondentsScreen extends StatelessWidget {
  const CorrespondentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Correspondents'),
      ),
      body: FutureBuilder<List<Correspondent>>(
          future: fetchAllCorrespondents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data!.elementAt(index).name),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return const Text("Fehler");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
