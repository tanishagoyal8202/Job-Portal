import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Table',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Table'),
            backgroundColor: Colors.cyan[600],
            centerTitle: true,
            leading:IconButton(icon:Icon(Icons.arrow_back),
                onPressed: ()=>Navigator.pop(context,false)),
          ),
          body: BasicTable(),
        )
    );
  }
}


class BasicTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            defaultColumnWidth: FixedColumnWidth(200.0),
            border: TableBorder(
              horizontalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0.8,
              ),
              verticalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0.8,
              ),
            ),
            children: [
              _buildTableRow("NAME, E-MAIL, APPLIED FOR, WORK EXPERIENCE"),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
              _buildTableRow(", , , "),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String listOfNames) {
    return TableRow(
      children: listOfNames.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(name, style: TextStyle(fontSize: 18.0)),
          padding: EdgeInsets.all(7.0),
        );
      }).toList(),
    );
  }
}