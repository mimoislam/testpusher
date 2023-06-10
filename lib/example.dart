import 'dart:async';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';

void connectToPusher() async {
      const String PUSHER_KEY = '987654';
//const String PUSHER_KEY_NO = '736BBB3684CB60B98CE111DCB50A8EA83C0FF65960E128B7567DBD6EB95B6DED';
    const String AUTH_URL = 'http://185.98.137.138:83/api/broadcasting/auth';
    const String EVENT_URL = '185.98.137.138';
  // Enable or disable logs
  PusherChannelsPackageLogger.enableLogs();
  // Create an instance PusherChannelsOptions
  // The test options can be accessed from test.pusher.com (using only for test purposes)
  const testOptions = PusherChannelsOptions.fromCluster(
    scheme: 'ws',
    cluster: '',
    host: EVENT_URL,
    key: PUSHER_KEY,
    port: 6002,
  );
  // Create an instance of PusherChannelsClient
  final client = PusherChannelsClient.websocket(
    options: testOptions,
    // Connection exceptions are handled here
    connectionErrorHandler: (exception, trace, refresh) async {

      print(exception);
      print(trace);
      // This method allows you to reconnect if any error is occurred.
      refresh();
    },
  );


  var idClient=50;

  PrivateChannel myPrivateChannel = client.privateChannel(
      "private-client.$idClient",
    authorizationDelegate:
        EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
      authorizationEndpoint: Uri.parse(AUTH_URL),
      headers: const {
        'Authorization': 'Bearer 1483|Hz8UjrUYLRwoTcKxRUNYuBzIvvlxgNYpxMbk25E3',
      },
    ),
  );


  // Unlike other SDKs, dart_pusher_channels offers binding to events
  // via Dart streams, so it's recommended to create StreamSubscription for
  // each event you want to subscribe for.

  // Keep in mind: those StreamSubscription instances will contintue receiving events
  // unless it gets canceled or channel gets unsubscribed.
  // The statement means: if you cancel an instance of StreamSubscription - events won't be received,
  // if you unsubscribe from a channel  -
  // the stream won't be closed but prevented from receiving events unless you subscribe to the channel again.

  // Listen for events of the channel with .bind method
  StreamSubscription<ChannelReadEvent> somePrivateChannelEventSubs =
      myPrivateChannel.bind("App\\Events\\V1\\RecetteShared").listen((event) {
    print('Event from the private channel fired!');
  });




  // Organizing all subscriptions into 1 for readability
  final allEventSubs = <StreamSubscription?>[
    somePrivateChannelEventSubs,
  ];
  // Organizing all channels for readibility
  final allChannels = <Channel>[
    myPrivateChannel,

  ];

  // Highly recommended to subscribe to the channels when the clients'
  // .onConnectionEstablished Stream fires an event because it enables
  // to resubscribe, for example, when the client reconnects due to
  // a connection error
  final StreamSubscription connectionSubs =
      client.onConnectionEstablished.listen((_) {
    for (final channel in allChannels) {
      // Subscribes to the channel if didn't unsubscribe from it intentionally
      channel.subscribeIfNotUnsubscribed();
    }
  });

  // Connect with the client
  unawaited(client.connect());

  // You can trigger events from Private and Presence Channels

  // Somewhere in future
  await Future.delayed(
    const Duration(seconds: 5),
  );



  // If you no longer need a channel - unsubscribe from it. Channel instances are reusable
  // so it is possible to subscribe to it later, if needed, using .subscribe method.




  // If you no longer need the client - cancel the connection subscription and dispose it.

  // Somewhere in future
  // await Future.delayed(const Duration(seconds: 5));
  // await connectionSubs.cancel();
  // // Consider canceling the event subscriptions to
  // for (final subscription in allEventSubs) {
  //   subscription?.cancel();
  // }
  // client.dispose();
}
