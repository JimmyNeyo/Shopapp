// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: defaultcolor,
        appBarTheme: const AppBarTheme(
          titleSpacing: 20,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            // text in app bar
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:
                Colors.white, // اول جزء ف الشاشه فوق خالص حته البار
            statusBarIconBrightness:
                Brightness.dark, 
                statusBarBrightness: Brightness.dark,// الايقونات اللى ف الشاشه نفسها
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            //color: Colors.white, // in dark
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.indigoAccent,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
              
        ),
        fontFamily:'family'
        );


ThemeData darkTheme =ThemeData(
        scaffoldBackgroundColor: HexColor('333739'),
        primarySwatch: defaultcolor,
        appBarTheme: AppBarTheme(
          titleSpacing: 20,
          backgroundColor: HexColor('333739'), // in dark
          elevation: 0.0,
    
          titleTextStyle: const TextStyle(
            // text in app bar
            color: Colors.white, // in dark
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
    
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor(
                '333739'), // in dark اول جزء ف الشاشه فوق خالص حته البار
            statusBarBrightness: Brightness.light, // in dark
            statusBarIconBrightness:
                Brightness.light, // الايقونات اللى ف الشاشه نفسها
          ),
    
          iconTheme: const IconThemeData(
            color: Colors.white, // in dark
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('333739'),
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Colors.grey),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
    
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        fontFamily:'family'
        );
             
             