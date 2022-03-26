
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/rendering.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import 'analyzer.dart';


class Sort extends StatefulWidget {


  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  final form = FormGroup(
    {'array': FormControl()},
  );
  int bubble = 0;
  int insertion = 0;
  int selection = 0;
  int heap = 0;
  int merge = 0;
  String get name => this.form.control('array').value;
  var b = List<int>.filled(0, 0, growable: true);
  void bubblesort(List a) {
    Stopwatch stopwatch1 = new Stopwatch()..start();
    //var a = [5,4,3,2,1];
    for (var i = 0; i < a.length; i++) {
      bool swaped = false;
      for (var j = i + 1; j < a.length; j++) {
        if (a[i] > a[j]) {
          var tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
          swaped = true;
        }
      }
      if (!swaped) break;
    }
    int stop = stopwatch1.elapsedMicroseconds;
    setState(() {
      bubble = stop;
    });
  }
  void insertionsort(List a) {
    Stopwatch stopwatch2 = new Stopwatch()..start();
    for (var i = 0; i < a.length; i++) {
      var x = a[i], j = i;

      while (j > 0 && a[j - 1] > x) {
        a[j] = a[j - 1];
        a[j - 1] = x;
        j--;
      }

      a[j] = x;
    }
    int stop = stopwatch2.elapsedMicroseconds;
    setState(() {
      insertion = stop;
    });
  }

  void selectionsort(List a) {
    Stopwatch stopwatch3 = new Stopwatch()..start();
    for (var i = a.length - 1; i >= 0; i--) {
      var first = 0, tmp;

      for (var j = 1; j <= i; j++) {
        if (a[j] > a[first]) first = j;
      }

      tmp = a[first];
      a[first] = a[i];
      a[i] = tmp;
    }
    int stop = stopwatch3.elapsedMicroseconds;
    setState(() {
      selection = stop;
    });
  }

  void heapify(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapify(list, n, largest);
    }
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  void heapSort(List list) {
    Stopwatch stopwatch4 = new Stopwatch()..start();
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(list, i);
      heapify(list, i, 0);
    }
    int stop = stopwatch4.elapsedMicroseconds;
    setState(() {
      heap = stop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // home: Container(


      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              child:    ElevatedButton(
                child: const Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Visual()),
                  );
                },
              ),
            ),
            Container(
              child: Text(
                'Sorting Algorithm Analyzer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Akaya',
                ),
              ),
            ),
            SizedBox(height: 40),
            AvatarGlow(
              glowColor: Colors.blue,
              endRadius: 70.0,
              duration: Duration(milliseconds: 800),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.orange[100],
                  child: Image.asset(
                    'images/sort.png',
                    height: 60,
                  ),
                  radius: 40.0,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                child: ReactiveForm(
                  formGroup: this.form,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Enter your array here:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Akaya',
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        child: ReactiveTextField(
                          formControlName: 'array',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {

                bubblesort(b);
                heapSort(b);
                selectionsort(b);
                insertionsort(b);

              },
              child: Text(
                'ANALYZE NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Akaya',
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 250,
              height: 55,
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 20.0),
                  title: Text('Bubble Sort: ' + bubble.toString() + 'us',
                    style: GoogleFonts.abel(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 55,
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 20.0),
                  title: Text('Heap Sort: ' + heap.toString() + 'us',
                    style: GoogleFonts.abel(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 55,
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 20.0),
                  title: Text('Insertion Sort: ' + insertion.toString() + 'us',
                    style: GoogleFonts.abel(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 55,
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 20.0),
                  title: Text('Merge Sort: ' + merge.toString() + 'us',
                    style: GoogleFonts.abel(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),

      // ),
    );




  }
}
