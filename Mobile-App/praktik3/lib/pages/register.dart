// // import 'dart:convert';
// // import 'dart:html';
// // import 'dart:ui';

// // import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:http/http.dart' as http;

// // class DaftarPage extends StatefulWidget {
// //   const DaftarPage({super.key});

// //   @override
// //   State<DaftarPage> createState() => _DaftarPageState();
// // }

// // class _DaftarPageState extends State<DaftarPage> {
// //   TextEditingController namaLengkapCtlr = TextEditingController();
// //   TextEditingController alamatCtlr = TextEditingController();
// //   TextEditingController waCtlr = TextEditingController();
// //   TextEditingController emailCtlr = TextEditingController();
// //   TextEditingController sandiCtlr = TextEditingController();

// //   bool proses = false;
// //   // @override
// //   // void initState() {
// //   //   // TODO: implement initState
// //   //   super.initState();
// //   // }

// //   // daftarUser() async {
// //   //   setState(() {
// //   //     proses = true;
// //   //   });

// //   //   var regAPIUrl = Uri.parse("http://192.168.43.185/uas_PAB/register.php");

// //   //   var maped = {
// //   //     "nama": namaLengkapCtlr.text,
// //   //     "alamat": alamatCtlr.text,
// //   //     "no_wa": waCtlr.text,
// //   //     "email": emailCtlr.text,
// //   //     "sandi": sandiCtlr.text
// //   //   };

// //   //   var res = await http.post(regAPIUrl, body: maped);

