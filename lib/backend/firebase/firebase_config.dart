import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA24wVabcpO_j1ajnlFZdK29-MY64qshUM",
            authDomain: "ant-flow-k7u3e4.firebaseapp.com",
            projectId: "ant-flow-k7u3e4",
            storageBucket: "ant-flow-k7u3e4.appspot.com",
            messagingSenderId: "603557659590",
            appId: "1:603557659590:web:841184a4bdcfae606ee8c7"));
  } else {
    await Firebase.initializeApp();
  }
}
