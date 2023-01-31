import 'package:flutter/material.dart';

import 'brand_custom.dart';
import 'button_text_custom.dart';
import 'fields_custom.dart';

class UserBodyCustom extends StatelessWidget {
  const UserBodyCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      color: const Color(0XFF595959),
      child: Center(
        child: ListView(
          children: const [
            BrandCustom(),
            FieldsCustom(),
            ButtonTextCustom(),
          ],
        ),
      ),
    );
  }
}
