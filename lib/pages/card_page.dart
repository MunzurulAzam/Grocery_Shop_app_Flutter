import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model_provider.dart';
class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black,),
      ),
      body: Consumer<CardModel>(builder: (context, value, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.notoSans(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: ListView.builder(
              itemCount: value.cardItems.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(value.cardItems[index][2],
                      height: 36,),
                      title: Text(
                        value.cardItems[index][0],
                      ),
                      subtitle: Text('\$'+value.cardItems[index][1],),
                      trailing: IconButton(
                          onPressed: ()=>
                          Provider.of<CardModel>(context, listen: false)
                              .removeItems(index),
                          icon: Icon(Icons.cancel))
                    ),
                  ),
                );
              },
            ),),
          //  total+pay now
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green,
                borderRadius: BorderRadius.circular(12),),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "total Price",
                          style: TextStyle(
                            color: Colors.green[100],
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text("\$"+value.calculateTotal(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              "pay now",
                            style: TextStyle(color: Colors.white,),
                            ),
                            Icon(Icons.arrow_forward_ios,size: 16,
                            color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },)
    );
  }
}
