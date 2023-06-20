import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    OneSignal.shared.setAppId("c9facca8-58ed-4112-837b-54e57879b3c7");

    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      final data = openedResult.notification.additionalData!;
      final route = data['route'] as String?;

      if (route != null) {
        GoRouter.of(context).go(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Routing and Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Home Page')),
            ElevatedButton(
                onPressed: () => context.push('/second'),
                child: const Text('Second Page')),
          ],
        ),
      ),
    );
  }
}
