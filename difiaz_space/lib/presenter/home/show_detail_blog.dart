import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/model/get/get_data_comments.dart';
import 'package:difiaz_space/model/model_data_comment.dart';
import 'package:difiaz_space/presenter/home/out_standing.dart';
import 'package:difiaz_space/presenter/load_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBlog extends StatefulWidget {
  String htmlData, title, mainUrl, redirectUrl;
  int id;

  DetailBlog(
      {required this.id,
      required this.htmlData,
      required this.title,
      required this.mainUrl,
      required this.redirectUrl});

  @override
  _DetailBlogState createState() => _DetailBlogState();
}

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

class _DetailBlogState extends State<DetailBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () => shareBlog(
                    title: widget.title,
                    mainUrl: widget.mainUrl,
                    redirectUrl: widget.redirectUrl),
                child: const SizedBox(
                    height: 25,
                    width: 25,
                    child: Icon(
                      Icons.ios_share,
                      color: Colors.blue,
                    ))),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        // title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Image.asset(
        //     'images/logo_defiaz.png',
        //     fit: BoxFit.contain,
        //     height: 50,
        //   ),
        // ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(widget.mainUrl)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.center,
                child: Text(
                  "${widget.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Html(
                data: widget.htmlData,
                onLinkTap: (url, _, __, ___) {
                  launchURL(url);
                },

                // style: {
                //   "table": Style(
                //     backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                //   ),
                //   "tr": Style(
                //     border: Border(bottom: BorderSide(color: Colors.grey)),
                //   ),
                //   "th": Style(
                //     padding: EdgeInsets.all(6),
                //     backgroundColor: Colors.grey,
                //   ),
                //   "td": Style(
                //     padding: EdgeInsets.all(6),
                //     alignment: Alignment.topLeft,
                //   ),
                //   'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                // },
                // customRender: {
                //   "table": (context, child) {
                //     return SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child:
                //       (context.tree as TableLayoutElement).toWidget(context),
                //     );
                //   },
                //   "bird": (RenderContext context, Widget child) {
                //     return TextSpan(text: "🐦");
                //   },
                //   "flutter": (RenderContext context, Widget child) {
                //     return FlutterLogo(
                //       style: (context.tree.element!.attributes['horizontal'] != null)
                //           ? FlutterLogoStyle.horizontal
                //           : FlutterLogoStyle.markOnly,
                //       textColor: context.style.color!,
                //       size: context.style.fontSize!.size! * 5,
                //     );
                //   },
                // },
                // customImageRenders: {
                //   networkSourceMatcher(domains: ["flutter.dev"]):
                //       (context, attributes, element) {
                //     return FlutterLogo(size: 36);
                //   },
                //   networkSourceMatcher(domains: ["mydomain.com"]):
                //   networkImageRender(
                //     headers: {"Custom-Header": "some-value"},
                //     altWidget: (alt) => Text(alt ?? ""),
                //     loadingWidget: () => Text("Loading..."),
                //   ),
                //   // On relative paths starting with /wiki, prefix with a base url
                //       (attr, _) =>
                //   attr["src"] != null && attr["src"]!.startsWith("/wiki"):
                //   networkImageRender(
                //       mapUrl: (url) => "https://upload.wikimedia.org" + url!),
                //   // Custom placeholder image for broken links
                //   networkSourceMatcher():
                //   networkImageRender(altWidget: (_) => FlutterLogo()),
                // },
                // onImageTap: (src, _, __, ___) {
                //   print(src);
                // },
                // onImageError: (exception, stackTrace) {
                //   print(exception);
                // },
                // onCssParseError: (css, messages) {
                //   print("css that errored: $css");
                //   print("error messages:");
                //   messages.forEach((element) {
                //     print(element);
                //   });
                // },
              ),
              SizedBox(
                height: 1.5,
                width: 37,
                child: Container(
                  color: colorHexa("d5d5d5"),
                ),
              ),
              writeComment(),
              SizedBox(
                height: 1.5,
                // width: 37,
                child: Container(
                  color: colorHexa("e8e8e8"),
                ),
              ),
              LoadComments(id: widget.id),
            ],
          ),
        ),
      ),
    );
  }

  Widget writeComment() {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 20),
      height: 50,
      child: TextField(
        cursorColor: colorHexa("7cc618"),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: "Write a comment...",
          suffixIcon: GestureDetector(
              onTap: () {
                print('Click send comment');
              },
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Image(image: AssetImage("images/send.png")),
              )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorHexa("7cc618"),
              ),
              borderRadius: BorderRadius.circular(17)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }
}
