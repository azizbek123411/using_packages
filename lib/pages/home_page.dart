import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:using_packages/servers/flutter_toast.dart';
import 'package:using_packages/servers/platform_id.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../servers/log_servises.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _launchURL(String url)async{
    final Uri uri=Uri(scheme: "https",host: url);
    if(!await launchUrl(
        uri,
    mode: LaunchMode.externalApplication
    )){
      throw "Don't launch";
    }
  }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: IconButton(
                      onPressed: ()async{
                        String callURl="tel:";
                        if(await canLaunchUrlString(callURl)){
                          launchUrlString(callURl);
                        }print("Can't url");
                      },
                      icon: const Icon(Icons.call,size: 30,),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: TextButton(
                    onPressed: (){
                      _launchURL("www.youtube.com");
                    },
                      child: const Text(
                        "URl launcher",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: IconButton(
                      onPressed: ()async{
                        String smsURL="sms:";
                        if(await canLaunchUrlString(smsURL)){
                          launchUrlString(smsURL);
                        }print("Can't launch");
                      },
                      icon: const Icon(Icons.sms,size: 30,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
