import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/theme/light_color.dart';
import 'package:flutter_wallet_app/src/widgets/balance_card.dart';
import 'package:flutter_wallet_app/src/widgets/bottom_navigation_bar.dart';
import 'package:flutter_wallet_app/src/widgets/title_text.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _appBar() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://jshopping.in/images/detailed/591/ibboll-Fashion-Mens-Optical-Glasses-Frames-Classic-Square-Wrap-Frame-Luxury-Brand-Men-Clear-Eyeglasses-Frame.jpg"),
        ),
        SizedBox(width: 25),
        TitleText(text: "Bonjour,"),
        Text(' Bamba Athj',
            style: GoogleFonts.mulish(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: LightColor.yellow2)),
        Expanded(
          child: SizedBox(),
        ),
        Icon(
          Icons.menu,
          color: Theme.of(context).iconTheme.color,
        )
      ],
    );
  }

  Widget _operationsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,


      children: <Widget>[
        _icon(Icons.transfer_within_a_station, "Transfert"),
        _icon(Icons.phone, "Achat crédit "),
        _icon(Icons.payment, "Ma Carte "),
        _icon(Icons.live_help, "Réclamation"),
      ],
    );
  }

  Widget _icon(IconData icon, String text) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/transfer');
          },
          child: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff3f3f3),
                      offset: Offset(5, 5),
                      blurRadius: 15)
                ]),
            child: Icon(icon),
          ),
        ),
        Text(text,
            style: GoogleFonts.mulish(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff76797e))),
      ],
    );
  }

  Widget _transectionList() {
    return Column(
      children: <Widget>[
        _transection("Achat crédit Orange", "01 Avril 2022"),
        _transection("Versement Touba ca Kanam", "25 Mars 2022"),
        _transection("Paiement facture", "03 Mars 2022"),
      ],
    );
  }

  Widget _transection(String text, String time) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: LightColor.navyBlue1,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.person, color: Colors.lightBlueAccent),
      ),
      contentPadding: EdgeInsets.symmetric(),
      title: TitleText(
        text: text,
        fontSize: 18,
      ),
      subtitle: Text(time,
        style: TextStyle(
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.bold,

        ),),
      trailing: Container(
          height: 40,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: LightColor.yellow2,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text('7500 fcfa',
              style: GoogleFonts.mulish(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: LightColor.black))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35),
                  _appBar(),
                  SizedBox(
                    height: 50,
                  ),
                  TitleText(
                      text: "Votre porte monnaie,",
                      color: Colors.blueGrey,
                      fontSize: 25,
                        ),

                  SizedBox(
                    height: 40,
                  ),
                  BalanceCard(),
                  SizedBox(
                    height: 50,
                  ),
                  TitleText(
                    text: "Opérations",

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _operationsWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  TitleText(
                    text: "Transactions",
                  ),
                  _transectionList(),
                ],
              )),
        )));
  }
}
