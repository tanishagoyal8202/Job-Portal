import 'package:flutter/material.dart';

class JSHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Help'),
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          leading:IconButton(icon:Icon(Icons.arrow_back),
              onPressed: ()=>Navigator.pop(context,false)),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry('How to apply for a job?',
      <Entry>[
        Entry('You can apply for a job by just clicking on apply option below the'
            ' job details.'),
      ]
  ),
  Entry('How do I get alerts about suitable vacancies?',
      <Entry>[
        Entry('We will notify you whenever a new job matching your profile will be uploaded on the portal.'),
      ]
  ),
  Entry('Can I apply for a job in another country?',
      <Entry>[
        Entry('You are welcome to apply for jobs in any country. However, '
            'often candidates are only considered if they offer unique skills '
            'or experience not found in the hiring country. Speaking the local '
            'language could be an advantage but is not mandatory, unless specified '
            'in the job listing.'),
      ]
  ),
  Entry('How many jobs can I apply for?',
      <Entry>[
        Entry('You can apply for maximum 3 jobs in a day.'),
      ]
  ),
  Entry('I cannot find a suitable job in the job search page. What should I do?',
      <Entry>[
        Entry('Wait for other jobs to be loaded.'),
      ]
  ),
  Entry('Is there any registration fee?',
    <Entry>[
      Entry('No, our services are absolutely free for job seekers.'),
    ],
  ),
  Entry('Who should I get in touch with in case of any issues/clarifications?',
    <Entry>[
      Entry('You can contact our coustmer support team or can drop an email on jobshop@gmail.com.'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}