import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:using_packages/servers/flutter_toast.dart';
import 'package:using_packages/servers/platform_id.dart';

import '../servers/log_servises.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("using packages"),
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.purple),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.pink],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: TextButton(
                  onPressed: () {
                    LogService.d("Debug log");
                    LogService.i("Info log");
                    LogService.w("Servis log");
                    LogService.e("errror log");
                  },
                  child: const Text(
                    "Show Loags",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: TextButton(
                  onPressed: () {
                    Utils.showToast("Toast is here!!");
                  },
                  child: const Text(
                    "Show Toast",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: TextButton(
                  onPressed: () async{
                    var id = await PlatformId.getDeviceId();
                    LogService.i(id);
                  },
                  child: const Text(
                    "Show id of platform",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
