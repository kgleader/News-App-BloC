part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsByCountryCodeEvent extends NewsEvent {
  const NewsByCountryCodeEvent([this.countryCode = 'us']);
  final String countryCode;
}
