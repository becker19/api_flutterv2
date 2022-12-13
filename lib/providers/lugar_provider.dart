import 'package:api_flutterv2/models/lugar_model.dart';
import 'package:flutter/cupertino.dart';

class LugarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Lugar lugar;
  LugarFormProvider(this.lugar);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
