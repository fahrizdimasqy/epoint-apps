part of 'models.dart';

class FoulCateogry extends Equatable {
  final String id;
  final String name;

  FoulCateogry({
    this.id,
    this.name,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        name,
      ];
}
