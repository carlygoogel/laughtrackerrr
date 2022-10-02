import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:auth_buttons/auth_buttons.dart';

class PageEntryPoint extends StatefulWidget {
  const PageEntryPoint({
    Key? key,
    this.param1 = '''0''',
  }) : super(key: key);

  final String param1;

  @override
  _StateEntryPoint createState() => _StateEntryPoint();
}

class _StateEntryPoint extends AuthState<PageEntryPoint>
    with SingleTickerProviderStateMixin {
  String state1 = '0';

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
        'name': "EntryPoint",
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
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF).withOpacity(1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: TetaFutureBuilder<TetaUser>(future: Future.sync(() async {
                final user = await TetaCMS.instance.auth.user.get;

                return user;
              }), builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final user = snapshot.data as TetaUser?;
                final data = <String, dynamic>{
                  'isLogged': user?.isLogged,
                  'uid': user?.uid,
                  'name': user?.name,
                  'email': user?.email,
                  'provider': user?.provider,
                  'created_at': user?.createdAt,
                };
                datasets['Teta Auth User'] = [
                  if (data != null) data,
                ];
                return ('''${(this.datasets['Teta Auth User']?[0]?['isLogged']?.toString() ?? '')}''' ==
                        '''true''')
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(r'''You have already logged...''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              maxLines: 2),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 32,
                            ),
                            child: Text(r'''Go to your laughs''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
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
                                  builder: (context) => PageHomePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 16,
                                right: 16,
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                color: context.watch<ThemeCubit>().state
                                    ? TetaThemes.lightTheme[
                                        'Background / Secondary'] as Color
                                    : TetaThemes
                                            .darkTheme['Background / Secondary']
                                        as Color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                  bottomRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                ),
                              ),
                              child: Icon(
                                MdiIcons.fromString('arrow-right'),
                                size: 32,
                                color: context.watch<ThemeCubit>().state
                                    ? TetaThemes.lightTheme['Text / Primary']
                                        as Color
                                    : TetaThemes.darkTheme['Text / Primary']
                                        as Color,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFDEB37).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFFDEB37).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        child: Container(
                                          width: double.maxFinite,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFDEB37)
                                                .withOpacity(1),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                          child: const SizedBox(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 60,
                                      ),
                                      width: double.maxFinite,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF487).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFFFF487).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                        child: Text(r'''LaughTracker''',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 46,
                                                fontStyle: FontStyle.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40,
                                    bottom: 80,
                                  ),
                                  child: Text(r'''Record your
funny memories
remember the
happiest moments.''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:
                                              Color(0xFF000000).withOpacity(1),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 4),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                            ),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 56,
                              child: GoogleAuthButton(
                                onPressed: () async {
                                  await TetaCMS.instance.auth.signIn(
                                      provider: TetaProvider.google,
                                      onSuccess: (final isFirstTime) async {
                                        final user = await TetaCMS
                                            .instance.auth.user.get;

                                        await Navigator.push<void>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PageHomePage(),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              bottom: 5,
                            ),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 56,
                              child: GithubAuthButton(
                                onPressed: () async {
                                  await TetaCMS.instance.auth.signIn(
                                      provider: TetaProvider.github,
                                      onSuccess: (final isFirstTime) async {
                                        final user = await TetaCMS
                                            .instance.auth.user.get;

                                        await Navigator.push<void>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PageHomePage(),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Text(r'''or''',
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
                            child: Container(
                                width: double.maxFinite,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3285FF).withOpacity(1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                  border: null,
                                ),
                                child: Center(
                                  child: Text(
                                    '''Sign in with LaughTracker''',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFFFFFFFF).withOpacity(1),
                                        fontWeight: FontWeight.w400,
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
                          GestureDetector(
                              onTap: () async {
                                await Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageSignUp(),
                                  ),
                                );
                              },
                              child: TextButton(
                                onPressed: () async {
                                  await Navigator.push<void>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageSignUp(),
                                    ),
                                  );
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 20,
                                    ),
                                    child: Center(
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: Text(r'''Sign Up''',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 1)),
                                    )),
                              )),
                        ],
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
