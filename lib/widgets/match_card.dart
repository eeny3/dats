import 'package:dats/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MatchCard extends StatelessWidget {
  final String teamOne;
  final String teamTwo;
  final String teamOneCrest;
  final String teamTwoCrest;
  final String score;

  const MatchCard({
    Key? key,
    required this.teamOne,
    required this.teamTwo,
    required this.teamOneCrest,
    required this.teamTwoCrest,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50.w,
            child: Text(
              teamOne,
              textAlign: TextAlign.left,
              style: TextStyles.textSize16Weight500.copyWith(
                color: Palette.white,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          teamOneCrest.substring(
                      teamOneCrest.length - 3, teamOneCrest.length) ==
                  'svg'
              ? SizedBox(
                  width: 30.w,
                  child: SvgPicture.network(
                    teamOneCrest,
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.scaleDown,
                  ),
                )
              : SizedBox(
                  width: 30.w,
                  height: 30.w,
                  child: Image.network(
                    teamOneCrest,
                  ),
                ),
          SizedBox(
            width: 32.w,
          ),
          Text(
            score,
            style: TextStyles.textSize16Weight500.copyWith(
              color: Palette.white,
            ),
          ),
          SizedBox(
            width: 32.w,
          ),
          teamTwoCrest.substring(
                      teamTwoCrest.length - 3, teamTwoCrest.length) ==
                  'svg'
              ? SizedBox(
                  width: 30.w,
                  child: SvgPicture.network(
                    teamTwoCrest,
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.scaleDown,
                  ),
                )
              : SizedBox(
                  width: 30.w,
                  height: 30.w,
                  child: Image.network(
                    teamTwoCrest,
                  ),
                ),
          SizedBox(
            width: 16.w,
          ),
          SizedBox(
            width: 50.w,
            child: Text(
              teamTwo,
              textAlign: TextAlign.right,
              style: TextStyles.textSize16Weight500.copyWith(
                color: Palette.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
