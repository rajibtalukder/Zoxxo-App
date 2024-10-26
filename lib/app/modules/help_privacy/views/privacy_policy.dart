import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white),
      body: Padding(
        padding: EdgeInsets.symmetric( horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText("Privacy policy", color: black, size: 18,fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              subTitleText('We are very delighted that you have shown interest in our enterprise. '
                  'Data protection is of a particularly high priority for the management of the '
                  'Zoxxo - FZCO. The use of the Internet pages of the Zoxxo - FZCO is possible '
                  'without any indication of personal data; however, if a data subject wants to '
                  'use special enterprise services via our website, processing of personal data '
                  'could become necessary. If the processing of personal data is necessary and '
                  'there is no statutory basis for such processing, we generally obtain consent '
                  'from the data subject. The processing of personal data, such as the name, '
                  'address, e-mail address, or telephone number of a data subject shall always '
                  'be in line with the General Data Protection Regulation (GDPR), and in '
                  'accordance with the country-specific data protection regulations applicable '
                  'to the Zoxxo - FZCO. By means of this data protection declaration, our '
                  'enterprise would like to inform the general public of the nature, scope, '
                  'and purpose of the personal data we collect, use and process. Furthermore, '
                  'data subjects are informed, by means of this data protection declaration, of '
                  'the rights to which they are entitled. As the controller, the Zoxxo - FZCO has '
                  'implemented numerous technical and organizational measures to ensure the most '
                  'complete protection of personal data processed through this website. However, '
                  'Internet-based data transmissions may in principle have security gaps, so '
                  'absolute protection may not be guaranteed. For this reason, every data '
                  'subject is free to transfer personal data to us via alternative means, '
                  'e.g. by telephone.', 
                  color: black,fontWeight: FontWeight.w400, textCenter: false, size: 14),
              SizedBox(height: 40.h),
              titleText("DEFINITIONS", color: black, size: 18,fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "The data protection declaration of the Zoxxo - FZCO is based on the terms used by the European legislator for the adoption of the General Data Protection Regulation (GDPR). Our data protection declaration should be legible and understandable for the general public, as well as our customers and business partners. To ensure this, we would like to first explain the terminology used."),
              numberText('2. ', "In this data protection declaration, we use, inter alia, the following terms:"),

              SizedBox(height: 40.h),
              titleText("PERSONAL DATA", color: black, size: 18,fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"Personal data means any information relating to an identified or identifiable natural person (“data subject”). An identifiable natural person is one who can be identified, directly or indirectly, in particular by reference to an identifier such as a name, an identification number, location data, an online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity of that natural person."),

              SizedBox(height: 40.h),
              titleText("DATA SUBJECT", color: black, size: 18,fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"Data subject is any identified or identifiable natural person, whose personal data is processed by the controller responsible for the processing."),

              SizedBox(height: 40.h),
              titleText("PROCESSING", color: black, size: 18,fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"Processing is any operation or set of operations which is performed on personal data or on sets of personal data, whether or not by automated means, such as collection, recording, organisation, structuring, storage, adaptation or alteration, retrieval, consultation, use, disclosure by transmission, dissemination or otherwise making available, alignment or combination, restriction, erasure or destruction."),
              SizedBox(height: 20.h),

            ],
          ),
        ),
      ),
    );
  }

  Widget numberText(String num, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 26.w,
          child: subTitleText(num,
              color: black,
              fontWeight: FontWeight.w400,
              textCenter: false,
              size: 14),
        ),
        SizedBox(
          width: 306.w,
          child: subTitleText(text,
              color: black,
              fontWeight: FontWeight.w400,
              textCenter: false,
              size: 14),
        ),
      ],
    );
  }

}
