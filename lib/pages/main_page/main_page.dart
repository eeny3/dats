import 'package:dats/pages/main_page/main_page_store.dart';
import 'package:dats/resources/styles.dart';
import 'package:dats/widgets/league_card.dart';
import 'package:dats/widgets/match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatefulWidget {
  final Map? onData;

  const MainPage({Key? key, required this.onData}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageStore pageStore = GetIt.I();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conversion Data:'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                widget.onData != null
                    ? Text(widget.onData.toString())
                    : const Text('No conversion data'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.darkGray,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                _showMyDialog();
              },
              child: Text(
                'Alert',
                style: TextStyles.textSize18Weight500
                    .copyWith(color: Palette.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                8.0.w,
                16.h,
                0,
                32.h,
              ),
              child: SizedBox(
                height: 250.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    LeagueCard(
                      pageStore: pageStore,
                      crest: 'https://crests.football-data.org/CL.png',
                      index: 0,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    LeagueCard(
                      pageStore: pageStore,
                      crest: 'https://crests.football-data.org/PL.png',
                      index: 1,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    LeagueCard(
                      pageStore: pageStore,
                      crest: 'https://crests.football-data.org/BL1.png',
                      index: 2,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ),
            Observer(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (pageStore.chosenTabIndex != 0) {
                        pageStore.chosenTabIndex = 0;
                      }
                      pageStore.loadStandings();
                    },
                    child: Text(
                      'МАТЧИ',
                      style: TextStyles.textSize18Weight500.copyWith(
                        color: pageStore.chosenTabIndex != 0
                            ? Palette.white
                            : Palette.yellow,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageStore.chosenTabIndex != 1) {
                        pageStore.chosenTabIndex = 1;
                      }
                      pageStore.loadStandings();
                    },
                    child: Text(
                      'КОМАНДЫ',
                      style: TextStyles.textSize18Weight500.copyWith(
                        color: pageStore.chosenTabIndex != 1
                            ? Palette.white
                            : Palette.yellow,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageStore.chosenTabIndex != 2) {
                        pageStore.chosenTabIndex = 2;
                      }
                      pageStore.loadScorers();
                    },
                    child: Text(
                      'ТОП ИГРОКИ',
                      style: TextStyles.textSize18Weight500.copyWith(
                        color: pageStore.chosenTabIndex != 2
                            ? Palette.white
                            : Palette.yellow,
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: Observer(builder: (context) {
                if (pageStore.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (pageStore.chosenTabIndex == 1) {
                  return ListView.builder(
                      itemCount: pageStore.teams.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.w, vertical: 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'W  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      child: VerticalDivider(
                                        color: Palette.white,
                                        width: 20.w,
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      'D  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      child: VerticalDivider(
                                        color: Palette.white,
                                        width: 20.w,
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      'L  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      child: VerticalDivider(
                                        color: Palette.white,
                                        width: 20.w,
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      'P  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 34.w, vertical: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Row(
                                  children: [
                                    pageStore.teams[index - 1].team.crest
                                                .substring(
                                                    pageStore.teams[index - 1]
                                                            .team.crest.length -
                                                        3,
                                                    pageStore.teams[index - 1]
                                                        .team.crest.length) ==
                                            'svg'
                                        ? SizedBox(
                                            width: 25.w,
                                            child: SvgPicture.network(
                                              pageStore
                                                  .teams[index - 1].team.crest,
                                              width: 25.w,
                                              height: 25.w,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          )
                                        : SizedBox(
                                            width: 25.w,
                                            height: 25.w,
                                            child: Image.network(
                                              pageStore
                                                  .teams[index - 1].team.crest,
                                            ),
                                          ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        pageStore.teams[index - 1].team.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.textSize16Weight400
                                            .copyWith(
                                          color: Palette.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    pageStore.teams[index - 1].won
                                                .toString()
                                                .length <
                                            2
                                        ? '${pageStore.teams[index - 1].won}  '
                                        : pageStore.teams[index - 1].won
                                            .toString(),
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      width: 20.w,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    pageStore.teams[index - 1].draw
                                                .toString()
                                                .length <
                                            2
                                        ? '${pageStore.teams[index - 1].draw}  '
                                        : pageStore.teams[index - 1].draw
                                            .toString(),
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      width: 20.w,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    pageStore.teams[index - 1].lost
                                                .toString()
                                                .length <
                                            2
                                        ? '${pageStore.teams[index - 1].lost}  '
                                        : pageStore.teams[index - 1].lost
                                            .toString(),
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      width: 20.w,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    pageStore.teams[index - 1].points
                                                .toString()
                                                .length <
                                            2
                                        ? '${pageStore.teams[index - 1].points}  '
                                        : pageStore.teams[index - 1].points
                                            .toString(),
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                }
                if (pageStore.chosenTabIndex == 2) {
                  return ListView.builder(
                      itemCount: pageStore.scorers.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.w, vertical: 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'G  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      child: VerticalDivider(
                                        color: Palette.white,
                                        width: 20.w,
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      'A  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      child: VerticalDivider(
                                        color: Palette.white,
                                        width: 20.w,
                                        indent: 0,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      'P  ',
                                      style: TextStyles.textSize16Weight400
                                          .copyWith(
                                        color: Palette.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 34.w, vertical: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Row(
                                  children: [
                                    pageStore.scorers[index - 1].team.crest
                                                .substring(
                                                    pageStore.scorers[index - 1]
                                                            .team.crest.length -
                                                        3,
                                                    pageStore.scorers[index - 1]
                                                        .team.crest.length) ==
                                            'svg'
                                        ? SizedBox(
                                            width: 25.w,
                                            child: SvgPicture.network(
                                              pageStore.scorers[index - 1].team
                                                  .crest,
                                              width: 25.w,
                                              height: 25.w,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          )
                                        : SizedBox(
                                            width: 25.w,
                                            height: 25.w,
                                            child: Image.network(
                                              pageStore.scorers[index - 1].team
                                                  .crest,
                                            ),
                                          ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        pageStore
                                            .scorers[index - 1].player.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.textSize16Weight400
                                            .copyWith(
                                          color: Palette.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    pageStore.scorers[index - 1].goals != null
                                        ? pageStore.scorers[index - 1].goals
                                                    .toString()
                                                    .length <
                                                2
                                            ? '${pageStore.scorers[index - 1].goals}  '
                                            : pageStore.scorers[index - 1].goals
                                                .toString()
                                        : '0  ',
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      width: 20.w,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    pageStore.scorers[index - 1].assists != null
                                        ? pageStore.scorers[index - 1].assists
                                                    .toString()
                                                    .length <
                                                2
                                            ? '${pageStore.scorers[index - 1].assists}  '
                                            : pageStore
                                                .scorers[index - 1].assists
                                                .toString()
                                        : '0  ',
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      width: 20.w,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Text(
                                    pageStore.scorers[index - 1].penalties !=
                                            null
                                        ? pageStore.scorers[index - 1].penalties
                                                    .toString()
                                                    .length <
                                                2
                                            ? '${pageStore.scorers[index - 1].penalties}  '
                                            : pageStore
                                                .scorers[index - 1].penalties
                                                .toString()
                                        : '0  ',
                                    style:
                                        TextStyles.textSize16Weight400.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                }
                return ListView.builder(
                    itemCount: pageStore.matches.length,
                    itemBuilder: (context, index) {
                      return MatchCard(
                        teamOne: pageStore.matches[index].homeTeam.tla ??
                            pageStore.matches[index].homeTeam.name,
                        teamTwo: pageStore.matches[index].awayTeam.tla ??
                            pageStore.matches[index].awayTeam.name,
                        teamOneCrest: pageStore.matches[index].homeTeam.crest,
                        teamTwoCrest: pageStore.matches[index].awayTeam.crest,
                        score:
                            '${pageStore.matches[index].score.fullTime.home}:${pageStore.matches[index].score.fullTime.away}',
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
