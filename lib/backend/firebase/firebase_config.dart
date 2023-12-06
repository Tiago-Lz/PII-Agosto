import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAiHqsT8yBxLUF2y_d1uLNt2p4CbZksitU",
            authDomain: "doceria-ga.firebaseapp.com",
            projectId: "doceria-ga",
            storageBucket: "doceria-ga.appspot.com",
            messagingSenderId: "557224665226",
            appId: "1:557224665226:web:d40c9ee26d97e45dc54d73"));
  } else {
    await Firebase.initializeApp();
  }
}
