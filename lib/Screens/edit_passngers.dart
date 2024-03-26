import 'package:book_train_ticket/Screens/passenger_conirm.dart';
import 'package:book_train_ticket/utils/app_info_list.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditPassngers extends StatefulWidget {
  const EditPassngers({super.key});

  @override
  State<EditPassngers> createState() => _EditPassngersState();
}

class _EditPassngersState extends State<EditPassngers> {
  int selectdeIndx = 0;
  final _formKey = GlobalKey<FormState>();
  String SlectedItem = 'not selected';
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingControlleremail = TextEditingController();
  final TextEditingController _textEditingControllerphonenumber = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool isvisible = true;
  final _emailRgex =
      r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+";
  @override
  void initState() {
    super.initState();

    // Set the initial text value
    _textEditingController.text = userList[selectdeIndx]['Firstname'];
    _textEditingController2.text = userList[selectdeIndx]['middlename'];
    _textEditingController3.text = userList[selectdeIndx]['Lastname'];
    _dateController.text=userList[selectdeIndx]['dateOfbirth'];
    _textEditingControlleremail.text=userList[selectdeIndx]['email'];
    _textEditingControllerphonenumber.text=userList[selectdeIndx]['number'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgColor,
      appBar: AppBar(
        title: const Center(child: Text("Passengers Edit")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              itemCount: userList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectdeIndx=index;
                        if(selectdeIndx==0){
                          isvisible=true;
                        }
                        if(selectdeIndx!=0){
                          isvisible=false;
                        }
                        _textEditingController.text = userList[selectdeIndx]['Firstname'];
                        _textEditingController2.text = userList[selectdeIndx]['middlename'];
                        _textEditingController3.text = userList[selectdeIndx]['Lastname'];
                        _dateController.text=userList[selectdeIndx]['dateOfbirth'];

                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectdeIndx == index ? Colors.green : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      userList[index]['Firstname'],
                      style: TextStyle(
                        color:
                            selectdeIndx == index ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
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
                              },
                              onTap: () {
                                _selectDate();
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
                                  width: 150,
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
                                  width: 150,
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
                                keyboardType: TextInputType.emailAddress,
                                controller: _textEditingControlleremail,
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
                                controller: _textEditingControllerphonenumber,
                                keyboardType: TextInputType.phone,
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
                          String fname=_textEditingController.text;
                          String Mname=_textEditingController.text;
                          String Lname=_textEditingController.text;
                          String birthdate=_textEditingController.text;
                          String email=_textEditingController.text;
                          String phone=_textEditingController.text;


                          // Map<String, dynamic> user = {
                          //   'Firstname':fname,
                          //   'middlename': Mname,
                          //   'Lastname': Lname,
                          //   'dateOfbirth':birthdate,
                          //   'email':email,
                          //   'number':phone
                          // };

                          userList[selectdeIndx]['Firstname']=fname;
                          userList[selectdeIndx]['Firstname']=Mname;
                          userList[selectdeIndx]['Firstname']=Lname;
                          userList[selectdeIndx]['Firstname']=birthdate;
                          userList[selectdeIndx]['Firstname']=email;
                          userList[selectdeIndx]['Firstname']=phone;

                          if(selectdeIndx<userList.length){
                            selectdeIndx++;
                            if(selectdeIndx==0){
                              isvisible=true;
                            }
                            if(selectdeIndx!=0){
                              isvisible=false;
                            }
                            setState(() {
                              selectdeIndx=selectdeIndx;
                              _textEditingController.text = userList[selectdeIndx]['Firstname'];
                              _textEditingController2.text = userList[selectdeIndx]['middlename'];
                              _textEditingController3.text = userList[selectdeIndx]['Lastname'];
                              _dateController.text=userList[selectdeIndx]['dateOfbirth'];
                            });
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PassengerConfrim(),
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  void _clearTextField() {
    _textEditingController.clear();
    _textEditingController2.clear();
    _textEditingController3.clear();
    _dateController.clear();
  }
}
