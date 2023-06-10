import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:testpusher/example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
//
//   void _incrementCounter() async {
//     const String PUSHER_KEY = '987654';
// //const String PUSHER_KEY_NO = '736BBB3684CB60B98CE111DCB50A8EA83C0FF65960E128B7567DBD6EB95B6DED';
//     const String AUTH_URL = 'http://185.98.137.138:83/api/broadcasting/auth';
//     const String EVENT_URL = '185.98.137.138';
//
//     PusherOptions options = PusherOptions(
//       host: EVENT_URL,
//       wsPort: 6002,
//       encrypted: false,
//       auth: PusherAuth(
//         AUTH_URL,
//         headers: {
//                   'Authorization': 'Bearer 1450|n7hGCzTphZRplYP6Xv4YayvwXqiNiRYSLR7K7fVs',
//         },
//       ),
//     );
//
//     PusherClient pusher = PusherClient(PUSHER_KEY, options, enableLogging: true,);
//     pusher.onConnectionStateChange((state) {
//       log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
//     });
//
//     pusher.onConnectionError((error) {
//       log(error!.message!);
//       log(error.exception!);
//       log(error.code!);
//     });
//     // Echo echoEvent=  Echo(
//     //   client: pusher,
//     //   broadcaster: EchoBroadcasterType.Pusher,
//     // );
//     var idClient=51;
//     // pusher.subscribe("private-App.User.$idClient").((e)  {
//     //   print("$e");
//     //
//     // });
//     pusher.subscribe("private-client.$idClient").bind("App\\Events\\V1\\RecetteShared", (e) {
//       log("$e");
//     });
//     // pusher.subscribe("public").bind("V1.UserActivated", (e) {
//     //   log("$e");
//     // });
//     // Future.delayed(Duration(seconds: 10),(){
//     //   pusher.disconnect();
//     //
//     // });
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
  void _incrementCounter() async {
    const String PUSHER_KEY = '987654';
//const String PUSHER_KEY_NO = '736BBB3684CB60B98CE111DCB50A8EA83C0FF65960E128B7567DBD6EB95B6DED';
    const String AUTH_URL = 'http://185.98.137.138:83/api/broadcasting/auth';
    const String EVENT_URL = '185.98.137.138';

    PusherOptions options = PusherOptions(
      host: EVENT_URL,
      wsPort: 6002,
      encrypted: false,
      auth: PusherAuth(
        AUTH_URL,
        headers: {
                  'Authorization': 'Bearer 1450|n7hGCzTphZRplYP6Xv4YayvwXqiNiRYSLR7K7fVs',
        },
      ),
    );

    PusherClient pusher = PusherClient(PUSHER_KEY, options, enableLogging: true,);
    pusher.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    pusher.onConnectionError((error) {
      log(error!.message!);
      log(error.exception!);
      log(error.code!);
    });
    // Echo echoEvent=  Echo(
    //   client: pusher,
    //   broadcaster: EchoBroadcasterType.Pusher,
    // );
    var idClient=51;
    // pusher.subscribe("private-App.User.$idClient").((e)  {
    //   print("$e");
    //
    // });
    pusher.subscribe("private-client.$idClient").bind("App\\Events\\V1\\RecetteShared", (e) {
      log("$e");
    });
    // pusher.subscribe("public").bind("V1.UserActivated", (e) {
    //   log("$e");
    // });
    // Future.delayed(Duration(seconds: 10),(){
    //   pusher.disconnect();
    //
    // });
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: connectToPusher,
        tooltip: 'Increment',
        child:  Icon(Icons.add),
      ),
    );
  }

  onConnectionStateChange(String currentState, String previousState) {
      print(
          "previousState: $previousState, currentState: $currentState");


  }
  // void connectToPusher() {
  //   PusherChannelsFlutter pusher = PusherChannelsFlutter(
  //     cluster: 'your_pusher_cluster',
  //     instanceId: 'your_pusher_instance_id',
  //     encrypted: true,
  //     host: 'your_custom_host',
  //   );
  //
  //   pusher.connect();
  // }
  // void _incrementCounter() async{
  //   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  //   try {
  //     await pusher.init(
  //       apiKey: "987654",
  //       cluster: "",
  //       onConnectionStateChange: onConnectionStateChange,
  //
  //       authEndpoint: "http://185.98.137.138:83/api/broadcasting/auth",
  //       authParams: {
  //     "headers": {
  //         'Authorization': 'Bearer 1450|n7hGCzTphZRplYP6Xv4YayvwXqiNiRYSLR7K7fVs',
  //       },
  //       },
  //       onAuthorizer: (channelName, socketId, options) {
  //
  //       },
  //     );
  //     await pusher.subscribe(channelName: 'presence-chatbox');
  //     await pusher.connect();
  //   } catch (e) {
  //     print("ERROR: $e");
  //   }
  //       setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }
}
