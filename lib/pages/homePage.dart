import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model_provider.dart';

import '../components/grocery_item_tile.dart';
import 'card_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context){
          return CardPage();
        },
        ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(height: 48,),
            //good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child:
              Text(
                  "Good morning",
              ),
            ),
             const SizedBox(height: 4,),
            // Let's order fresh item for you
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh item for you",
                style: GoogleFonts.notoSans(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 24,),
          //  divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 24,),
          //  fresh item + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(child: Consumer<CardModel>(
              builder: (context, value, child){
              return GridView.builder(
                itemCount: value.shopeItems.length,
                padding: EdgeInsets.all(12),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                ),
                itemBuilder: (context, index){
                  return GroceryItemTile(
                    itemName: value.shopeItems[index][0],
                    itemPrice: value.shopeItems[index][1],
                    imagePath: value.shopeItems[index][2],
                    color: value.shopeItems[index] [3],
                    onPressed: (){
                      Provider.of<CardModel>(context, listen: false).addItemTocart(index);
                    },
                  );
                },
              );
            },
            ),
            )
          ],
        ),
      ),
    );
  }
}
