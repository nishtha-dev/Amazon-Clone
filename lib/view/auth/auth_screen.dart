import 'package:amazon_clone/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Account { createAccount, signIn }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Account? _accountVal = Account.signIn;
  bool isLogin = false;
  String countryCode = "+";
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Center(
          child: Image.asset(
            'assets/images/amazon_logo.png',
            height: height * 0.03,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: white,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.02,
                width: width * 0.02,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: greyShade3),
                    ),
                    color: white),
                child: Column(
                  children: [
                    Container(
                        // padding: EdgeInsets.all(8.0),
                        color: greyShade2,
                        height: height * 0.06,
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isLogin = isLogin;
                                });
                              },
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.04,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    color: white),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.circle,
                                  size: height * 0.01,
                                  color: isLogin ? transparent : secondaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Create Account. ',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'New to Amazon?',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold))
                            ]))
                          ],
                        )

                        // RadioListTile<Account>(
                        //   title: const Text('Create Account. New to Amazon?'),
                        //   value: Account.createAccount,
                        //   groupValue: _accountVal,
                        //   onChanged: (Account? value) {
                        //     setState(() {
                        //       _accountVal = value;
                        //     });
                        //   },
                        // ),
                        ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        // padding: EdgeInsets.all(8.0),
                        height: height * 0.06,
                        width: width,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03, vertical: height * 0.01),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isLogin = true;
                                });
                              },
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.04,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    color: white),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.circle,
                                  size: height * 0.01,
                                  color: isLogin ? secondaryColor : transparent,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Sign In. ',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Already a customer?',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold))
                            ]))
                          ],
                        )

                        // RadioListTile<Account>(
                        //   title: const Text('Create Account. New to Amazon?'),
                        //   value: Account.createAccount,
                        //   groupValue: _accountVal,
                        //   onChanged: (Account? value) {
                        //     setState(() {
                        //       _accountVal = value;
                        //     });
                        //   },
                        // ),
                        ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  onSelect: (val) {
                                    setState(() {
                                      countryCode = '+${val.phoneCode}';
                                    });
                                  });
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: grey,
                                  ),
                                  color: greyShade2,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  countryCode,
                                  style: textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.06,
                            width: width * 0.68,
                            child: TextFormField(
                              cursorColor: black,
                              style: textTheme.displaySmall,
                              decoration: InputDecoration(
                                hintText: 'Mobile Number',
                                hintStyle: textTheme.bodySmall,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: grey,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: grey,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: secondaryColor,
                                    width: 2,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: red,
                                    width: 2,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: red,
                                    width: 1,
                                  ),
                                ),
                              ),
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: amber,
                            minimumSize: Size(width * 0.9, height * 0.06)),
                        child: Text(
                          'Continue',
                          style: textTheme.displaySmall,
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'By continuing you agree to Amazon\'s ',
                            style: textTheme.labelMedium),
                        TextSpan(
                            text: 'Condition of use ',
                            style:
                                textTheme.labelMedium!.copyWith(color: blue)),
                        TextSpan(text: 'and ', style: textTheme.labelMedium),
                        TextSpan(
                            text: 'Privacy Notice',
                            style: textTheme.labelMedium!.copyWith(color: blue))
                      ])),
                    ),

                    // Container(
                    //   padding: EdgeInsets.all(8.0),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       color: Colors.white),
                    //   child: Column(
                    //     children: [
                    //       RadioListTile<Account>(
                    //         title:
                    //             const Text('Sign In. Already have an account?'),
                    //         value: Account.createAccount,
                    //         groupValue: _accountVal,
                    //         onChanged: (Account? value) {
                    //           setState(() {
                    //             _accountVal = value;
                    //           });
                    //         },
                    //       ),
                    //       SizedBox(
                    //         height: 15,
                    //       ),
                    //       Row(
                    //         children: [
                    //           TextFormField(
                    //             decoration: InputDecoration(
                    //               disabledBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(6),
                    //                 borderSide: const BorderSide(
                    //                   color: Colors.grey,
                    //                   width: 1,
                    //                 ),
                    //               ),
                    //             ),
                    //             enabled: false,
                    //             controller: TextEditingController(text: '91'),
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           TextFormField(
                    //             decoration: InputDecoration(
                    //               enabledBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(6),
                    //                 borderSide: const BorderSide(
                    //                   color: Colors.grey,
                    //                   width: 1,
                    //                 ),
                    //               ),
                    //               focusedBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(6),
                    //                 borderSide: const BorderSide(
                    //                   color: Colors.black,
                    //                   width: 2,
                    //                 ),
                    //               ),
                    //               focusedErrorBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(6),
                    //                 borderSide: const BorderSide(
                    //                   color: Colors.red,
                    //                   width: 2,
                    //                 ),
                    //               ),
                    //               errorBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(6),
                    //                 borderSide: const BorderSide(
                    //                   color: Colors.red,
                    //                   width: 1,
                    //                 ),
                    //               ),
                    //             ),
                    //             keyboardType: TextInputType.number,
                    //             inputFormatters: [
                    //               FilteringTextInputFormatter.digitsOnly
                    //             ],
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: 2,
                width: width,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [white, greyShade2, white])),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Condition of use',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                  Text(
                    'Privacy Notice',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                  Text(
                    'Help',
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Text(
                  '@1996-2023, Amazon.com, Inc or its affiliates',
                  style: textTheme.labelMedium!.copyWith(color: grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
