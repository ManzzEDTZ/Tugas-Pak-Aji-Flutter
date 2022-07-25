import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class hitungLuas extends StatefulWidget {
  const hitungLuas({Key? key}) : super(key: key);

  @override
  State<hitungLuas> createState() => _hitungLuasState();
}

class _hitungLuasState extends State<hitungLuas> {
  TextEditingController ctrAlas = new TextEditingController();
  TextEditingController ctrTinggi = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perhitungan Luas Segitiga"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrAlas,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Alas',
              ),
            ),
            Container(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrTinggi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Tinggi',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Container(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (ctrAlas.text.isNotEmpty &&
                          ctrTinggi.text.isNotEmpty) {
                        ctrHasil.text = (1/2 * int.parse(ctrAlas.text) *
                                int.parse(ctrTinggi.text))
                            .toString();
                      } else {
                        ctrHasil.text = "0";
                      }
                    });
                  },
                  child: Text("Hitung")),
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hasil : ${ctrHasil.text}cm",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
