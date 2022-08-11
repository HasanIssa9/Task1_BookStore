import 'dart:io';

class Book {
  String? _name;
  String? _author;
  double? _rate;

  Book([this._name, this._author, this._rate]);

  static List booksList = <Book>[
    Book('java', 'Mohammed ALi', 3.9),
    Book('dart', 'Ali Ihsan', 4.2)
  ];

  static void displayAllBook() {
    List<Book>? listBook = Book.booksList.cast<Book>();
    if (listBook.isEmpty) {
      print("There are no Books!");
    } else {
      print("Book name\t\t\t\tBook author\t\t\t\tRate");
      listBook.forEach((book) {
        print("${book._name}\t\t\t\t${book._author}\t\t\t\t${book._rate}");
      });
    }
  }

  static void displayRatePlusFour() {
    List<Book>? listBook = Book.booksList.cast<Book>();
    if (listBook.isEmpty) {
      print("There are no Books!");
    } else {
      print("Book name\t\t\t\tBook author\t\t\t\tRate");
      listBook.forEach((book) {
        if (book._rate! >= 4) {
          print("${book._name}\t\t\t\t${book._author}\t\t\t\t${book._rate}");
        }
      });
    }
  }

  static void addBook(int? n) {
    List<Book>? listBook = Book.booksList.cast<Book>();
    for (int i = 1; i <= n!; i++) {
      stdout.write('Enter book $i name:');
      String name = stdin.readLineSync()!;
      stdout.write('Enter book $i author:');
      String author = stdin.readLineSync()!;
      stdout.write('Enter book $i rate:');
      double rate = double.parse(stdin.readLineSync()!);
      print('=' * 40);
      listBook.add(Book(name, author, rate));
    }
  }

  static void updateBook(String? nameUpdate) {
    List<Book>? listBook = Book.booksList.cast<Book>();
    listBook.forEach((book) {
      if (nameUpdate == book._name) {
        stdout.write('Enter book name:  ${book._name}\t');
        book._name = stdin.readLineSync()!;
        stdout.write('Enter book author:  ${book._author}\t');
        book._author = stdin.readLineSync()!;
        stdout.write('Enter book rate:  ${book._rate}\t');
        book._rate = double.parse(stdin.readLineSync()!);
      }
    });
  }

  static void deleteBook(String? nameDelete) {
    List<Book>? listBook = Book.booksList.cast();
    listBook.forEach((book) {
      if (nameDelete == book._name) {
        listBook.removeWhere((item) => nameDelete == item._name);
        print('book has been deleted');
      }
    });
  }

  static void searchBook(String? nameSearch) {
    List<Book>? listBook = Book.booksList.cast();
    listBook.forEach((book) {
      if (nameSearch == book._name) {
        print("Book name\t\t\t\tBook author\t\t\t\tRate");
        print("${book._name}\t\t\t\t${book._author}\t\t\t\t${book._rate}");
      }
    });
  }
}

main() {
  while (true) {
    print('\n');
    stdout.write('''Main menu
1- Display all books
2- Display books with rate +4
3- Add book
4- Update book
5- Delete book
6- Search
Write your choice: ''');
    int? choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        Book.displayAllBook();
        break;
      case 2:
        Book.displayRatePlusFour();
        break;
      case 3:
        {
          stdout.write('Enter the count of books want to add:');
          int? n = int.parse(stdin.readLineSync()!);
          Book.addBook(n);
        }
        break;
      case 4:
        {
          stdout.write('Enter the book name:');
          String nameUpdate = stdin.readLineSync()!;
          Book.updateBook(nameUpdate);
        }
        break;
      case 5:
        {
          stdout.write('Enter the book name:');
          String? nameDelete = stdin.readLineSync()!;
          Book.deleteBook(nameDelete);
        }
        break;
      case 6:
        {
          stdout.write('Enter a query:');
          String? search = stdin.readLineSync()!;
          Book.searchBook(search);
        }
        break;
      default:
        print('error!');
    }
  }
}
