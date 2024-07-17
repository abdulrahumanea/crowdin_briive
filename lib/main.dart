import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crowdin_sdk/crowdin_sdk.dart';
import 'package:flutter_gen/gen_l10n/crowdin_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Crowdin.init(
    distributionHash: '1d63c79fec62ac9aba455a8qiym',
    connectionType: InternetConnectionType.any,
    updatesInterval: const Duration(minutes: 25),
    
    withRealTimeUpdates: true,
    authConfigurations: CrowdinAuthConfig(
      clientId: 'VZYmwo5Lv2CD6wukb27d',
      clientSecret: '3EBF6AJI2XIjbWbz2LADxiwbv1dAcbuj4JphKNn7',
      redirectUri: 'intouchappai://',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CrowdinRealTimePreviewWidget(
      child: MaterialApp(
        localizationsDelegates: CrowdinLocalization.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(AppLocalizations.of(context)!.helloWorld),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
