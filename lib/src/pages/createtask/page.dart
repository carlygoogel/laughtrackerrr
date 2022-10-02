import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:auth_buttons/auth_buttons.dart';

class PageCreateTask extends StatefulWidget {
  const PageCreateTask({
    Key? key,
  }) : super(key: key);

  @override
  _StateCreateTask createState() => _StateCreateTask();
}

class _StateCreateTask extends AuthState<PageCreateTask>
    with SingleTickerProviderStateMixin {
  String taskName = '0';
  String patternNumber = '0';

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
        'name': "CreateTask",
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          width: double.maxFinite,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF).withOpacity(1),
          ),
          child: SafeArea(
            left: false,
            top: true,
            right: false,
            bottom: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context, rootNavigator: true).pop(null);
                  },
                  child: Icon(
                    MdiIcons.fromString('arrow-left'),
                    size: 32,
                    color: Color(0xFF000000).withOpacity(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF).withOpacity(1),
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(r'''Insert Funny Event And Date''',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: context.watch<ThemeCubit>().state
                              ? TetaThemes.lightTheme['Text / Secondary']
                                  as Color
                              : TetaThemes.darkTheme['Text / Secondary']
                                  as Color,
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      maxLines: 1),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 8,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 24,
                        top: 8,
                        right: 24,
                        bottom: 8,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2).withOpacity(1),
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
                            taskName = value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2F2).withOpacity(1),
                          counterStyle: TextStyle(
                            color: Color(0xFFF2F2F2).withOpacity(1),
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
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          hintText: r'''enter laugh''',
                          hintStyle: TextStyle(
                            color: Color(0xFF868686).withOpacity(1),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: context.watch<ThemeCubit>().state
                                ? TetaThemes.lightTheme['Text / Secondary']
                                    as Color
                                : TetaThemes.darkTheme['Text / Secondary']
                                    as Color,
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
                        bottom: 10,
                      ),
                      child: Icon(
                        MdiIcons.fromString('calendar-search'),
                        size: 24,
                        color: Color(0xFF000000).withOpacity(1),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await TetaCMS.instance.client.insertDocument(
                            '62e35ba32a876825769cf764', <String, dynamic>{
                          'name': '''${taskName}''',
                          'email':
                              '''${(this.datasets['Teta Auth User']?[0]?['email']?.toString() ?? '')}''',
                          'pattern': '''${patternNumber}''',
                        });
                        Navigator.of(context, rootNavigator: true).pop(null);
                      },
                      child: Container(
                          width: double.maxFinite,
                          height: 56,
                          decoration: BoxDecoration(
                            color: context.watch<ThemeCubit>().state
                                ? TetaThemes.lightTheme['Background / Primary']
                                    as Color
                                : TetaThemes.darkTheme['Background / Primary']
                                    as Color,
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
                              '''Add Laugh''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  fontWeight: FontWeight.w600,
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
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
