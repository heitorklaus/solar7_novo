import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:solardino/app/shared/responsive/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../shared/responsive/responsive_layout.dart';
import '../home/view/home_page.dart';

class OnboardingIntro extends StatelessWidget {
  OnboardingIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: 'Introduction screen',
        debugShowCheckedModeBanner: false,
        home: OnBoardingPage(),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final controller = PageController();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String verificationID = "";
  var phoneControllerFormatter = new MaskTextInputFormatter(
      mask: '(##)-#####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    Future loginWithPhone() async {
      await auth.verifyPhoneNumber(
        phoneNumber: '+55${phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          otpVisibility = true;
          verificationID = verificationId;
          setState(() {
            introKey.currentState?.next();
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }

    void verifyOTP() async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otpController.text);

      await auth.signInWithCredential(credential).then((value) {
        print(credential.verificationId);
        print("You are logged in successfully");
        Modular.to.pushNamed('/home');
//AOO2nWVdDKI2snvMiHR5k55l-0i3B4l-CVigbgCEgApg0YvC2QCp-JWoz7rt3ekEjl1y3xHpGgXW3Zr5bzjrWLwI4B2E7-r9LkhkpbOij-TNITDcHtNj_Eg7R6UMzQJJ4zz58ufLYmQn1tgXy6h-6Y0MsGzMtvrvCc1TeE0NLyllF6OL7_WawIDMKawAb6MqHxqYw6g2Tk_QFKulR1i7ZZ46AtUwhhYko18i1cCn5gq2yWVq83hjhHE
        Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      globalHeader: Align(alignment: Alignment.topRight, child: Text('s')),

      pages: [
        PageViewModel(
          titleWidget: Container(
            alignment: Alignment.center,
            child: Container(
              width: 290,
              child: Wrap(
                runSpacing: 5.0,
                spacing: 5.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('lib/app/shared/assets/images/Selected.png',
                          width: 20),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Faça Orçamentos PDF em Instantes')
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('lib/app/shared/assets/images/Selected.png',
                          width: 20),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Altere e Crie o Design da Sua Proposta')
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('lib/app/shared/assets/images/Selected.png',
                          width: 20),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Princiais Equipamentos de Energia Solar')
                    ],
                  )
                ],
              ),
            ),
          ),
          bodyWidget: Container(
            width: ResponsiveLayout.isComputer(context) ? 500 : double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Constants.corPrimaria),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              child: Text(
                'Avançar',
                style: Constants.textButtonWhite,
              ),
              onPressed: () {
                introKey.currentState?.next();
                //introKey.currentState?.animateScroll(1);
              },
            ),
          ),
          image: Image.asset(
            'lib/app/shared/assets/images/intro3.png',
          ),
          reverse: false,
          decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              imagePadding: EdgeInsets.only(top: 10, left: 5, right: 5),
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.center,
              footerPadding: EdgeInsets.only(bottom: 40)),
        ),
        PageViewModel(
          titleWidget: Column(
            children: [
              Text(
                " Vamos lá!",
                style: Constants.textTitleOnboarding.copyWith(fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                " O que você deseja fazer?",
                style: Constants.subTextTitleOnboarding.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ResponsiveLayout.isComputer(context)
                    ? 500
                    : double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Constants.corPrimaria),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Text(
                    'Criar um novo cadastro!',
                    style: Constants.textButtonWhite,
                  ),
                  onPressed: () {
                    introKey.currentState?.next();
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: ResponsiveLayout.isComputer(context)
                    ? 500
                    : double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Constants.corPrimaria),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Text(
                    'Já estou cadastrado!',
                    style: Constants.textButtonWhite,
                  ),
                  onPressed: () {
                    Modular.to.pushNamed('/home');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ResponsiveLayout.isComputer(context)
                    ? 500
                    : double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade600),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Text(
                    'Fazer uma proposta já!',
                    style: Constants.textButtonWhite,
                  ),
                  onPressed: () {
                    Modular.to.pushNamed('/home');
                  },
                ),
              ),
            ],
          ),
          bodyWidget: Column(
            children: [],
          ),
          image: Image.asset(
            'lib/app/shared/assets/images/introe.png',
          ),
          reverse: false,
          decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 3,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.center,
              imagePadding: EdgeInsets.only(left: 5, right: 5, top: 50)),
        ),
        PageViewModel(
          // titleWidget: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextField(
          //       controller: phoneController,
          //       decoration: InputDecoration(labelText: "Phone number"),
          //       keyboardType: TextInputType.phone,
          //     ),
          //     Visibility(
          //       child: TextField(
          //         controller: otpController,
          //         decoration: InputDecoration(),
          //         keyboardType: TextInputType.number,
          //       ),
          //       visible: otpVisibility,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     ElevatedButton(
          //         onPressed: () {
          //           if (otpVisibility) {
          //             verifyOTP();
          //           } else {
          //             loginWithPhone();
          //           }
          //         },
          //         child: Text(otpVisibility ? "Verify" : "Login")),
          //   ],
          // ),
          titleWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Digite seu celular para iniciar o cadastro!",
                style: Constants.textTitleOnboarding.copyWith(fontSize: 21),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        controller: phoneController,
                        onChanged: (value) => {},
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Telefone'),
                        inputFormatters: <TextInputFormatter>[
                          phoneControllerFormatter
                        ],

                        onTap: () {},
                        //autofocus: true,
                        style:
                            Constants.textToFormFields.copyWith(fontSize: 22),
                        // controller: controller.codigoInputController,
                        onFieldSubmitted: (v) {},
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ResponsiveLayout.isComputer(context)
                    ? 400
                    : double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Constants.corPrimaria),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Text(
                    'Avançar',
                    style: Constants.textButtonWhite,
                  ),
                  onPressed: () async {
                    // Modular.to.pushNamed('/home');
                    await loginWithPhone();
                    //introKey.currentState?.next();
                  },
                ),
              ),
            ],
          ),

          bodyWidget: Column(
            children: [],
          ),
          image: Image.asset(
            'lib/app/shared/assets/images/intro22.png',
          ),
          reverse: false,
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.center,
            imagePadding: EdgeInsets.only(top: 20, left: 9, right: 9),
            footerPadding: EdgeInsets.only(bottom: 40),
          ),
        ),
        PageViewModel(
          body: "",
          image: Image.asset('lib/app/shared/assets/images/intro6.png'),
          titleWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Digite o código de confirmação',
                style: Constants.textTitleOnboarding.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          // new LengthLimitingTextInputFormatter(1),
                        ],
                        controller: otpController,
                        onChanged: (value) => {},
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.zero,
                        ),
                        textAlign: TextAlign.center,
                        onTap: () {},
                        //autofocus: true,
                        style:
                            Constants.textToFormFields.copyWith(fontSize: 25),
                        // controller: controller.codigoInputController,
                        onFieldSubmitted: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          footer: Container(
            width: ResponsiveLayout.isComputer(context) ? 400 : double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Constants.corPrimaria),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              child: Text(
                'Verificar',
                style: Constants.textButtonWhite,
              ),
              onPressed: () {
                verifyOTP();
              },
            ),
          ),
          reverse: false,
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 3,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
            imagePadding: EdgeInsets.only(top: 00, left: 15, right: 15),
            footerPadding: EdgeInsets.only(bottom: 40),
          ),
        ),
      ],
      showDoneButton: false,
      freeze: false,
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      showNextButton: false,
      //  scrollPhysics: const NeverScrollableScrollPhysics(),

      nextFlex: 0,

      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),

      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color.fromARGB(255, 0, 0, 0),
        activeColor: Constants.corPrimaria,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      animationDuration: 1000,
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body:
            const Center(child: Text("This is the screen after Introduction")),
      ),
    );
  }
}
