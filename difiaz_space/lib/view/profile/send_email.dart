import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/helpers/loading.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/presenter/send_report.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main_page.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({Key? key}) : super(key: key);

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  String? name, email, message;
  String? errName, errEmail, errMessage;
  String subject = "Contact Defiaz";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Phản hồi",
          style: TextStyle(color: colorLeadingAppbar),
        ),
        leading: leadingAppbar(context, colorIcon: colorLeadingAppbar),
        backgroundColor: backgroundColorAppBar,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchField(hintText: "Tên", error: errName, maxLength: 50,type: 0, height: 50, maxLines: 1),
            searchField(hintText: "Email", error:errEmail,type: 1, height: 50, maxLines: 1),
            searchField(
                hintText: "Nội dung", error: errMessage, maxLength: 300,type: 2, height: 50, maxLines: 10),
            btnSubmit(name: "$name", email: "$email", message: "$message", subject: subject),
          ],
        ),
      ),
    );
  }

  Widget btnSubmit({
    required String email,
    required String name,
    required String subject,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: colorContainerViewMore,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
          onPressed: () async{
            errName = await checkFullName(name);
            errMessage = await checkMessage(message);
            errEmail = await checkEmail(email);
            if(errName == null && errMessage == null && errEmail == null) {
              int status = await sendEmail(
                  email: email, name: name, subject: subject, message: message);
            if(status == 200){
              loadingSuccess(status: "Gửi thành công");
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
            }else {
              loadingFail(status: "Gửi thất bại");
            }
            }
            setState(() {});
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0))),
          ),
          child: Text(
            "Gửi",
            style: GoogleFonts.manrope(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }

  Widget searchField(
      {required type, required double height, int? maxLength, maxLines, hintText, error}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      // height: height,
      child: TextField(
        cursorColor: colorHexa("7cc618"),
        maxLines: maxLines,
        maxLength: maxLength,
        // textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: "$hintText",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorHexa("7cc618"),
              ),
              borderRadius: BorderRadius.circular(17)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          errorText: error
        ),
        onChanged: (value) {
          setState(() {
            switch (type) {
              case 0:
                name = value.trim();
                break;
              case 1:
                email = value.trim();
                break;
              case 2:
                message = value.trim();
                break;
            }
          });
        },
      ),
    );
  }
}
