import 'networking.dart';

const String nyTimesAPI = 'https://api.nytimes.com/svc';
const String apiKey = '6EJ2HuuDcMjTWefhJDheMuZpyWwnOadL';

/// Get Most Popular Stories of This Day
Future<Map> getTopStoriesofDay() async {
  String url = '$nyTimesAPI/mostpopular/v2/viewed/1.json?api-key=$apiKey';

  return await NetworkHelper(url).getData();
}
