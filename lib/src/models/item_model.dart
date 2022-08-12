import 'dart:developer' as dev;

class ItemModel {
  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    dev.log('ItemModel.fromJson(); length: ${parsedJson['results']}', name: 'MODEL');
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (var result in parsedJson['results']) {
      temp.add(result);
    }
    _results = temp;
  }

  late int _page;
  late int _totalResults;
  late int _totalPages;
  late List<_Result> _results = [];

  List<_Result> get results => _results;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  int get page => _page;
}

class _Result {
  _Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (var genreID in result['genre_ids']) {
      _genreIDs.add(genreID);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  late int _voteCount;
  late int _id;
  late bool _video;
  late double _voteAverage;
  late String _title;
  late double _popularity;
  late String _posterPath;
  late String _originalLanguage;
  late String _originalTitle;
  late final List<int> _genreIDs = [];
  late String _backdropPath;
  late bool _adult;
  late String _overview;
  late String _releaseDate;

  int get voteCount => _voteCount;
  int get id => _id;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  String get title => _title;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  List<int> get genreIDs => _genreIDs;
  String get backdropPath => _backdropPath;
  bool get adult => _adult;
  String get overview => _overview;
  String get releaseDate => _releaseDate;
}