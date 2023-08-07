import 'package:flutter/material.dart';

void main() {
  runApp(SudokuApp());
}

class SudokuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SudokuGame(),
    );
  }
}

class SudokuGame extends StatefulWidget {
  @override
  _SudokuGameState createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  late List<List<int>> board;

  @override
  void initState() {
    super.initState();
    // Initialize the Sudoku board with an empty grid (0 means an empty cell).
    board = List.generate(9, (_) => List<int>.filled(9, 0));
    generateBoard(); // Call this method to generate a random Sudoku board.
  }

  void generateBoard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text('Sudoku Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ 9;
                int col = index % 9;
                bool colLine =
                    (col == 1 || col == 3 || col == 5 || col == 7 || col == 9);
                bool rowLine =
                    (row == 1 || row == 3 || row == 5 || row == 7 || row == 9);

                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: colLine
                          ? Colors.blueGrey.shade100
                          : rowLine
                              ? Colors.blueGrey.shade100
                              : Colors.white10,
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col] != 0 ? board[row][col].toString() : '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 81,
              shrinkWrap: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade900,
              ),
              onPressed: () {},
              child: Text('Check Solution'),
            ),
          ],
        ),
      ),
    );
  }
}
