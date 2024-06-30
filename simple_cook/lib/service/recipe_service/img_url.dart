import 'dart:convert';

Url urlFromJson(String str) => Url.fromJson(json.decode(str));

String urlToJson(Url data) => json.encode(data.toJson());

class Url {
    String url;

    Url({
        required this.url,
    });

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}