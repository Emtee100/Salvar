import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneSignup extends StatefulWidget {
  const PhoneSignup({super.key});

  @override
  State<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;
  final _formState = GlobalKey<FormState>();

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _phoneNumberController.clear();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
  }

  Country _selectedCountry = Country(
      phoneCode: "254",
      countryCode: "KE",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Kenya",
      example: "712345678",
      displayName: "Kenya",
      fullExampleWithPlusSign: "+254 712 345 678",
      displayNameNoCountryCode: "KE",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
        child: Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Text(
                  "SMS Verification.",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter your phone number and we'll send you a verification code via SMS.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        //   child: TextFormField(
        //       textCapitalization: TextCapitalization.words,
        //       controller: _fullNameController,
        //       decoration: InputDecoration(
        //           labelText: "Full Name",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(15),
        //           )),
        //       validator: (value) {
        //         if (value == null || value.isEmpty) {
        //           return "Enter your full names";
        //         } else {
        //           return null;
        //         }
        //       }),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                  prefixIcon: Container(
                      padding:
                          const EdgeInsets.only(top: 13, left: 8, right: 8),
                      child: InkWell(
                        onTap: () => showCountryPicker(
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: MediaQuery.of(context).size.height/2,
                            inputDecoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              )
                            )
                          ),
                            context: context,
                            showPhoneCode: true,
                            showSearch: true,
                            onSelect: (Country value) {
                              setState(() {
                                _selectedCountry = value;
                              });
                            }),
                        child: Text(
                          "${_selectedCountry.flagEmoji} + ${_selectedCountry.phoneCode}",
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a phone number";
                } else if (_phoneNumberController.text.length > 9) {
                  return "Enter the phone number with the format 712345678";
                } else if (_phoneNumberController.text.length < 9) {
                  return "A phone number should at least have 9 digits";
                } else {
                  return null;
                }
              }),
        ),
        GestureDetector(
          onTap: () {
            if (_formState.currentState!.validate()) {
              context.push("/otp");
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              "Send Verification Code",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
        )
      ],
    ));
  }
}
