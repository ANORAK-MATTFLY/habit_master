import 'dart:io';
import 'dart:convert';

enum PersonUrl {
  persons1,
  persons2,
}

// ignore: camel_case_extensions
extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'https://randomuser.me/api/';
      case PersonUrl.persons2:
        return 'https://randomuser.me/api/';
    }
  }
}

Future<Map<String, dynamic>> getCompetitors(String url) async {
  final req = await HttpClient().getUrl(Uri.parse(url));

  final response = await req.close();
  final str = await response.transform(utf8.decoder).join();
  final Map<String, dynamic> list = await json.decode(str);
  // final Map<String, dynamic> competitors = list["results"];

  return list;
}
