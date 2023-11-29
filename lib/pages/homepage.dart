import 'package:flutter/material.dart';
import 'package:flutter_provider_state/providers/homepage_provider.dart';
import 'package:provider/provider.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    print("Called");
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            create: (context)=> HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text(provider.eligibilityMessage.toString(), style: TextStyle(
                        color: provider.isEligible == true ? Colors.green : Colors.red
                    ),),

                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Enter your age'
                      ),
                      onChanged: (val) {
                        if(val.isNotEmpty) {
                          provider.checkEligibility(int.parse(val));
                        }else{
                          provider.eligibilityMessage = "";
                          provider.notifyListeners();
                        }
                      },
                    ),


                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
