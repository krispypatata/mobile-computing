void main() {
  // instantiating a User object
  User userOne = new User('Keith', 22);
  print(userOne.username);
  userOne.login();

  print('');

  User usertwo = new User('Luigi', 25);
  print(usertwo.username);
  usertwo.login();

  print('');

  SuperUser userthree = new SuperUser('shio', 22);
  print(userthree.username);
  userthree.login();
  userthree.publish();
}

class User {
  // fields/attributes
  String username = 'mario';
  int age = 21;

  // constructor
  User(String name, int age) {
    this.username = name;
    this.age = age;
  }

  void login() {
    print('user logged in');
  }
}

class SuperUser extends User {
  // constructor
  SuperUser(String username, int age) : super(username, age) {}

  void publish() {
    print('Published update!');
  }
}
