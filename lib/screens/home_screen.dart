import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  final List<bool> _selection = [true, false, false];

  String? tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.purple,
        title: const Text('Tip Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tip != null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  tip!,
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.w600),
                ),
              ),
            Text(
              "Total Amount",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 150,
              child: TextField(
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w600),
                controller: controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: '\$100.00'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ToggleButtons(
                  isSelected: _selection,
                  onPressed: updateSelection,
                  children: const [Text("10%"), Text('15%'), Text('20%')]),
            ),
            ElevatedButton(
              onPressed: calculateTip,
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, padding: const EdgeInsets.all(15)),
              child: const Text("Calculate Tip"),
            )
          ],
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    ///get the input text
    final totalAmount = double.parse(controller.text);

    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.5, 0.2][selectedIndex];

    ///calculate and round to the 100th two decimal places
    final totalTip = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$totalTip';
    });
  }
}
