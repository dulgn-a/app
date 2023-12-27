import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({Key? key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData({String? query}) async {
    final apiKey = '703703d48e55706989ec7dc021ee0ce8';
    final appId = 'a7fedbc2';
    query = 'meal';

    final Uri url = Uri.parse(
        'https://api.edamam.com/api/food-database/v2/parser?app_id=$appId&app_key=$apiKey&ingr=$query');

    final response = await http.get(url);
    print('=====================${response.statusCode} ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final foods = data['hints'];

      print('Response Data: $foods');

      return foods;
    } else {
      print('Error: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> foodList = fetchData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Foods'),
      ),
      body: FutureBuilder(
          future: foodList,
          builder: (context, snapshot) {
            print('=========================!!!!!!!!!${snapshot.data}');
            print('=========================!!!1${snapshot.error}');

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Уншиж байна. Түр хүлээнэ үү");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final food = snapshot.data?[index]['food'];
                  return ListTile(
                      title: Text(food['label']),
                      subtitle:
                          Text('Calories: ${food['nutrients']['ENERC_KCAL']}'),
                      leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(food['image'] ?? "")),
                      ));
                },
              );
            } else {
              return Text("Дата байхгүй байна");
            }
          }),
    );
  }
}
