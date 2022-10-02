import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:auth_buttons/auth_buttons.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({
    Key? key,
  }) : super(key: key);

  @override
  _StateSignUp createState() => _StateSignUp();
}

class _StateSignUp extends AuthState<PageSignUp>
    with SingleTickerProviderStateMixin {
  String email = '0';
  String password = '0';
  String status = '0';

  var datasets = <String, dynamic>{};
  int index = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    TetaCMS.instance.analytics.insertEvent(
      TetaAnalyticsType.usage,
      'App usage: view page',
      <String, dynamic>{
        'name': "SignUp",
      },
      isUserIdPreferableIfExists: true,
    );

    unawaited(
      Future.delayed(
        Duration.zero,
        () async {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withOpacity(1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 190,
                      ),
                      child: Text(r'''Email''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                          top: 8,
                          right: 25,
                          bottom: 30,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: null,
                        ),
                        child: TextField(
                          onChanged: (String value) async {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF).withOpacity(1),
                            counterStyle: TextStyle(
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            hintText: r'''Enter email''',
                            hintStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          minLines: 1,
                          showCursor: true,
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(r'''Password''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                          top: 8,
                          right: 25,
                          bottom: 30,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: null,
                        ),
                        child: TextField(
                          onChanged: (String value) async {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF).withOpacity(1),
                            counterStyle: TextStyle(
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            hintText: r'''Enter password''',
                            hintStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          minLines: 1,
                          showCursor: true,
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(r'''Confirm Password''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                          top: 8,
                          right: 25,
                          bottom: 8,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: null,
                        ),
                        child: TextField(
                          onChanged: (String value) async {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFFFFFF).withOpacity(1),
                            counterStyle: TextStyle(
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            hintText: r'''Re-type your password''',
                            hintStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          minLines: 1,
                          showCursor: true,
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        bottom: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(builder: (context) {
                            var val = false;
                            return StatefulBuilder(
                              builder: (final context, final localSetState) {
                                return Checkbox(
                                  value: val,
                                  onChanged: (final bool? b) {
                                    localSetState(() {
                                      val = b!;
                                    });
                                  },
                                );
                              },
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                            ),
                            child: Text(r'''I agree with''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFF000000).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                          ),
                          TextButton(
                            onPressed: () async {},
                            child: Text(r'''terms & conditions''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFF000000).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (email != null && password != null) {
                              setState(() {
                                status = 'Loading';
                              });
                              final response = await Supabase
                                  .instance.client.auth
                                  .signUp(email, password);
                              if (response.error != null) {
                                setState(() {
                                  status = 'Failed';
                                });
                              } else {
                                setState(() {
                                  status = 'Success';
                                });
                                await Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageSignIn(),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                              width: 250,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7E809).withOpacity(1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                border: null,
                              ),
                              child: Center(
                                child: Text(
                                  '''Sign In''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.ltr,
                                ),
                              )),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(r'''or''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF838383).withOpacity(1),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 80,
                        top: 10,
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(r'''Already have an account?''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF474747).withOpacity(1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  await Navigator.push<void>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageSignIn(),
                                    ),
                                  );
                                },
                                child: TextButton(
                                  onPressed: () async {
                                    await Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PageSignIn(),
                                      ),
                                    );
                                  },
                                  child: Text(r'''Sign In''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:
                                              Color(0xFF62ECC5).withOpacity(1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 1),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFF7E809).withOpacity(1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          Navigator.of(context, rootNavigator: true).pop(null);
                        },
                        child: TextButton(
                          onPressed: () async {
                            Navigator.of(context, rootNavigator: true)
                                .pop(null);
                          },
                          child: Icon(
                            MdiIcons.fromString('chevron-left'),
                            size: 40,
                            color: Color(0xFF000000).withOpacity(1),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 55,
                        top: 15,
                      ),
                      child: Text(r'''Sign Up''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF000000).withOpacity(1),
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          maxLines: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
