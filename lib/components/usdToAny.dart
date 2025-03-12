// ignore: file_names
import 'package:currency_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const UsdToAny({super.key, @required this.rates, required this.currencies});

  @override
  _UsdToAnyState createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
          // width: w / 3,
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'USD to Any Currency',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),

                //TextFields for Entering USD
                TextFormField(
                  key: ValueKey('usd'),
                  controller: usdController,
                  decoration: InputDecoration(hintText: 'Enter USD'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    //Future Builder for getting all currencies for dropdown list
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    //Convert Button
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            answer =
                                '${usdController.text} USD = ${convertusd(widget.rates, usdController.text, dropdownValue)} $dropdownValue';
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).primaryColor)),
                        child: Text('Convert'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                //Final Output
                SizedBox(height: 10),
                Text(answer)
              ])),
    );
  }
}
