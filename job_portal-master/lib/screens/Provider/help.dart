import 'package:flutter/material.dart';

class JPHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Help'),
          backgroundColor: Colors.cyan[600],
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
  Entry('How do I Post A Job?',
      <Entry>[
        Entry('Posting a Job is a very simple procedure. Once you log into '
            'your account you will be taken to the JobProvider home screen. You will see several tabs.'
            'By clicking on ADD button you will be taken to a screen to post your job. Simply fill '
            'in the required information fields and hit “Submit”. That’s it!'),
      ]
  ),
  Entry('How can I see that my Jobs are posted on the site?',
      <Entry>[
        Entry('The jobs that you will post will get appeared in your home screen.'),
      ]
  ),
  Entry('After I Post-A-Job what do I need to do?',
      <Entry>[
        Entry('Nothing – except  wait for applicants to apply for your Job(s). '
            'Going forward you will be informed via e-mail that an applicant has '
            'applied for your Job.'),
      ]
  ),
  Entry('Can I delete a JobPost at any time?',
      <Entry>[
        Entry('Yes. You can delete a job at any time prior to the Job Date. We '
            'understand that issues may arise that force the cancellation of a '
            'Job, but we would encourage that deleting a Job be done at least '
            '48 hours before the JobDate. Once you have indicated that you are '
            'deleting a Job, an email is sent to the seekers informing them '
            'of this occurrence. The sooner they know the better chance they may '
            'have to arrange for another Job.'),
      ]
  ),
  Entry('How can I contact my applicants?',
      <Entry>[
        Entry('When you will click on the selected job that you have posted, '
            'you will get the details of the applicants applied for your job.'),
      ]
  ),
  Entry('Is there any registration fee?',
    <Entry>[
      Entry('No, our services are absolutely free.'),
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

