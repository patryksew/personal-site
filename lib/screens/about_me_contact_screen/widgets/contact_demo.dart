// import 'package:flutter/material.dart';

// class ContactForm extends StatefulWidget {
//   @override
//   _ContactFormState createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _name;
//   String _email;
//   String _phone;
//   String _message;
//   String _contactType = 'email';

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Imię'),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Podaj swoje imię';
//               }
//               return null;
//             },
//             onSaved: (value) => _name = value,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Adres e-mail'),
//             validator: (value) {
//               if (value.isEmpty || !value.contains('@')) {
//                 return 'Podaj prawidłowy adres e-mail';
//               }
//               return null;
//             },
//             onSaved: (value) => _email = value,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Nr telefonu'),
//             validator: (value) {
//               if (value.isEmpty || value.length != 9) {
//                 return 'Podaj prawidłowy nr telefonu';
//               }
//               return null;
//             },
//             onSaved: (value) => _phone = value,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Wiadomość'),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Podaj treść wiadomości';
//               }
//               return null;
//             },
//             onSaved: (value) => _message = value,
//           ),
//           RadioListTile(
//             title: Text('Kontakt przez e-mail'),
//             value: 'email',
//             groupValue: _contactType,
//             onChanged: (value) {
//               setState(() {
//                 _contactType = value;
//               });
//             },
//           ),
//           RadioListTile(
//             title: Text('Kontakt przez telefon'),
//             value: 'phone',
//             groupValue: _contactType,
//             onChanged: (value) {
//               setState(() {
//                 _contactType = value;
//               });
//             },
//           ),
//           RaisedButton(
//             onPressed: _submit,
//             child: Text('Wyślij'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _submit() {
//     if (_formKey.currentState.validate())
