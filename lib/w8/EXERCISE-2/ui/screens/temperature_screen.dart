import 'package:flutter/material.dart';





// class TemperatureScreen extends StatelessWidget {
//   final void Function() navigate;
//   TemperatureScreen({super.key, required this.navigate});

//   final InputDecoration inputDecoration = InputDecoration(
//     enabledBorder: OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.white, width: 1.0),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Enter a temperature',
//     hintStyle: const TextStyle(color: Colors.white),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Icon(
//               Icons.thermostat_outlined,
//               size: 120,
//               color: Colors.white,
//             ),
//             const Center(
//               child: Text(
//                 "Converter",
//                 style: TextStyle(color: Colors.white, fontSize: 45),
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Text("Temperature in Degrees:"),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: inputDecoration,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 30),
//             const Text("Temperature in Fahrenheit:"),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text("_controller.text"),
//             ),
//             const SizedBox(height: 30),
//             FilledButton(
//               style: ButtonStyle(
//                 backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
//               ),
//               onPressed: navigate,
//               child: Text("Back"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class DynamicTemperatureScreen extends StatefulWidget {
  final void Function() navigate;
  const DynamicTemperatureScreen({super.key, required this.navigate});


  @override
  State<DynamicTemperatureScreen> createState() => _DynamicTemperatureScreenState();
}

class _DynamicTemperatureScreenState extends State<DynamicTemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  final _controller = TextEditingController();

  late String temp;

  @override
  void initState() {
    _controller.addListener(_convertTemp);
    super.initState();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }


  void _convertTemp() {
    setState(() {
      try{
        temp = (double.parse(_controller.text) * 1.8 + 32).toString();
      } catch (e) {
        temp = "Input temperature must be numeric value!";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: 
                Text("$temp") ,
            ),
            const SizedBox(height: 30),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
              ),
              onPressed: widget.navigate,
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
