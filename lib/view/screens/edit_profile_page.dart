import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/category_dropdown.dart';
import 'package:sira/view/widgets/education_level_dropdown.dart';
import 'package:sira/view/widgets/experience_level_dropdown.dart';
import 'package:sira/view/widgets/skill_dropdown.dart';
import 'package:sira/view/widgets/text_fields.dart';
import 'package:sira/view/widgets/upload_attachment.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _profile_tagcont = TextEditingController();
  final _phoneNumberCont = TextEditingController();
  final _socialMediaCont = TextEditingController();
  final _aboutYourselfCont = TextEditingController();
  String? categroyTxt;
  String? expTxt;
  String? skillTxt;
  String? educationLevelTxt;

  callbackCategory(categoryChoice) {
    setState(() {
      categroyTxt = categoryChoice;
    });
  }

  callbackExperience(categoryChoice) {
    setState(() {
      expTxt = categoryChoice;
    });
  }

  callbackSkill(categoryChoice) {
    setState(() {
      skillTxt = categoryChoice;
    });
  }

  callbackEducationLevel(categoryChoice) {
    setState(() {
      educationLevelTxt = categoryChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.locale = const Locale('en', 'US');

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.pushNamed(context, '/MyProfilePage');
          }),
          icon: Icon(
            Icons.arrow_back,
            color: CustomColors.blackTextColor,
          ),
        ),
        title: Text(
          'edit-profile'.tr().toString(),
          style: TextStyle(color: CustomColors.blackTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.access_time_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.3,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.07,
                    0,
                    MediaQuery.of(context).size.width * 0.07,
                    0),
                child: Column(children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height * 0.09,
                              backgroundColor: CustomColors.blackTextColor,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.person_outline,
                                      color: CustomColors.blackTextColor,
                                      size: MediaQuery.of(context).size.height *
                                          0.08,
                                    ),
                                    radius: MediaQuery.of(context).size.height *
                                        0.089,
                                    backgroundColor:
                                        CustomColors.backgroundColor,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right:
                                          -MediaQuery.of(context).size.height *
                                              0.009,
                                      child: IconButton(
                                        color: CustomColors.blackTextColor,
                                        iconSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        icon: Icon(Icons.camera_alt_outlined),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.edit_outlined,
                                size: MediaQuery.of(context).size.height * 0.04,
                                color: CustomColors.blackTextColor,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: Container(
                      child: Column(
                        children: [
                          TextFieldPage(
                              hint_text: 'profile-tag',
                              field_icon: Icons.tag,
                              field_height: 0.03,
                              editingController: _profile_tagcont,
                              maximumLines: 1),
                          CategoryDropDown(
                              item: categroyTxt.toString(),
                              callbackFunction: callbackCategory),
                          SkillDropDown(
                            item: skillTxt.toString(),
                            callbackFunction: callbackSkill,
                          ),
                          TextFieldPage(
                              hint_text: 'phone-number',
                              field_icon: Icons.call,
                              field_height: 0.03,
                              editingController: _phoneNumberCont,
                              maximumLines: 1),
                          ExperienceLevelDropDown(
                              item: expTxt.toString(),
                              callbackFunction: callbackExperience),
                          EducationLevelDropDown(
                            item: educationLevelTxt,
                            callbackFunction: callbackEducationLevel,
                          ),
                          TextFieldPage(
                              hint_text: 'social-media',
                              field_icon: Icons.link,
                              field_height: 0.03,
                              editingController: _socialMediaCont,
                              maximumLines: 1),
                          TextFieldPage(
                              hint_text: 'about-yourself',
                              field_icon: Icons.description,
                              field_height: 0.05,
                              editingController: _aboutYourselfCont,
                              maximumLines: 4),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: const UploadAttachment(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: FloatingActionButton(
            backgroundColor: CustomColors.buttonBlueColor,
            onPressed: () {
              try {
                Map<String, dynamic> userData = {
                  "Profile-tag-line": _profile_tagcont.text,
                  "category": categroyTxt,
                  "skill-level": skillTxt,
                  "phone-number": _phoneNumberCont.text,
                  "experience-level": expTxt,
                  "education-level": educationLevelTxt,
                  "social-media-link": _socialMediaCont.text,
                  "about-yourself": _aboutYourselfCont.text
                };
                FirebaseFirestore.instance
                    .collection('User Full Profile')
                    .doc(_phoneNumberCont.text)
                    .set(userData);
              } catch (e) {
                showSnackBar(e.toString(), Colors.red, context);
              }
            },
            child: Icon(
              Icons.done,
              color: CustomColors.backgroundColor,
            )),
      ),
    );
  }
}
