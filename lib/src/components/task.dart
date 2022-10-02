import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:auth_buttons/auth_buttons.dart';

class PageTask extends StatefulWidget {
  const PageTask({
    Key? key,
    this.name = '''0''',
    this.id = '''0''',
    this.pattern = '''0''',
  }) : super(key: key);

  final String name;
  final String id;
  final String pattern;

  @override
  _StateTask createState() => _StateTask();
}

class _StateTask extends AuthState<PageTask>
    with SingleTickerProviderStateMixin {
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
        'name': "Task",
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 16,
        right: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 150,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF000000).withOpacity(1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Card(
              elevation: 10,
              color: Color(0xFFF4F4F4).withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Text('''${widget.pattern}''',
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(),
            child: Card(
              elevation: 10,
              color: Color(0xFFFFF487).withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Text('''${widget.name}''',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