// //   //   if (jsonDecode(res.body) >= 1) {
// //   //     Fluttertoast.showToast(
// //   //         msg: "akun sudah ada, silahkan masuk",
// //   //         toastLength: Toast.LENGTH_SHORT);
// //   //   } else {
// //   //     if (jsonDecode(res.body) == true) {
// //   //       Fluttertoast.showToast(
// //   //           msg: "akun berhasil dibuat", toastLength: Toast.LENGTH_SHORT);
// //   //     } else {
// //   //       Fluttertoast.showToast(
// //   //           msg: "akun gagal dibuat", toastLength: Toast.LENGTH_SHORT);
// //   //     }
// //   //   }
// //   //   setState(() {
// //   //     proses = true;
// //   //   });
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     var ukuran = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage('/images/bgLogin.jpg'),
// //             fit: BoxFit.fill,
// //             repeat: ImageRepeat.repeat,
// //           ),
// //         ),
// //         child: Stack(
// //           children: [
// //             Center(
// //               child: Container(
// //                 width: 380,
// //                 alignment: Alignment.center,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Container(
// //                       height: 40,
// //                       padding: const EdgeInsets.only(top: 12),
// //                       margin: const EdgeInsets.only(left: 20, right: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(18),
// //                         color: Colors.white,
// //                       ),
// //                       child: TextFormField(
// //                         // initialValue: _namaLengkapCtlr.text,
// //                         controller: namaLengkapCtlr,
// //                         decoration: InputDecoration(
// //                           hintText: 'Nama Lengkap',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(18),
// //                             borderSide: BorderSide.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Container(
// //                       height: 40,
// //                       padding: const EdgeInsets.only(top: 12),
// //                       margin: const EdgeInsets.only(left: 20, right: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(18),
// //                         color: Colors.white,
// //                       ),
// //                       child: TextFormField(
// //                         controller: alamatCtlr,
// //                         decoration: InputDecoration(
// //                           hintText: 'Alamat',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(18),
// //                             borderSide: BorderSide.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Container(
// //                       height: 40,
// //                       padding: const EdgeInsets.only(top: 12),
// //                       margin: const EdgeInsets.only(left: 20, right: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(18),
// //                         color: Colors.white,
// //                       ),
// //                       child: TextFormField(
// //                         controller: waCtlr,
// //                         decoration: InputDecoration(
// //                           hintText: 'Nomer WA',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(18),
// //                             borderSide: BorderSide.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Container(
// //                       height: 40,
// //                       padding: const EdgeInsets.only(top: 12),
// //                       margin: const EdgeInsets.only(left: 20, right: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(18),
// //                         color: Colors.white,
// //                       ),
// //                       child: TextFormField(
// //                         controller: emailCtlr,
// //                         decoration: InputDecoration(
// //                           hintText: 'Email',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(18),
// //                             borderSide: BorderSide.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Container(
// //                       height: 40,
// //                       padding: const EdgeInsets.only(top: 10),
// //                       margin: const EdgeInsets.only(left: 20, right: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(15),
// //                         color: Colors.white,
// //                       ),
// //                       child: TextFormField(
// //                         controller: sandiCtlr,
// //                         obscuringCharacter: '•',
// //                         obscureText: true,
// //                         decoration: InputDecoration(
// //                           hintText: 'Password',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(15),
// //                             borderSide: BorderSide.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Align(
// //                       alignment: Alignment.topRight,
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(right: 35),
// //                         child: ElevatedButton(
// //                           style: ElevatedButton.styleFrom(
// //                               backgroundColor: Colors.green[800]),
// //                           child: proses == false
// //                               ? const Text('Daftar')
// //                               : const CircularProgressIndicator(),
// //                           onPressed: () {
// //                             daftarUser();
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future daftarUser() async {
// //     var regAPIUrl = "https://protocoderspoint.com/php/registration.php";
// //     Map maped = {
// //       'name': namaLengkapCtlr.text,
// //       'alamat': alamatCtlr.text,
// //       'no_wa': waCtlr.text,
// //       'email': emailCtlr.text,
// //       'sandi': sandiCtlr.text
// //     };
// //     http.Response response = await http.post(Uri.parse(regAPIUrl), body: maped);
// //     var data = jsonDecode(response.body);
// //     print("Data: ${data}");
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   await Hive.initFlutter();
// //   // await Hive.deleteBoxFromDisk('shopping_box');
// //   await Hive.openBox('shopping_box');

// //   runApp(const MyApp());
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'KindaCode.com',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// // Home Page
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Map<String, dynamic>> _items = [];

//   final _shoppingBox = Hive.box('shopping_box');

//   @override
//   void initState() {
//     super.initState();
//     _refreshItems(); // Load data when app starts
//   }

//   // Get all items from the database
//   void _refreshItems() {
//     final data = _shoppingBox.keys.map((key) {
//       final value = _shoppingBox.get(key);
//       return {"key": key, "name": value["name"], "quantity": value['quantity']};
//     }).toList();

//     setState(() {
//       _items = data.reversed.toList();
//       // we use "reversed" to sort items in order from the latest to the oldest
//     });
//   }

//   // Create new item
//   Future<void> _createItem(Map<String, dynamic> newItem) async {
//     await _shoppingBox.add(newItem);
//     _refreshItems(); // update the UI
//   }

//   // Retrieve a single item from the database by using its key
//   // Our app won't use this function but I put it here for your reference
//   Map<String, dynamic> _readItem(int key) {
//     final item = _shoppingBox.get(key);
//     return item;
//   }

//   // Update a single item
//   Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
//     await _shoppingBox.put(itemKey, item);
//     _refreshItems(); // Update the UI
//   }

//   // Delete a single item
//   Future<void> _deleteItem(int itemKey) async {
//     await _shoppingBox.delete(itemKey);
//     _refreshItems(); // update the UI

//     // Display a snackbar
//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('An item has been deleted')));
//   }

//   // TextFields' controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();

//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   void _showForm(BuildContext ctx, int? itemKey) async {
//     // itemKey == null -> create new item
//     // itemKey != null -> update an existing item

//     if (itemKey != null) {
//       final existingItem =
//           _items.firstWhere((element) => element['key'] == itemKey);
//       _nameController.text = existingItem['name'];
//       _quantityController.text = existingItem['quantity'];
//     }

//     showModalBottomSheet(
//         context: ctx,
//         elevation: 5,
//         isScrollControlled: true,
//         builder: (_) => Container(
//               padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(ctx).viewInsets.bottom,
//                   top: 15,
//                   left: 15,
//                   right: 15),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(hintText: 'Name'),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _quantityController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(hintText: 'Quantity'),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // Save new item
//                       if (itemKey == null) {
//                         _createItem({
//                           "name": _nameController.text,
//                           "quantity": _quantityController.text
//                         });
//                       }

//                       // update an existing item
//                       if (itemKey != null) {
//                         _updateItem(itemKey, {
//                           'name': _nameController.text.trim(),
//                           'quantity': _quantityController.text.trim()
//                         });
//                       }

//                       // Clear the text fields
//                       _nameController.text = '';
//                       _quantityController.text = '';

//                       Navigator.of(context).pop(); // Close the bottom sheet
//                     },
//                     child: Text(itemKey == null ? 'Create New' : 'Update'),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   )
//                 ],
//               ),
//             ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('KindaCode.com'),
//       ),
//       body: _items.isEmpty
//           ? const Center(
//               child: Text(
//                 'No Data',
//                 style: TextStyle(fontSize: 30),
//               ),
//             )
//           : ListView.builder(
//               // the list of items
//               itemCount: _items.length,
//               itemBuilder: (_, index) {
//                 final currentItem = _items[index];
//                 return Card(
//                   color: Colors.orange.shade100,
//                   margin: const EdgeInsets.all(10),
//                   elevation: 3,
//                   child: ListTile(
//                       title: Text(currentItem['name']),
//                       subtitle: Text(currentItem['quantity'].toString()),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Edit button
//                           IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () =>
//                                   _showForm(context, currentItem['key'])),
//                           // Delete button
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () => _deleteItem(currentItem['key']),
//                           ),
//                         ],
//                       )),
//                 );
//               }),
//       // Add new item button
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showForm(context, null),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }}