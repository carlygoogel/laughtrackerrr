import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:intl/intl.dart' hide TextDirection;

class PageHomePage extends StatefulWidget {
  const PageHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends AuthState<PageHomePage>
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
        'name': "HomePage",
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
            child: Stack(
              children: [
                SafeArea(
                  left: false,
                  top: true,
                  right: false,
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 30,
                          ),
                          child: Text(r'''Your  Laughs''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: context.watch<ThemeCubit>().state
                                      ? TetaThemes.lightTheme[
                                          'Background / Primary'] as Color
                                      : TetaThemes
                                              .darkTheme['Background / Primary']
                                          as Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              maxLines: 2),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 300,
                        child: TetaFutureBuilder(
                            future: TetaCMS.instance.client.getCollection(
                              '''62e35ba32a876825769cf764''',
                              filters: [],
                              limit: 20,
                              page: 0,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final list = snapshot.data as List<dynamic>?;
                              datasets['Cms fetch'] = list ?? const <dynamic>[];

                              return Builder(
                                builder: (context) {
                                  return PagedVerticalCalendar(
                                    addAutomaticKeepAlives: true,
                                    onDayPressed: (date) async {
                                      index = (datasets['Cms stream']
                                              as List<dynamic>)
                                          .indexOf(datasets['Cms stream']
                                              .firstWhere((element) =>
                                                  element['pattern']
                                                      .toString()
                                                      .substring(0, 10) ==
                                                  date
                                                      .toString()
                                                      .substring(0, 10)));
                                    },
                                    dayBuilder: (context, date) {
                                      final dataset = datasets['Cms stream'];
                                      final element = (dataset as List<dynamic>)
                                          .firstWhereOrNull(
                                        (e) {
                                          final d =
                                              DateTime.tryParse(e['pattern']);
                                          return d?.year == date.year &&
                                              d?.month == date.month &&
                                              d?.day == date.day;
                                        },
                                      );
                                      return Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        decoration: element != null
                                            ? BoxDecoration(
                                                color: Color(0xFFFFF487)
                                                    .withOpacity(1),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  topRight: Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40),
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                ),
                                                border: null,
                                              )
                                            : BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  topRight: Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40),
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                ),
                                                border: null,
                                              ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${date.day}',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    monthBuilder: (context, month, year) {
                                      final monthValue = DateFormat.MMMM()
                                          .format(DateTime(0, month));
                                      return SizedBox(
                                        width: double.maxFinite,
                                        child: Text(
                                          '$monthValue',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }),
                      ),
                      TetaFutureBuilder<TetaUser>(future: Future.sync(() async {
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
                        return TetaStreamBuilder(
                            stream: TetaCMS.instance.realtime.streamCollection(
                              '''62e35ba32a876825769cf764''',
                              filters: [],
                              limit: 20,
                              page: 0,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final list = snapshot.data as List<dynamic>?;
                              datasets['Cms stream'] =
                                  list ?? const <dynamic>[];

                              return SizedBox(
                                width: double.maxFinite,
                                height: 400,
                                child:
                                    NotificationListener<ScrollEndNotification>(
                                  onNotification: (final scrollEnd) {
                                    final metrics = scrollEnd.metrics;
                                    if (metrics.atEdge) {
                                      final isTop = metrics.pixels == 0;
                                      if (isTop) {
                                      } else {}
                                    }
                                    return true;
                                  },
                                  child: ListView.builder(
                                    reverse: false,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        this.datasets['Cms stream'].length > 0
                                            ? this.datasets['Cms stream'].length
                                            : 0,
                                    itemBuilder: (context, index) {
                                      return PageTask(
                                        name: datasets['Cms stream']?[index]
                                                ?['name'] ??
                                            '',
                                        id: datasets['Cms stream']?[index]
                                                ?['_id'] ??
                                            '',
                                        pattern: datasets['Cms stream']?[index]
                                                ?['pattern'] ??
                                            '',
                                      );
                                    },
                                  ),
                                ),
                              );
                            });
                      }),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageCreateTask(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 32,
                              bottom: 56,
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            decoration: BoxDecoration(
                              color: context.watch<ThemeCubit>().state
                                  ? TetaThemes
                                          .lightTheme['Background / Primary']
                                      as Color
                                  : TetaThemes.darkTheme['Background / Primary']
                                      as Color,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                                bottomLeft: Radius.circular(32),
                              ),
                            ),
                            child: Icon(
                              MdiIcons.fromString('plus'),
                              size: 32,
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
