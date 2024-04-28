class Contact {
  String name;
  String email;
  String phone;
  String address;
  String image_path;

  Contact({required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image_path,});

  static List<Contact> get_all_contact() {
    return <Contact>[
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-1.jpg"),
      //make 10 random contact
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-2.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-3.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-4.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-5.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-1.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-1.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-1.jpg"),
      Contact(
          name: 'John Doe',
          email: '6666666666@slsls.cn',
          phone: '6666666666',
          address: '6666666666',
          image_path:"assets/images/people-1.jpg"),
    ];
  }
}
