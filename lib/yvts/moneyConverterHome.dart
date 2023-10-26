import 'package:flutter/material.dart';
import './moneyConverter.dart';

class MoneyConverterHome extends StatelessWidget {
  MoneyConverterHome({Key? key}) : super(key: key);

  final List<Country> countries = [
    Country(name: 'Евро', flag: 'euro.png', currency: 'EUR'),
    Country(name: 'Английн фунт', flag: 'eng.png', currency: 'GBP'),
    Country(name: 'Оросын рубль', flag: 'russia.png', currency: 'RUB'),
    Country(name: 'Хятадын юань', flag: 'china.png', currency: 'CNY'),
    Country(name: 'БНСУ-ын вон', flag: 'korea.png', currency: 'KRW'),
    Country(name: 'Австрали доллар', flag: 'australia.png', currency: 'AUD'),
    Country(name: 'Швейцарь франк', flag: 'switzerland.png', currency: 'CHF'),
    Country(name: 'Канад доллар', flag: 'canada.png', currency: 'CAD'),
    Country(name: 'Сингапур доллар', flag: 'singa.png', currency: 'SGD'),
    Country(name: 'Швед крон', flag: 'swed.png', currency: 'SEK'),
    Country(name: 'Туркийн Лир', flag: 'turkey.png', currency: 'TRY'),
    Country(name: 'Гонконг доллар', flag: 'hongkong.png', currency: 'HKD'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'МОНГОЛ БАНКНЫ ВАЛЮТЫН ХАНШ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/flags/${countries[index].flag}',
                      width: 48,
                      height: 48,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(countries[index].name),
                        Text('${countries[index].currency}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MoneyConversionScreen(
                            flag: countries[index].flag,
                            countryName: countries[index].name,
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Country {
  final String name;
  final String flag;
  final String currency;

  Country({required this.name, required this.flag, required this.currency});
}
