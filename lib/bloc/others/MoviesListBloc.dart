

class MoviesListBloc {
 /* final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
  BehaviorSubject<MovieResponse>();*/

  getMovies() async {
   /* MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);*/
   print("get movie");
  }

 /* dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;*/

}
final moviesBloc = MoviesListBloc();