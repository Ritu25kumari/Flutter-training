import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.teal
        ,
      ),
      home: TimeDatePicker(),
    );
  }
}
class TimeDatePicker extends StatefulWidget {

  const TimeDatePicker({super.key});

  @override
  TimeDatePickerState createState() => TimeDatePickerState();
}
class TimeDatePickerState extends State<TimeDatePicker> {

  late Future<DateTime?> selectedDate;
  String date = "-";

  late Future<TimeOfDay?> selectedTime;
  String time = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const Spacer(flex: 10),
          Container(
            child:
            Text("$date : $time"),
          ),

          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: const Text("PICK DATE", style: TextStyle(color: Colors.white)),
              onPressed: (){
                datePicker(context);
              },
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: const Text("PICK TIME", style: TextStyle(color: Colors.white)),
              onPressed: (){
                timePicker(context);
              },
            ),
          )

        ],
      ),
    );
  }



  void datePicker(BuildContext context){
    selectedDate = showDatePicker(
      context: context,
      helpText: 'Your Date of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:  ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((value) {
      setState(() {
        if(value == null) return;
        var Utils;
        date = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void timePicker(BuildContext context){
    selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      setState(() {
        if(value == null) return;
        time = "${value.hour} : ${value.minute}";
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

}