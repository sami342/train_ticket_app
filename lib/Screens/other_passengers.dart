import 'package:book_train_ticket/Screens/passenger_conirm.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtherPassengers extends StatefulWidget {
  final int? numberofchild;
  final int? numberofadult;
  final String departureplace;
  final String arrivalplace;
  final DateTime dateTime;
  final String price;
  final String cargoType;
  const OtherPassengers({super.key,
    required this.numberofadult,
    required this.numberofchild,
    required this.departureplace,
    required this.arrivalplace,
    required this.dateTime,
    required this.price,
    required this.cargoType
  });

  @override
  State<OtherPassengers> createState() => _OtherPassengersState();
}
int calculateAge(String birthDate) {
  DateTime today = DateTime.now();
  List<String> birthDateParts = birthDate.split('-');
  int birthYear = int.parse(birthDateParts[0]);
  int birthMonth = int.parse(birthDateParts[1]);
  int birthDay = int.parse(birthDateParts[2]);

  int age = today.year - birthYear;

  // Check if the birthday hasn't occurred yet this year
  if (birthMonth > today.month ||
      (birthMonth == today.month && birthDay > today.day)) {
    age--;
  }

  return age;
}
class _OtherPassengersState extends State<OtherPassengers> {
  int adult=0;
  late int intValue;
  late int totalPrice;
  late int totalPassenger;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = calculateTotalPrice(
      int.parse(widget.price),
      widget.numberofadult!,
      widget.numberofchild!,
      widget.cargoType,
    );


  }

  int calculateTotalPrice(int price,int numberOfAdults,int numberOfChildren, String cargoType,) {
    int totalPrice = 0;
    // Calculate total price for adults
    totalPrice += numberOfAdults * price;
    // Calculate total price for children
    if(price>=450) {
      totalPrice += (numberOfChildren * (price - 100));
    }
    else if(price<450){
      totalPrice += (numberOfChildren * price);
    }
    // Adjust total price based on cargo type
    if (cargoType == 'VIP') {
      totalPrice = totalPrice * 2 ;
    }
    return totalPrice;
  }

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _emailtextfieldcontroller=TextEditingController();
  final TextEditingController _phonetextfieldcontroller=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int selectdeIndx = 0;
  int selectdeIndxAdult = -1;
  String SlectedItem = 'not selected';
  bool isvisible = true;

  final _emailRgex =
      r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+";

  List<Map<String, dynamic>> userList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Passenger details"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              itemCount: widget.numberofadult,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color:
                          selectdeIndx == index ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("Adult ${index+1}")),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 55,
            child: ListView.builder(
              itemCount: widget.numberofchild,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: selectdeIndxAdult == index
                          ? Colors.green
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("child ${index+1}")),
                  ),
                );
              },
            ),
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.0,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _textEditingController,
                              decoration: const InputDecoration(
                                labelText: "First name*",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey,
                              ),
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 2) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return "First name required";
                                } else {
                                  return "First name to short";
                                }
                              },
                              cursorColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _textEditingController2,
                              decoration: const InputDecoration(
                                labelText: "Middle name",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (value) {
                                if (value!.length < 3) {
                                  return "Middle name to short";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _textEditingController3,
                              decoration: const InputDecoration(
                                  labelText: "Last name*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 2) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return "Last name required";
                                } else {
                                  return "Last name to short";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: _dateController,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_month),
                                  labelText: "Date Of Birth*",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 2) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return "Date of birth required";
                                }
                                return null;
                              },
                              onTap: () {
                             if(adult<widget.numberofadult!){
                               _selectDate();
                             }
                             else{
                               _selectDatechild();
                              }
                              },
                            ),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Text(
                                  "Gender*",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth*0.3,
                                  child: RadioMenuButton(
                                    value: 'male',
                                    groupValue: SlectedItem,
                                    onChanged: (SlectedvalueItem) {
                                      setState(() {
                                        SlectedItem = SlectedvalueItem!;
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      elevation:
                                          const MaterialStatePropertyAll(2),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.white24),
                                    ),
                                    child: const Text("Male"),
                                  ),
                                ),
                                const Gap(20),
                                SizedBox(
                                    width: screenWidth*0.3,
                                  child: RadioMenuButton(
                                    value: 'female',
                                    groupValue: SlectedItem,
                                    onChanged: (SlectedvalueItem) {
                                      setState(() {
                                        SlectedItem = SlectedvalueItem!;
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      elevation:
                                          const MaterialStatePropertyAll(5),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.white),
                                    ),
                                    child: const Text("Female"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isvisible,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Contacts",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _emailtextfieldcontroller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: "Email*",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is required";
                                  }
                                  if (!RegExp(_emailRgex).hasMatch(value)) {
                                    return "please enter correct email address";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _phonetextfieldcontroller,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                    labelText: "Phone number*",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone Number is required";
                                  }
                                  if (value.length != 10) {
                                    return "Phone number must be 10 digit";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        } else {
                          adult++;
                          String firstname = _textEditingController.text;
                          String middlename = _textEditingController2.text;
                          String Lastname = _textEditingController3.text;
                          String datetime=_dateController.text.toString().split(" ")[0];
                          int age=calculateAge(datetime);
                          String email=_emailtextfieldcontroller.text;
                          String phoneNumber=_phonetextfieldcontroller.text;
                          String cargo='';
                          int seat=0;
                          String selectedGender=SlectedItem;

                          Map<String, dynamic> user = {
                            'Firstname': firstname,
                            'middlename': middlename,
                            'Lastname': Lastname,
                            'Datetime':datetime,
                            'Age':age,
                            'Email': email,
                            'phone':phoneNumber,
                            'Gender':selectedGender,
                            'TransactionReference':'',
                            'cargo':cargo,
                            'Seat':seat,
                          };
                          setState(() {
                            userList.add(user);
                          });
                          _clearTextField();
                          selectdeIndx++;
                          if (selectdeIndx >= widget.numberofadult!) {
                            selectdeIndxAdult++;
                          }
                          setState(() {
                            selectdeIndx = selectdeIndx;
                            selectdeIndxAdult = selectdeIndxAdult;
                            isvisible = false;
                          });
                          if (selectdeIndxAdult >= widget.numberofchild!) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                     PassengerConfrim(user: userList, arrivalplace:widget.arrivalplace, departureplace: widget.departureplace, dateTime:widget.dateTime, price:totalPrice,travelClass:widget.cargoType, Cargo: '', seat: const[],),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clearTextField() {
    _textEditingController.clear();
    _textEditingController2.clear();
    _textEditingController3.clear();
    _emailtextfieldcontroller.clear();
    _phonetextfieldcontroller.clear();
    _dateController.clear();
  }

  Future<void> _selectDate() async {

    DateTime today = DateTime.now();
    DateTime initialDate = DateTime(today.year - 18, today.month, today.day);
    DateTime firstDate = DateTime(1900); // or any other minimum year you'd like to allow
    DateTime lastDate = initialDate;

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectDatechild() async {

    DateTime today = DateTime.now();
    DateTime initialDate = DateTime(today.year - 12, today.month, today.day);
    DateTime firstDate = DateTime(today.year - 12, today.month, today.day);
    DateTime lastDate = DateTime(today.year, today.month, today.day);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

}
