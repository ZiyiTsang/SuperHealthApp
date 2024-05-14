import 'package:faker_dart/faker_dart.dart';

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String address;
  String imagePath;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.imagePath,
  });
  static Map<int, Contact> contactDatabase={};
  static Map<int, Contact> getContactDatabase(){
    if(contactDatabase.isEmpty){
      contactDatabase=getAllContactsAsMap();
    }
    return contactDatabase;
  }

  static Map<int, Contact> getAllContactsAsMap() {

    final faker = Faker.instance;
    Map<int, Contact> contactsMap = {};

    for (int i = 1; i <= 10; i++) {
      final contact = Contact(
        id: i,
        name: faker.name.fullName(),
        email: faker.internet.email(),
        phone: '123456',
        address: faker.address.county()+faker.address.cityName()+faker.address.secondaryAddress(),
        imagePath: "assets/images/ProfileImage/$i.jpg",
      );

      contactsMap[contact.id] = contact;
    }
    return contactsMap;
  }
  static List<Contact> get_all_contact() {
    final faker = Faker.instance;
    List<Contact> contacts = [];

    for (int i = 1; i <= 10; i++) {
      final contact = Contact(
        id: i,
        name: faker.name.fullName(),
        email: faker.internet.email(),
        phone: faker.phoneNumber.phoneNumber(),
        address: faker.address.county()+faker.address.cityName()+faker.address.secondaryAddress(),
        imagePath: "assets/images/ProfileImage/$i.jpg",
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
