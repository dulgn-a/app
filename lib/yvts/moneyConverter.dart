import 'package:flutter/material.dart';

class MoneyConversionScreen extends StatefulWidget {
  final String flag;
  final String countryName;

  MoneyConversionScreen({required this.flag, required this.countryName});

  @override
  _MoneyConversionScreenState createState() => _MoneyConversionScreenState();
}

class _MoneyConversionScreenState extends State<MoneyConversionScreen> {
  double convertedAmount = 0;
  double conversionRate = 0;
  String selectedCountry = '';

  final Map<String, double> conversionRates = {
    'Евро': 3640.00,
    'Английн фунт': 4188.00,
    'Оросын рубль': 32.40,
    'Хятадын юань': 470.50,
    'БНСУ-ын вон': 2.45,
    'Австрали доллар': 2144.00,
    'Швейцарь франк': 3807.00,
    'Канад доллар': 2489.00,
    'Сингапур доллар': 2493.00,
    'Швед крон': 298.00,
    'Туркийн Лир': 117.00,
    'Гонконг доллар': 438.00,
  };

  final Map<String, String> currencySymbols = {
    'Евро': 'EUR',
    'Английн фунт': 'GBP',
    'Оросын рубль': 'RUB',
    'Хятадын юань': 'CNY',
    'БНСУ-ын вон': 'KRW',
    'Австрали доллар': 'AUD',
    'Швейцарь франк': 'CHF',
    'Канад доллар': 'CAD',
    'Сингапур доллар': 'SGD',
    'Швед крон': 'SEK',
    'Туркийн Лир': 'TRY',
    'Гонконг доллар': 'HKD',
  };

  final Map<String, String> flagImages = {
    'Евро': 'euro.png',
    'Английн фунт': 'eng.png',
    'Оросын рубль': 'russia.png',
    'Хятадын юань': 'china.png',
    'БНСУ-ын вон': 'korea.png',
    'Австрали доллар': 'australia.png',
    'Швейцарь франк': 'switzerland.png',
    'Канад доллар': 'canada.png',
    'Сингапур доллар': 'singa.png',
    'Швед крон': 'swed.png',
    'Туркийн Лир': 'turkey.png',
    'Гонконг доллар': 'hongkong.png',
  };

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.countryName;
    updateConversionRate(selectedCountry);
  }

  void updateConversionRate(String country) {
    setState(() {
      selectedCountry = country;
      conversionRate = conversionRates[country] ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/flags/${flagImages[selectedCountry]}',
                width: 200,
                height: 200,
              ),
              DropdownButton<String>(
                value: selectedCountry,
                items: conversionRates.keys.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(currencySymbols[country] ?? ''),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    updateConversionRate(newValue);
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: ''),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        double amount = double.parse(value);
                        setState(() {
                          convertedAmount = amount * conversionRate;
                        });
                      } else {
                        setState(() {
                          convertedAmount = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '$convertedAmount ₮',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              Image.asset(
                'assets/flags/mongolia.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
