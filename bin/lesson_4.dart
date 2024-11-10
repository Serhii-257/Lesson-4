import 'package:equatable/equatable.dart';

void main() {
  taskOne();
  taskTwo();
  taskThree();
  taskFour();
  taskFive();
  taskFive2();
}

taskOne() {
  Book book1 =
      Book('Шерлок Холмс Собака Баскервілів', 'Артур Конан Дойл', 1902);
  Book book2 = Book('Подорож до центру Землі', 'Жюль Верн', 1864);
  Book book3 = Book('Острів скарбів', 'Роберта Льюїса Стівенсона', 1883);

  print('');
  book1.displayInfo();
  print('');
  book2.displayInfo();
  print('');
  book3.displayInfo();
  print('');
}

class Book {
  String name;
  String author;
  int publicationYear;

  Book(this.name, this.author, this.publicationYear);

  void displayInfo() {
    print('Назва книги: $name');
    print('Автор: $author');
    print('Рік публікації: $publicationYear');
  }
}

///task 2
///
///
void taskTwo() {
  print('--------------');
  Animals dog = Animals('Dog', 3);
  Animals cat = Animals.newborn('Cat');

  print('${dog.name} is adult: ${dog.isAdult()}');
  print('${cat.name} is adult: ${cat.isAdult()}');
}

class Animals {
  String name;
  int age;

  Animals(this.name, this.age);

  Animals.newborn(this.name) : age = 0;

  bool isAdult() {
    return age > 2;
  }
}

//// task 3
///
///
void taskThree() {
  print('--------------');
  var fish = Fish();
  fish.swim();

  var duck = Duck();
  duck.swim();
}

mixin Swimming {
  void swim() {
    print('I can swim!');
  }
}

class Fish with Swimming {}

class Duck with Swimming {}

///Task 4
///
///
///
abstract class Playable {
  void play();
}

class Soccer implements Playable {
  @override
  void play() {
    print('We play soccer');
  }
}

class Basketball implements Playable {
  @override
  void play() {
    print('We play basketball');
  }
}

class SportsClub {
  final List<Playable> sports;

  SportsClub(this.sports);

  void playAllSports() => sports.forEach((sport) => sport.play());
}

void taskFour() {
  print('------------');
  var sportsClub = SportsClub([Soccer(), Basketball()]);
  sportsClub.playAllSports();
}

/// Task 5
///
///
///

class Coordinate {
  final double latitude;
  final double longitude;

  const Coordinate(this.latitude, this.longitude);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Coordinate) return false;
    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() {
    return 'Coordinate(latitude: $latitude,longitude: $longitude)';
  }
}

void taskFive() {
  print('--------------');
  final coordinate = Coordinate(43.0, 77.9);
  print(coordinate);
}

/// Task 5 part 2
///
///

class Coordinate2 extends Equatable {
  final double latitude;
  final double longitude;

  const Coordinate2(this.latitude, this.longitude);

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() =>
      'Coordinate2 (latitude: $latitude, longitude : $longitude)';
}

void taskFive2() {
  final coordinate = Coordinate2(43.0, 77.9);
  print(coordinate);
}
