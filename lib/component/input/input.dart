import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String text = "";
  String icon = "";
  String type = "normal";

  Input({Key key, this.text, this.icon, this.type}) : super(key: key);

  @override
  InputState createState() {
    return new InputState(this.text, this.icon, this.type);
  }
}

class InputState extends State<Input> {
  String text = "";
  String icon = "";
  String type = "normal";
  bool isHideText = false;
  String suffixIcon = "assets/关闭icon.png";
  final hideIcons = ["assets/眼睛打开icon.png", "assets/眼睛闭icon.png"];
  String value = "";
  bool showSuffix = false;
  final controller = TextEditingController();

  InputState(text, icon, type) {
    this.text = text;
    this.icon = icon;
    this.type = type;
  }

  @override
  void initState() {
    if (this.type == 'password') {
      this.isHideText = true;
      this.suffixIcon = "assets/眼睛打开icon.png";
    }
    this.controller.addListener(() {
      setState(() {
        this.value = this.controller.text;
        if (this.value.length == 0) {
          this.showSuffix = false;
        } else {
          this.showSuffix = true;
        }
      });
    });
    super.initState();
  }

  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        style: TextStyle(color: Color(0xFFFFFFFF)),
        obscureText: this.isHideText,
        onSaved: (value) {
          setState(() {
            this.value = value;
          });
        },
        controller: this.controller,
        decoration: InputDecoration(
          hintText: this.text,
          hintStyle: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w300),
          contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Image(
              image: AssetImage(this.icon),
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon: this.showSuffix
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (this.type == 'password') {
                        this.isHideText = !this.isHideText;
                        this.suffixIcon =
                            this.hideIcons[this.isHideText ? 0 : 1];
                      } else {
                        this.controller.text = "";
                        if (this.value.length == 0) {
                          this.showSuffix = false;
                        } else {
                          this.showSuffix = true;
                        }
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Image(
                      image: AssetImage(this.suffixIcon),
                      width: 16,
                      height: 16,
                    ),
                  ))
              : null,
        ),
      ),
    );
  }
}
