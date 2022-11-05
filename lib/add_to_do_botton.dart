// //libraries
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'getCsv.dart';
// import 'data_state.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // late ScrollController _controller;
//   // recargar();
//   @override
//   void initState() {
//     super.initState();
//     // _controller = ScrollController();
//     // _controller.addListener(_onScrollUpdate);
//   }

//   Widget build(BuildContext context) {
//     // initiatee();
//     // initState(); // si no pongo este no se imprime nada
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lectura de animales: "),
//         leading: new Icon(Icons.home),
//       ),
//       // body: _body(),
//       body:
//           //  _expenses(),
//           Consumer<DataState>(
//         builder: (BuildContext context, DataState value, Widget? child) {
//           return ListView.builder(
//             // controller: _controller,
//             itemCount: animales.length,
//             itemBuilder: (BuildContext context, int index) {
//               // recargar();

//               if (index >= animales.length) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               return ListTile(
//                 title: Text("${animales[index][0]}"),
//                 // title: Text("Lectura de animales"),
//               );
//             },
//           );
//         },
//         child: _body(),
//       ),
//       floatingActionButton:
//           Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//         FloatingActionButton.extended(
//           onPressed: actualizar,
//           // onPressed: actualizar,
//           label: const Text('Actualizar'),
//           icon: const Icon(Icons.update),
//           backgroundColor: Colors.blue[300],
//         ),
//         FloatingActionButton.extended(
//           onPressed: getCsv,
//           label: const Text('Descargar'),
//           icon: const Icon(Icons.download),
//           backgroundColor: Colors.blue[300],
//         ),
//       ]),
//     );
//   }

//   void actualizar() async {
//     print("se actuazar");
//     setState(() {
//       for (var i = 0; i < animales.length; i++) {
//         print(animales[i][0]);
//       }
//     });
//   }

//   Future<void> recargar() async {
//     await Future.delayed(Duration(seconds: 2));
//     print("se actualiza");
//     setState(() {
//       for (var i = 0; i < animales.length; i++) {
//         print(animales[i][0]);
//       }
//     });
//   }

// //   void _onScrollUpdate() {
// //     var maxScroll = _controller.position.maxScrollExtent;
// //     var currentPosition = _controller.position.pixels;
// //     if (currentPosition > maxScroll - 5) {
// //       var state = Provider.of<DataState>(context);
// //       state.loadnumbers();
// //       print("estamos en el final");
// //     }
// //     print("$maxScroll,$currentPosition");
// //   }
// }

// //_body
// Widget _body() {
//   return SafeArea(
//     child: _list(),
//   );
// }

// //_list
// Widget _list() => ListWheelScrollView.useDelegate(
//     itemExtent: 50,
//     childDelegate: ListWheelChildBuilderDelegate(
//         childCount: animales.length,
//         builder: (context, index) {
//           return Container(
//               color: Colors.lightBlue,
//               child: Center(
//                 child: Text("Num: " + animales[index][0]),
//               ));
//         }));

// // Widget _expenses() {
// //   return Column(
// //     children: <Widget>[
// //       Consumer<DataState>(
// //         builder: (BuildContext context, DataState value, Widget? child) {
// //           return ListView.builder(
// //             // controller: _controller,
// //             itemCount: value.isLoading ? animales.length + 1 : animales.length,
// //             itemBuilder: (BuildContext context, int index) {
// //               if (index >= animales.length) {
// //                 return Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //               }
// //               return ListTile(
// //                 title: Text("$index - ${animales[index][0]}"),
// //                 // title: Text("Lectura de animales"),
// //               );
// //             },
// //           );
// //         },
// //         child: _body(),
// //       ),
// //     ],
// //   );
// // }

// // // getList() {
// // //   return animales
// // //       .map((index) => Center(
// // //             child: ListTile(
// // //               title: Text(index[0]),
// // //             ),
// // //           ))
// // //       .toList();
// // // }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/styles.dart';
import 'hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class AddTodoButton extends StatelessWidget {
  /// {@macro add_todo_button}
  const AddTodoButton({Key? key}) : super(key: key); //aca tmb

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _AddTodoPopupCard();
            // return _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'Agregar evento';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  final eventController = TextEditingController();
  _AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      controller: eventController,
                      decoration: InputDecoration(
                        hintText: 'Escriba el evento a realizar',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextButton(
                      // onPressed: aoeu(),
                      onPressed: () {
                        // nuevo();
                        loadnumbers(eventController.text.toString());
                      },
                      child: const Text('Crear'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
