import 'package:atlas/constants/constants.dart';
import 'package:atlas/model/technician_type.dart';
import 'package:atlas/pages/home.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _verificationCodeController = TextEditingController();
  GlobalKey<FormState> _phoneNumberForm = GlobalKey();
  GlobalKey<FormState> _verificationCodeForm = GlobalKey();
  Country _selectedDialogCountry;
  bool _enableSendCode = false;
  GlobalKey key = GlobalKey();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _message = '';

  String _verificationId;


  @override
  void initState() {
    _selectedDialogCountry = _countryByISO('TZ');

    super.initState();
  }

  Country _countryByISO(String iso) {
    Country _country;
    countryList.forEach((Country country) {
      if (country.isoCode == iso) {
        _country = country;
        return;
      }
    });

    return _country ?? countryList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atlas'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _phoneNumberForm,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 27, right: 4),
                            child: InkWell(
                                onTap: () => _openCountryPickerDialog(),
                                child:
                                _buildDropdownItem(_selectedDialogCountry)),
                          ),
                          Expanded(
                            child: TextFormField(
                              // focusNode: myFocusNodeFirstName,
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              validator: (String value) {
                                if (value.isEmpty)
                                  return 'Please enter phone number';

                                if (!RegExp(
                                    r'\+?([0-9]{2})-?([0-9]{3})-?([0-9]{6,7})')
                                    .hasMatch(
                                    '+${_selectedDialogCountry
                                        .phoneCode}$value'))
                                  return 'Invalid phone Number';
                                return null;
                              },
                              onFieldSubmitted: (v) {
                                // FocusScope.of(context).requestFocus(myFocusNodeMiddleName);
                                if (_phoneNumberForm.currentState.validate())
                                  setState(() {
                                    _enableSendCode = true;
                                  });
                              },
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    _enableSendCode = false;
                                  });
                                }
                                else {
                                  if (_phoneNumberForm.currentState
                                      .validate()) {
                                    setState(() {
                                      _enableSendCode = true;
                                    });
                                  }
                                }
                              },
                              style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 18.0,
//                            color: Colors.white
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " Phone Number *",
                                labelText: 'Phone:',
                                labelStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
//                              color: Colors.white // #1b5e20
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
//                              color: Colors.white
                                ),
                                prefix: Text(
                                  "+${_selectedDialogCountry.phoneCode}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
//                          prefixText: "+${_selectedDialogCountry.phoneCode}"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                        child: Text('Send Code'),
                        onPressed: !_enableSendCode ||
                            _phoneNumberController.text.isEmpty ?
                        null : () {
                          if (_verificationCodeForm.currentState.validate())
                            print("XXXXXXXXX: Sending Code...");
                          _verifyPhoneNumber();
                        }

                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Form(
                key: _verificationCodeForm,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    // focusNode: myFocusNodeFirstName,
                    controller: _verificationCodeController,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (v) {
                      // FocusScope.of(context).requestFocus(myFocusNodeMiddleName);
                    },
                    style: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.check,
                        // FontAwesomeIcons.user,
//                      color: Colors.white //Theme.Colors.cheffsPointPrimaryColor,
                      ),
                      hintText: "Code",
                      labelText: 'Verification Code: *',
                      labelStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 16.0,
//                      color: Colors.white // #1b5e20
                      ),
                      hintStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 16.0,
//                      color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('VERIFY'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>
                        HomePage(key: key,title: 'Map',),),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) =>
      Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
//        Text("(+${country.phoneCode})",style: TextStyle(fontSize: 16),),
          ],
        ),
      );

  void _openCountryPickerDialog() =>
      showDialog(
        context: context,
        builder: (context) =>
            Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                child: CountryPickerDialog(
                    titlePadding: EdgeInsets.all(8.0),
                    searchCursorColor: Colors.pinkAccent,
                    searchInputDecoration: InputDecoration(
                        hintText: 'Search...'),
                    isSearchable: true,
                    title: Text('Select your phone code'),
                    onValuePicked: (Country country) =>
                        setState(() => _selectedDialogCountry = country),
                    itemBuilder: _buildDialogItem)),
      );

  Widget _buildDialogItem(Country country) {
    return ListTile(
      leading: CountryPickerUtils.getDefaultFlagImage(country),
      subtitle: Text(country.name),
      title: Text('+${country.phoneCode}'),
    );
  }

  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
        'Phone number verification failed. Code: ${authException
            .code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Verification code sent to +${_selectedDialogCountry
            .phoneCode}${_phoneNumberController.text}'),
      ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    print('THE Phone number  is: +${_selectedDialogCountry
        .phoneCode}${_phoneNumberController.text}');
    await _auth.verifyPhoneNumber(
        phoneNumber: "+255714085613",
        //'+${_selectedDialogCountry.phoneCode}${_phoneNumberController.text}' ,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
