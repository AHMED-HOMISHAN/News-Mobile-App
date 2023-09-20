import 'package:flutter/material.dart';
import 'package:newsapp/pages/WebViewScreen.dart';
import 'package:newsapp/components/constant.dart';

Widget newsCard({
  required String title,
  String? image,
  required String author,
  required String time,
  required String url,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebViewScreen(
                url: url,
                title: title,
              )));
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                child: image == null
                    ? Image.asset(
                        'assets/images/news.png',
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(image, fit: BoxFit.cover),
                      ),
              ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(color: primaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                author,
                style: const TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
              ),
              Text(
                time.substring(0, 10),
                style: const TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget defaultForm({
  required TextEditingController controller,
  required TextInputType type,
  required IconData prefixIcon,
  IconData? sufixIcon,
  bool validate = false,
  String validationMessage = 'This field is required',
  bool isPassword = false,
  required String label,
  required Function() suffixIconPressed,
  Function()? onSubmit,
  void Function(String value)? onChange,
  Color borderColor = primaryColor,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword == true ? true : false,
    keyboardType: type,
    validator: validate == true
        ? (value) {
            if (value!.isEmpty) {
              return validationMessage;
            }
            if (isPassword == true && value.length < 4) {
              return 'The Password is too short';
            }
            return null;
          }
        : null,
    onTap: onSubmit,
    onChanged: onChange,
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: sufixIcon != null
          ? GestureDetector(
              onTap: suffixIconPressed,
              child: Icon(sufixIcon),
            )
          : null,
      labelText: label,
      border: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.solid, color: borderColor)),
    ),
  );
}
