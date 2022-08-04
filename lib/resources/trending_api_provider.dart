import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/trendingItems.dart';
import '../models/lyrics.dart';

class trendingAPIProvider {
  Client client = Client();

  Future<trendingItems> fetchMusicList() async {
    print("entered");
    final response = await client.get("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=7b710ad69d86cde90e166c94a1b86efa&page=1&page_size=10&country=in");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return trendingItems.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  Future<lyrics> fetchLyrics(int track_id) async {
    final response =
    await client.get("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$track_id&apikey=7b710ad69d86cde90e166c94a1b86efa");

    if (response.statusCode == 200) {
      return lyrics.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
  Future<lyrics> fetchmusicdetails(int track_id) async {
    final response =
    await client.get("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$track_id&apikey=7b710ad69d86cde90e166c94a1b86efa");

    if (response.statusCode == 200) {
      return lyrics.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}