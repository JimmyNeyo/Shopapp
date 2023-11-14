import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

// ... (other imports)

class Setting1 extends StatelessWidget {
  const Setting1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Connectivity().checkConnectivity(),
      builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == ConnectivityResult.none) {
          return const Center(
            child: Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }

        // Continue with the rest of your code
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
  
  // ... (rest of your code)
}
