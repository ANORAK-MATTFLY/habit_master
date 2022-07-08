import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  String shapesAnimation = "assets/rive/shapes.riv";
  final myController = TextEditingController();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height - 130.0),
            width: (MediaQuery.of(context).size.width - 50.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(11, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 170.0),
            width: (MediaQuery.of(context).size.width - 50.0),
            child: Blur(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              blur: 80,
              colorOpacity: 0.1,
              blurColor: const Color.fromARGB(255, 101, 101, 101),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 170.0),
            width: (MediaQuery.of(context).size.width - 50.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Center(
                    child: Text(
                      "Bienvenu !",
                      style: TextStyle(
                        color: Color.fromARGB(255, 41, 41, 41),
                        fontFamily: "Twitterchirp",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 100.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        icon: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            color: Color.fromARGB(27, 255, 96, 28),
                          ),
                          child: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 215, 128, 99),
                          ),
                        ),
                        labelText: "Nom",
                        labelStyle: const TextStyle(
                          color: Color(0xFFB4B4B4),
                          fontFamily: "Twitterchirp",
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 100.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        icon: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            color: Color.fromARGB(27, 255, 96, 28),
                          ),
                          child: const Icon(
                            Icons.password_outlined,
                            color: Color.fromARGB(255, 215, 128, 99),
                          ),
                        ),
                        labelText: "Mot de passe",
                        labelStyle: const TextStyle(
                          color: Color(0xFFB4B4B4),
                          fontFamily: "Twitterchirp",
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: 60.0,
                      width: 300.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(157, 225, 74, 28),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 50.0,
                          width: 150.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.arrow_forward, color: Colors.white),
                              Text(
                                "Ce connecter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Twitterchirp",
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Vous n'avez pas de compte ?  ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 90, 90, 90),
                              fontFamily: "Twitterchirp",
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "S'enregistrer",
                            style: TextStyle(
                              color: Color.fromARGB(255, 246, 117, 53),
                              fontFamily: "Twitterchirp_Bold",
                              fontSize: 13.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 150.0,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cancel, color: Colors.black, size: 35.0),
              ),
            ),
          ),
        ],
      );
    });
  }
}
