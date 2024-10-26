import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_texts.dart';

class TermsService extends StatelessWidget {
  const TermsService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText("TERMS OF SERVICE",
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              subTitleText('May 2024',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 20.h),
              subTitleText(
                  'zoxxo offers a plattform to move your data, such as: ',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 20.h),
              subTitleText(
                  ' • a service to share files (“zoxxo File Sharing”) \n • a service that '
                  'allows you to store, organize, \n    share and receive content from '
                  'multiple \n    sources (“Manage”); \n • a service that allows you to present '
                  'your \n    brand on zoxxo plattform (“Ads”); and \n • additional features and '
                  'functionalities. ',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 20.h),
              subTitleText(
                  'The Services may be provided to you online, in the '
                  'form of a mobile and/or desktop application(s) and/or may be integrated '
                  'in a third party service. Your use of and access to our services, '
                  'software, websites (including browser extensions) and/or applications '
                  '(together: “Services”) are governed by these Terms of Service (“Terms”).The '
                  'Services allow you to upload, submit, store, share, receive, collect, '
                  'capture and/or visualize your ideas, texts, graphics, videos, data, '
                  'information, files, presentation decks or other content, including third '
                  'party content used by you (together: “Content”). You retain all rights in- '
                  'and responsibility and liability for all Content. zoxxo does not claim ownership '
                  'of your Content. The Services are provided to you as the user of the Services '
                  'by zoxxo B.V. (“zoxxo”, “We”), with its main office at IFZA Business Park, DDP, '
                  '25898 - 001, Dubai Silicon Oasis in Dubai, United Arab Emirates, registered with '
                  'the Trade License under 25898.',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
              titleText("Applicability",
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',
                  'You are only allowed to use the Services when aged 16 or older.'),
              numberText('2. ',
                  'Please read the Terms carefully. By using the Services (directly with us or through a third party application, plug-in, extension or integration) you agree and accept these Terms and our Notice and Take Down Policy (“NTD Policy”). To the use of personal data and cookies in relation to the Services our Privacy & Cookie Statement applies.'),
              numberText('3. ',
                  'If the Services include, are used in connection with, or are integrated in the services of third parties, the terms and conditions, notice and take down policies and/or privacy and cookie policies of those third parties may apply in addition to these Terms. If you are using the Services on behalf of your employer or another organization, you are agreeing to the terms of that organization and you represent and warrant that you have the authority to do so. zoxxo is not responsible for any third party services, terms and/or policies'),
              numberText('4. ', "If you want to file a complaint or notice about unlawful Content being stored or shared via the Services or the zoxxo API, please read our NTD Policy."),
              numberText('5. ', "If you become aware of a vulnerability in any of the Services, please read our Responsible Disclosure Policy."),
              numberText('6. ', "If you want to use the zoxxo API (as described in the API Terms of Use) our API Terms of Use apply in addition to these Terms."),
              numberText("7. ", "zoxxo can amend the Terms from time to time. The amended Terms will become effective upon them being posted on zoxxo website(s) and/or on zoxxo's mobile and/or desktop application(s), or at such later date as may be stated on the amended Terms. Therefore, we recommend that you review the Terms from time to time and take note of any changes. By continuing your use of the Services you accept the amended Terms. In case of material changes to the Terms, you will be informed prior to the change: (i) at the moment you use the Services, or (ii) by a message to the contact details you provided to us, or (iii) by a posting of the notice of the change on zoxxo's website(s) and/or on zoxxo's mobile and/or desktop application(s). In the event you don't accept a change you can cancel your subscription."),
              numberText('8. ', "These Terms supersede any and all prior oral and written quotations, terms, communications, agreements and understandings between you and zoxxo."),
              numberText('9. ', "The following parts of these Terms apply to specific Services only:"),
              numberText(' ', "  • Clause 2: zoxxo File Sharing;"),
              numberText(' ', "  • Clause 3: Manage;"),
              numberText(' ', "  • Clause 4: Ads;"),
              numberText(' ', "  • Clause 5: all paid subscription Services;"),
              numberText(' ', "  • Clause 9: zoxxo Teams;"),
              numberText('10. ', "All other clauses apply to all Services."),
              SizedBox(height: 40.h),
              titleText("Zoxxo File Sharing",
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "zoxxo File Sharing allows you to share your Content with others."),
              numberText('2. ', "To share your Content you need to upload it and provide us with (a limited number of) email addresses of recipient(s) (“email transfer”) or choose to distribute a download link yourself (“link transfer”). If you use link transfer you will not be informed of any downloads by others."),
              numberText('3. ', "Zoxxo File Sharing provides the possibility to share Content up to a maximum total capacity. Uploaded Content is stored on Zoxxo’s servers for a limited period of time after which the ability to download expires. Depending on the transfer type some limitations apply, which you can find here."),
              numberText('4. ', "After the expiry period Zoxxo will permanently delete the uploaded files. These files will not be available nor retrievable anymore."),
              numberText('5. ', "The basic functionality of Zoxxo File Sharing is (currently) free from registration and charge."),
              numberText('6. ', "Zoxxo treats Content as confidential and does not control the use of download links, regardless of whether they are originally distributed by us or by you. Recipients can forward the links and allow others to use them. You are solely responsible for the Content you upload and share."),
              numberText('7. ', "Zoxxo Pro and Premium are paid subscription versions that - compared to the free version - offer you a set of premium services and different subscription terms (listed below). You can find more information here."),
              numberText('8. ', "A Zoxxo subscription (whether Free, Pro or Premium) includes subscriptions to Collect and Paste as well. The exact features of Collect and Paste differ per Zoxxo subscription. You can find more information here."),
              numberText('9. ', "Zoxxo reserves the right to automatically delete all Content uploaded with Zoxxo Pro and still available on our servers, 28 days after your Zoxxo Pro or Premium subscription has ended."),
              numberText('10. ', "Zoxxo Premium offers you (amongst others) unlimited Zoxxo File Sharing storage. You will have 5 Terabyte of capacity at your disposal. Should you require more, then you can file a request at support@zoxxo.com."),
              numberText('11. ', "Zoxxo Teams (“Teams”) is a paid subscription version of Zoxxo Pro and Zoxxo Premium, which allows you to add team members to your Zoxxo Pro or Premium account. Team members can be easily added and removed per subscription period."),
              numberText('12. ', "The start date of the Teams paid subscription period is when you have signed up as team owner (“Team Owner”) of the Teams account."),
              numberText('13. ', "For Teams, additional payment and cancellation terms apply. These are listed in Clause 5."),


              SizedBox(height: 40.h),
              titleText("Payment conditions",
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "If you use a paid subscription Service, the initial subscription term starts once the fees due have been paid in full."),
              numberText('2. ', "We may introduce or change the fees for the Services from time to time, for which we will give you advance notice. If you have a fixed term and price subscription, that price will remain in force for the fixed term. If you do not agree with the price change, you may cancel your subscription and stop using the Services by the end of the then-current Service term. If you continue to use the Services after the price change goes into effect, you agree to pay the changed price. Fee introductions will require your prior consent and registration."),
              numberText('3. ', "Depending on the payment method you choose, the issuer of the payment method may charge you certain fees relating to the processing of your payment."),
              numberText('4. ', "You can change your payment method in your account settings of the respective Service or by contacting our Help Center."),
              numberText('5. ', "Zoxxo may suspend or cancel the Services to you if a payment is not successfully settled (for instance in case of insufficient funds, expiration of credit cards, a change in payment details or otherwise). Suspension or cancellation of the Services for non-payment can result in a loss of access to and use of your account and your Content."),
              numberText('6. ',"If you subscribe and pay us through the Apple App Store or Google Play Store, the terms of Apple or Google may also apply."),
              SizedBox(height: 40.h),
              titleText("Term and cancellation of a subscription",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "The initial subscription term varies depending on your choice and/or the Service it applies to."),
              numberText('2. ', "Apart from your cancellation rights under local mandatory consumer law, you have the right to cancel your subscription during the first 14 days, unless you start using the Service during this period whereby you waive your right to cancel."),
              numberText('3. ', "The subscription period will be renewed automatically for the selected subscription period, unless you have cancelled your subscription on time (before the last day of your subscription)."),
              numberText('4. ', "In case of cancellation you will continue to have access to the Services until the end of your paid subscription period. For instance: if the commencement date of your monthly subscription is 2 February and you cancel your subscription on 17 October, you will continue to have access until 2 November."),
              numberText('5. ', "Paste and Collect Pro are linked to your Zoxxo subscription. A cancellation of this subscription means you will also lose access to Paste and Collect Pro."),
              numberText('6. ',"Cancellation does not give you any right to reimbursement of (part of) the subscription fee, unless local mandatory consumer law obliges to do so."),
              numberText('7. ',"In case your subscription is automatically renewed for a period of more than three (3) months, you will have the right to cancel the subscription at any time after such renewal with a cancellation term of one (1) month. In case of cancellation based on this clause you may request reimbursement of part of the subscription fee. This means that you pay for the period until the cancellation enters into force, based on the standard monthly fee for the respective Service."),
              numberText('8. ',"Upon cancellation or if a payment is not successfully settled (for instance due to expiration or insufficient funds), your account will be deactivated after the end of your subscription period. You will then not have access to your personal data, address book and any Content stored using the Service(s). You can reactivate your subscription at any time in your account settings by making payment within four weeks after deactivation. Your subscription will then be renewed as from the day of reactivation."),
              numberText('9. ',"If you do not reactivate your subscription within the term set out above, any of your Content stored using the Service(s) and any of your information, including your personal content, settings, address book and any files stored for transfer may have been automatically and permanently deleted from our servers."),
              numberText('10. ',"If you subscribe through the Apple App Store, the terms of Apple may apply to the term and cancellation of your subscription instead of the terms in this clause."),
              SizedBox(height: 40.h),
              titleText("Zoxxo Teams - Payment, term and cancellation",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "A Teams account is registered on behalf of its Team Owner. The Team Owner will be billed for all team members that are subscribed to the Teams account."),
              numberText('2. ', "The Team Owner and individual team members can add team members to the Teams account, after which such new team members have immediate access to the account. If team members are added during a current subscription period, the Team Owner is charged pro rata for the days that remain during that subscription period. After that, the Team Owner will be fully charged for the new team member in the next paid subscription period."),
              numberText('3. ', "The Team Owner and individual team members can remove team members from the Teams account, after which such team members will immediately lose access to the account. If team members are removed during a current subscription period, the Team Owner will be charged for this team member until the end of that paid subscription period. The Team Owner will not be charged for the removed team member in the next paid subscription period."),
              numberText('4. ', "Any unused days in a paid subscription period due to the removal of a team member, may be used for a newly added team member during that same paid subscription period."),
              numberText('5. ', "If a Teams account is cancelled, the Team Owner and team members continue to have access to the Teams account until the end of the paid subscription period. After the paid subscription period, the Team Owner and the team members will automatically get access to an individual, free Zoxxo account."),
              SizedBox(height: 40.h),
              titleText("Content ownership, permissions and responsibility",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "Zoxxo does not claim any ownership of the Content you create, use, store or share through the Services and you are solely responsible for it. Also you are solely responsible for sharing it with the correct recipients. Any liability for damages relating to the Content lies with the individual that creates, uses, stores and/or shares it within the Services. You acknowledge that download and/or access links can be forwarded and that recipients having access to such links, can access the Content it's connected with."),
              numberText('2. ', "Some of the Services allow you to protect Content or transfers with a password. The user is solely responsible for the confidentiality and/or the distribution of passwords."),
              numberText('3. ', "By using the Services you warrant that you have, for any Content you create, use, store or share using the Services, all required permissions (including from copyright and other intellectual property rights owners) to distribute, sub-license, transfer, store and/or make the Content online available as part of the Services."),
              numberText('4. ', "Zoxxo is not liable to you or any third party for any damages arising out of or in relation to the Content created, used, stored or shared by you within the Services, including but not limited to, copyright protected works and/or trademarks."),
              numberText('5. ', "Zoxxo requires a license from you with regards to the Content FOR THE SOLE PURPOSE OF OPERATING, ENABLING, AND IMPROVING THE SERVICES. Solely for this explicit purpose and until you delete the Content from the Services, you agree and acknowledge that by using the Services, you grant us an unlimited, worldwide, royalty-free license to (i) use, host, store, scan, search, sort, index, create previews and (ii) reproduce, communicate, publish, publicly display, distribute and edit (including but not limited to scaling, cropping, adapting and translating) the Content. THE LICENSE PART UNDER (ii) DOES NOT APPLY TO ZOXXO FILE SHARING as set out in clause 2 of these Terms. For the avoidance of doubt, Zoxxo will not sell or advertise the Content: Zoxxo only requires the license FOR THE SOLE PURPOSE OF OPERATING, ENABLING, AND IMPROVING THE SERVICES."),
              numberText('6. ', "Zoxxo does not provide any public search function, catalogue or listing to find Content."),
              numberText('7. ', "Zoxxo may show you ads from advertisers and artists selected by Zoxxo (such as full-page wallpaper ads) when you use the Services."),
              numberText('8. ', "More information on the use of your personal data and cookies (including for performance marketing) is available in our Privacy & Cookie Statement."),
              SizedBox(height: 40.h),
              titleText("Content ownership, permissions and responsibility",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "Zoxxo respects your rights and expects that you respect those of others, including Zoxxo, its artists, advertisers and third parties. This includes respecting the right to privacy, corporate intelligence, business secrets and intellectual property rights, such as trademarks, copyrights, trade names and logos. You agree not to use the Services to commit, promote, enable or facilitate any unlawful or criminal acts or breach of these Terms or facilitate or promote others to do so."),
              numberText('2. ', "As a condition to make use of the Services you agree not to create, use, store or share any Content that:"),
              numberText(' ', "• features CSAI (child sexual abuse imagery);"),
              numberText(' ', "• is obscene, defamatory, libelous, slanderous, profane, indecent, discriminating, threatening, abusive, harmful, lewd, vulgar, or unlawful;"),
              numberText(' ', "• promotes racism, violence or hatred;"),
              numberText(' ', "• is factually inaccurate, false, misleading, misrepresenting or deceptive;"),
              numberText(' ', "• you don't hold the rights to;"),
              numberText(' ', "• infringes, violates or misappropriates intellectual property rights, privacy rights, including data protection rights, and/or any other kind of rights;"),
              numberText(' ', "• infringes on or violates any applicable law or regulation; and/or"),
              numberText(' ', "• constitutes hate speech, whether directed at an individual or a group, and whether based upon the race, sex, creed, national origin, religious affiliation, sexual orientation, language or another characteristic of such individual or group."),
              numberText('3. ', "In addition, you agree not to:"),
              numberText(' ', "• abuse, harass, stalk, intimidate, threaten, commit violence, or otherwise act unlawful, or encourage anyone else to do so;"),
              numberText(' ', "• impersonate or falsely pretend affiliation with any person or entity;"),
              numberText(' ', "• access any non-public areas of the Services;"),
              numberText(' ', "• interfere with any access or use restrictions;"),
              numberText(' ', "• use any data mining or data gathering or extraction methods, or otherwise collect information about the users of the Services;"),
              numberText(' ', "• send viruses, worms, malware, ransomware, junk email, spam, chain letters, phishing emails, unsolicited messages, promotions or advertisements of any kind and for any purpose;"),
              numberText(' ', "• interfere with, damage or disrupt the Services or act in a way that may do so;"),
              numberText(' ', "• attempt to probe, scan, compromise or test the vulnerability of the Services or any related service, system or network or breach any security or authentication, unless you do so in accordance with our Responsible Disclosure Policy;"),
              numberText(' ', "• use automated means to access or use the Services without our permission;"),
              numberText(' ', "• reverse engineer or decompile any (part) of the Services;"),
              numberText(' ', "• resell, sublicence, rent, lease, offer or otherwise commercialize the Services without our permission; and/or"),
              numberText(' ', "• allow others to use your account."),
              SizedBox(height: 40.h),
              titleText("Violation of the Terms of Service",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "Violation of the Terms of Service Zoxxo reserves the right to investigate, provide to third parties, (temporarily) block and/or permanently delete from it servers, without prior notice or liability, any Content and/or account information or to block anyone from accessing any part of the Services, when Zoxxo ascertains, at its sole discretion or after receiving substantiated and valid complaints, that you breach these Terms or act in violation of any applicable law or regulation. More information is available in our Notice and Takedown Policy."),

              SizedBox(height: 40.h),
              titleText("Intellectual property rights",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ', "All intellectual property rights and/or similar rights on the Services (including the software, wallpapers, WePresent content, photography, graphic design, typography, portraits, logos, trademarks, trade names, domain names, copyrights and patents) are vested in Zoxxo and/or its licensors and you are not allowed to use, remove, modify, copy, mirror, distribute, decompile, or reverse engineer any of it in any way."),
              numberText('1. ', "Zoxxo is not responsible or liable for third party content published within the Services, in-ad links to external websites or the content, products or services offered on external websites. You acknowledge and accept that all use outside the Services is at your own risk."),
              numberText('1. ', "You will always respect and observe the good name and reputation of Zoxxo and ensure that your use of the Services will in no way prejudice any rights and/or the good name and reputation of Zoxxo and its licensors."),

              SizedBox(height: 40.h),
              titleText("Disclaimer and account registration",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"Zoxxo provides the Services “AS-IS”, without any warranty of any kind. Without limiting the foregoing, Zoxxo explicitly disclaims any warranties of merchantability, fitness for a particular purpose and non-infringement. Zoxxo makes no warranty that the Services are available on an uninterrupted, secure or error-free basis. Your use of the Services is at your own risk. You acknowledge and agree that Zoxxo is not responsible for any damages to the computer system or mobile device of you or any third party that result from the use of the Services and is not responsible for any failure of the Services to store, transfer or delete a file or for the corruption or loss of any data, information or Content contained in a file."),
              numberText('2. ',"Zoxxo may change, terminate or expand its Services from time to time and reserves the right to limit access to or eliminate any features or functionality of the Services in its own discretion."),
              numberText('3. ',"Some of the Services require you to register and provide us with data such as your email address, password and/or payment details. You must ensure that these are accurate and keep them updated in your account settings. You are responsible for any activity from or by your account, so you should not share your password and you should protect it carefully. Should registrations or account data appear to be misused, Zoxxo reserves the right to delete the account. Zoxxo is not liable for any loss or damage arising from the unauthorized use of your account."),

              SizedBox(height: 40.h),
              titleText("Disclaimer and account registration",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"You will defend, indemnify and hold harmless Zoxxo (including its employees and affiliates) from and against any claims, incidents, liabilities, procedures, damages, losses and expenses (including legal and accounting fees), arising out of or in any way connected with your access to or use of the Services or your breach of these Terms, including any third party claims that Content created, used, stored or shared using the Services by you or through your account, infringe or violate any third party rights."),
              numberText('2. ',"The Services may provide integration with third-party services. You acknowledge that:"),
              numberText(' ', "• Zoxxo is not responsible for any acts or omissions of such third-party services;"),
              numberText(' ', "• That Zoxxo is not an agent of such third-party services; and"),
              numberText(' ', "• Your use of those services is subject to any applicable terms and conditions between you and the providers of such services."),
              numberText('3. ',"To the extent permissible under local mandatory law, Zoxxo is not liable for any damage or personal injury resulting from any use of the Services, including any (temporary) unavailability or (accidental) removal of your Content or account. The limitation of liability referred to in this clause shall not apply if the liability for damage caused by intent or gross negligence on the part of Zoxxo. In the event Zoxxo is liable for damage under mandatory law, Zoxxo’s aggregate liability to you – to the extent permissible under local mandatory law – for any and all claims arising out of or in connection with the use of the Services will in no event exceed the amount of one hundred euro (\$100) per incident."),

              SizedBox(height: 40.h),
              titleText("Waiver, Severability & Assignment",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"Zoxxo's failure to enforce a provision is not a waiver of its right to do so later."),
              numberText('2. ',"If any (part of a) provision of these Terms is found to be illegal, unenforceable or otherwise invalid, then"),
              numberText(' ', "• The rest of the Terms will remain in full force and effect to the extent permissible under or consistent with the relevant laws; and"),
              numberText(' ', "• That part will be deemed to be deleted and substituted by a valid one which in its economic effect comes closest to the invalid part."),
              numberText('3. ',"You may not assign any of your rights under these Terms. Zoxxo is at any time entitled to assign its rights to any of its affiliates or subsidiaries, or to any successor in interest of any business associated with the Services without your consent or any other restriction."),

              SizedBox(height: 40.h),
              titleText("Contact",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"You can contact WeTransfer at support@zoxxo.io or by using our Help Center If you have any questions, just send us an email in English."),

              SizedBox(height: 40.h),
              titleText("Applicable law and Jurisdiction",
                  textCenter: false,
                  color: black, size: 18, fontWeight: FontWeight.w600),
              SizedBox(height: 20.h),
              numberText('1. ',"These Terms and any non-contractual obligations arising out of or in connection with it will be governed by and construed and interpreted in accordance with UAE law, including mandatory consumer law. These Terms will not limit any consumer protection rights that you may be entitled to under the mandatory laws of your country of residence."),
              numberText('2. ',"Any disputes regarding these Terms will be submitted to the exclusive jurisdiction of the competent court in the UAE (with the exception of UAE private international law)."),

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
