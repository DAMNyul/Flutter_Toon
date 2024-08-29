import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/webtoon_model.dart';
import 'package:flutter_application_1/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiServices.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, futureResult) {
          if (futureResult.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: futureResult.data!.length,
              itemBuilder: (context, index) {
                var webtoon = futureResult.data![index];
                return Text(webtoon.title);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
