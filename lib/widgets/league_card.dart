import 'package:dats/pages/main_page/main_page_store.dart';
import 'package:dats/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeagueCard extends StatelessWidget {
  final MainPageStore pageStore;
  final String crest;
  final int index;

  const LeagueCard({
    Key? key,
    required this.pageStore,
    required this.crest,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (pageStore.chosenLeagueIndex != index) {
              pageStore.chosenTabIndex = 0;
              pageStore.chooseLeague(index);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 8.w,
            ),
            child: pageStore.chosenLeagueIndex == index
                ? PhysicalModel(
                    color: Palette.yellow,
                    elevation: 8,
                    shadowColor: Palette.yellow,
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: 170.w,
                      height: 220.w,
                      decoration: BoxDecoration(
                        color: Palette.yellow,
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                          image: NetworkImage(
                            crest,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 170.w,
                    height: 220.w,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          crest,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
          ),
        );
      }
    );
  }
}
