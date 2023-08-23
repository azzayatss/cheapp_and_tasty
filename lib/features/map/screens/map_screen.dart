import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = '/map';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.navigationBarLabel1),
        ),
        body: FutureBuilder(
          future: LocationRepository().getAllLocations(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(snapshot.data?[index].locationName ?? 'null'),
                  ),
                );
              },
            );
          },
        ),

        // Center(
        //   child: TextButton(
        //     onPressed: () {

        //     },
        //     child: const Text('print'),
        //   ),
        // ),
      ),
    );
  }
}
