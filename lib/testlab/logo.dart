// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';

class logo extends StatefulWidget {
  const logo({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<logo> {
  bool isVerifying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !isVerifying,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isVerifying = true;
                  });

                  // Simulate verification delay
                  await Future.delayed(const Duration(seconds: 2));

                  // Perform your data verification here

                  setState(() {
                    isVerifying = false;
                  });
                },
                child: const Text('Login'),
              ),
            ),
            Visibility(
              visible: isVerifying,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
// note
//        state is GetScienceLoading ? 
              // const Center(child: CircularProgressIndicator()) 
              //    : bus.isEmpty ?  
              //        const Center(child: CircularProgressIndicator())  :
       



