import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/DB/CardDatabaseHelper.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/widgets/custom_container.dart';
import 'package:fyp_project_group_a/presentation/widgets/profile_button.dart';
import 'package:fyp_project_group_a/presentation/widgets/profile_setting_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  String selectedCardType = 'Choose card';
  String cardNumber = '';
  String expiryMonth = '2';
  String expiryYear = '2022';
  String cvc = '233';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBar(title: 'Add New Card'),
              const SizedBox(
                height: 20,
              ),
              ProfileSettingWidget(
                labelText: 'Choose card',
                text: 'Choose card',
                postfixIcon: Image.asset('assets/images/Down.png'),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    selectedCardType = value;
                  });
                },
              ),
              ProfileSettingWidget(
                labelText: 'Card Number',
                text: cardNumber,
                postfixIcon: Image.asset('assets/images/Down.png'),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    cardNumber = value;
                  });
                },
              ),
              CustomContainerWithFields(
                labelText: 'Expiry Date',
                firstFieldText: expiryMonth,
                secondFieldText: expiryYear,
                onChanged: (month, year) {
                  // Handle changes in expiry date
                  setState(
                    () {
                      expiryMonth = month;
                      expiryYear = year;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileSettingWidget(
                labelText: 'CVC',
                text: cvc,
                postfixIcon: Image.asset('assets/images/Down.png'),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    cvc = value;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ProfileButton(
                text: 'Save Card',
                mainContainerColor: primaryColorOrange,
                textColor: secondaryColor,
                onSave: () {
                  _saveCardInformation();
                  printAllCards();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveCardInformation() {
    // Save card information to the local database using CardDatabaseHelper
    Map<String, dynamic> cardData = {
      CardDatabaseHelper.columnCardType: selectedCardType,
      CardDatabaseHelper.columnCardNumber: cardNumber,
      CardDatabaseHelper.columnExpiryDate: '$expiryMonth/$expiryYear',
      CardDatabaseHelper.columnCVC: cvc,
    };

    CardDatabaseHelper.instance.insert(cardData);
    // Log the data to the console

    // You can also show a success message or navigate to another screen after saving.
  }

  void printAllCards() async {
    List<Map<String, dynamic>> cards = await CardDatabaseHelper.instance.queryAll();

    for (var card in cards) {
      print('Card Type: ${card[CardDatabaseHelper.columnCardType]}');
      print('Card Number: ${card[CardDatabaseHelper.columnCardNumber]}');
      print('Expiry Date: ${card[CardDatabaseHelper.columnExpiryDate]}');
      print('CVC: ${card[CardDatabaseHelper.columnCVC]}');
      print('-----------------------------');
    }
  }

// Call this function whenever you want to print all saved cards
}
