import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Column(
        children: [
        //  logo
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 40, top: 160
            ),
            child: Image.asset('lib/images/avocado.png'),
          ),
        //  we deliver groceries at your doorstep
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "we deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const SizedBox(height: 24,),
        //  fresh item everyday
          Text(
            "fresh item everyday",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                 return const Homepage();
                },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child:const Text(
                "get start",
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
