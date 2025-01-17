import 'package:country_code_picker_x/country_code_picker_x.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../Cosntants/constants.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CountryCodePickerX(
        alignLeft: true,
        padding: EdgeInsets.zero,
        hideSearch: true,
        showFlag: true,
        flagWidth: 20,
        flagDecoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.white,

          // border: Border.all(color: btnblue),
          // borderRadius: BorderRadius.circular(100),
        ),
        dialogSize: Size(300, 300),
        showOnlyCountryWhenClosed: false,
        showCountryOnly: false,
        initialSelection: 'US',
        textStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
    // Container(
    //   height: 55,
    //   width: 150,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     border: Border.all(color: Colors.grey),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Center(
    //     child: ),
    // );
  }
}
