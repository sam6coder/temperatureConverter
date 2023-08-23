import 'package:flutter/material.dart';
import 'main.dart';

class Conversion{
  String finalAnswer='';

  void handleTemp(){
    if(value==1){
      outputF.value=(inputC*9/5+32).toString();
      outputK.value=(inputC+273.15).toString();
      finalAnswer=outputF.toString()+" F";
    }
    else if(value==2){
      outputC.value=((inputF-32)*5/9).toString();
      outputK.value=((inputF-32)*5/9+273.15).toString();
      finalAnswer=outputC.toString()+" C";
    }
    else{
      outputC.value=(inputK-273.15).toString();
      outputF.value=((inputK-273.15)*9/5+32).toString();
      finalAnswer=outputC.toString()+" C";
    }
  }
}