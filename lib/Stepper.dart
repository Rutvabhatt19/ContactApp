import 'package:contactapp/Contactmodal.dart';
import 'package:contactapp/Screen1.dart';
import 'package:contactapp/Screen2.dart';
import 'package:contactapp/Splashscreen.dart';
import 'package:contactapp/Stepmodal.dart';
import 'package:contactapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepperW extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StepperWstate();
  }
}
var myname;
TextEditingController firstname=TextEditingController();
TextEditingController lastname=TextEditingController();
TextEditingController number=TextEditingController();
TextEditingController email=TextEditingController();
int corrontstep=0;
class StepperWstate extends State<StepperW>{
  step s=step();
  String MYNAME="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<step>(context,listen: false).savedata();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final stepc=Provider.of<step>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Log in',
        ),
        backgroundColor: Color(0xff68907A),
      ),
      body:Column(
        children:[
          Expanded(
            child: Stepper(
                type: StepperType.horizontal,
                currentStep: corrontstep,
                onStepContinue: () {
                  final isLastStep= corrontstep == steps().length-1;
                  if(isLastStep){
                    print('Completed');
                  }else{
                    stepc.getstep();
                  }
                },
                onStepCancel: () => corrontstep == 0 ? null: stepc.minstep(),
                steps: steps(),
            ),
          ),
          corrontstep==2? ElevatedButton(
                  onPressed: () async{
                    final name = firstname.text;
                    final phoneNumber = number.text;
                    final lastname1=lastname.text;
                    if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                      final newContact = mainContact(name, phoneNumber,lastname1);
                      if (newContact != null) {
                        Provider.of<ContactListProvider>(context, listen: false).addContact(newContact as mainContact);
                      }}
                      var prefs= await SharedPreferences.getInstance();
                      prefs.setBool(Splashscreenstate.KEYLOGIN, true);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactListScreen(),));
                  }, child: Text('Next'))
            :Container(),
        ],
      ),
    );
  }
  List<Step> steps() =>   [
    Step(
      state: corrontstep>0 ?StepState.complete:StepState.indexed,
        isActive: corrontstep>=0,
        title: Text('Name'),
        content: Column(
          children: [
            TextField(
              controller: firstname,
              decoration: InputDecoration(
                labelText: 'First name',
              ),
            ),
            TextField(
              controller: lastname,
              decoration: InputDecoration(
                labelText: 'Last name',
              ),
            ),
          ],
        ),
    ),
    Step(
      state: corrontstep>1 ?StepState.complete:StepState.indexed,
      isActive: corrontstep>=1,
      title: Text('Number'),
      content:  Column(
        children: [
          TextField(
            controller: number,
            decoration: InputDecoration(
              labelText: 'Number',
            ),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'E-mail',
            ),
          ),
        ],
      ),
    ),
    Step(
      state: corrontstep>2 ?StepState.complete:StepState.indexed,
        isActive: corrontstep>=2,
        title: Text('Confirm'),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff68907A),
                    width: 2,
                  )
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Name : ${firstname.text} ${lastname.text}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff68907A),
                      width: 2,
                    )
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('lastname : ${lastname.text} ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff68907A),
                      width: 2,
                    )
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Number : ${number.text} ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff68907A),
                      width: 2,
                    )
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Email : ${email.text} ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),),
                ),
              ),
            ),
          ],
        ),
    ),
  ];
}
