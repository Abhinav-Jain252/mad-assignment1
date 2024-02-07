// Abhinav Jain - FSA (Grp-2) - 21CSU224
//07-02-2024
// Q. You are building a user authentication system for a mobile application. Create mixins Authenticator and AuthorizationManager to handle user authentication and authorization functionalities, respectively. Implement these mixins in the User class to authenticate users during login and authorize access to specific resources based on user roles and permissions. You can use different ways to authenticate & authorize a user

mixin AuthMixin {
  bool isAuthenticated = false;

  final Map<String, String> authorizedUsers = {
    'user1': 'password',
    'user2': 'password',
    'admin': 'admin',
  };

  void login(String username, String password) {
    if (authorizedUsers.containsKey(username) &&
        authorizedUsers[username] == password) {
      isAuthenticated = true;
      print('User $username logged in successfully.');
    } else {
      print('Invalid username or password.');
    }
  }

  void logout() {
    isAuthenticated = false;
    print('User logged out.');
  }

  void register(String username, String password) {
    if (authorizedUsers.containsKey(username)) {
      print('Username already exists. Please choose a different one.');
    } else {
      authorizedUsers[username] = password;
      print('User $username registered successfully.');
    }
  }
}

class User with AuthMixin {
  
}

void main() {
  var user = User();
  user.login('user1', 'password');
  print('Is user authenticated? ${user.isAuthenticated}');
  user.logout();
  print('Is user authenticated? ${user.isAuthenticated}');
  user.login('user2', 'falsepassword');
  print('Is user authenticated? ${user.isAuthenticated}');
  user.register('user3', 'password');
  user.login('user3', 'falsepassword');
  user.login('user3', 'password');
}
