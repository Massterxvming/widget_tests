

// abstract class ObjectDataInterface {
//   Store singleStore;
//
//   String dbName;
//
//   Future<void> loadData()async{
//
//   }
//
// }
import 'package:path/path.dart' as p;
import 'package:objectbox/objectbox.dart';
import 'package:widget_test/model/user.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';


class ObjectData {
  ObjectData._();
  static final ObjectData instance = ObjectData._();

  late Box<User> userBox;
  User currentUser = User(name: 'name', email: 'email', password: 'password');
  Future<void> init () async {
    // Store _singleStore = await openStore(
    //   directory: p.join((await getApplicationDocumentsDirectory()).path,
    //       "obx-demo-relations"),
    // );
    // userBox = Box<User>(_singleStore);
  }

  void setOtherAccount() {
    User otherUser = User(id:6,name: 'other', email: 'other@other.com', password: 'otherpassword');
    // User otherUser = userBox.getAll().firstWhere(test);
    otherUser.accounts.add(Account(name: 'tintin', email: 'bei', password: 'cao'));
    userBox.put(otherUser);
    // currentUser.accounts.applyToDb(mode: PutMode.put);
  }

  void setCurrentAccountBob() {
    currentUser.accounts.add(Account(name: 'bob', email: 'bob@bob.com', password: ''));
    userBox.put(currentUser);
  }

  void setCurrentAccountFriends() {
    currentUser.accounts.addAll([
      Account(name: 'george', email: 'george@george.com', password: ''),
      Account(name: 'alice', email: 'alice@alice.com', password: ''),
    ]);
    userBox.put(currentUser);
  }

  String getCurrentAccount() {
    List<Account> accounts = [];
    if(userBox.getAll().isNotEmpty){
      for(User user in userBox.getAll()){
        accounts.addAll(user.accounts);
      }
    }
    for(Account account in accounts){
      print("account为：${account.toString()}");
    }
    return accounts.toString();
    print("当前account为：${currentUser.accounts.toList()}");
  }

  String getSingleUserAccount() {
    List<Account> accounts = userBox.getAll().last.accounts.toList()??[];
    // if(userBox.getAll().isNotEmpty){
    //   for(User user in userBox.getAll()){
    //     accounts.addAll(user.accounts);
    //   }
    // }
    return accounts.toString();
  }

  void clearall() {
    userBox.removeAll();
  }
}