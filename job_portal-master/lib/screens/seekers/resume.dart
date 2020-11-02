import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          child:
          new Container(
            margin: new EdgeInsets.only(top: 5.0),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: new Column(
                  children: <Widget>[
                    new Text('An excellent resume has the power to open doors.',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0)),
                    new Text('To stand out among other applicants, you need a resume that markets your strengths and match for the job. A great resume: Grabs the attention of employers and recruiters. Sells your strongest skills and accomplishments.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                    new Text('         '),
                    new Text('How to format your resume-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                    new Text('         '),
                    Align(alignment: Alignment.topLeft,child: new Text('- Your fresher resume format is critically important:')),
                    new Text('            '),
                    new Text('- Your resume must be easy to read. Always think of the reader’s needs.'),
                    new Text('            '),
                    new Text('- Use dedicated sections, not just headers, to split up your resume into simple segments.'),
                    new Text('            '),
                    new Text('- This is to help the reader focus on specific information, like qualifications, etc.'),
                    new Text('            '),
                    new Text('- Make sure that your resume has a credible, professional look and use color to break up your sections. Some resumes you’ll see online look like junk mail, and that’s not where you want to be. Look professional!'),
                    new Text('            '),
                    new Text('- Allow space for your information. Don’t try to cram things in to spaces which are too small.'),
                    new Text('            '),
                    new Text('- There is no set-in-stone format for fresher resumes apart from the obvious baseline information required. If you have high value information, like an internship or project relevant to the application, include it.'),
                    new Text('            '),
                    new Text('Basic fresher resume layout-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                    new Text('            '),
                    new Text('- Name and contact info header- Large standard font, all easy to read.          '),
                    new Text('            '),
                    new Text('- Career objectives- Optional, and not necessarily useful. Keep this section brief and clear, if included.'),
                    new Text('            '),
                    new Text('- Qualifications- Spell out relevant information. Check to make sure you’re providing all the information required and clearly define your skill sets in terms of application requirements. Use the same keywords as the job criteria to get through computer screening.'),
                    new Text('            '),
                    new Text('- Software skills- This is a common requirement for many employers and a major checklist criteria item for some.'),
                    new Text('            '),
                    new Text('- Relevant practical experience- Projects, internships, related academic work if applicable. Ensure you address the employer’s high priority requirements in this section.'),
                    new Text('            '),
                    new Text('- Allow space for your information. Don’t try to cram things in to spaces which are too small.'),
                    new Text('            '),
                    new Text('- Achievements- Clearly define your achievements. Expand to include relevant position requirements.'),
                    new Text('            '),
                    new Text('Above all- Think!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                    new Text('            '),
                    new Text('- The usual, fatal mistake with any resume is sending the employer some half-baked, incomplete, last minute thing you did at 4AM. A resume written like that invariably looks like that and winds up in the discards.'),
                    new Text('            '),
                    new Text('Checklist-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                    new Text('            '),
                    Align(alignment: Alignment.topLeft,child: new Text('- All employer criteria addressed?')),
                    new Text('            '),
                    Align(alignment: Alignment.topLeft,child: new Text('- No typos?')),
                    new Text('            '),
                    Align(alignment: Alignment.topLeft,child: new Text('- Looks good?')),
                    new Text('            '),
                    Align(alignment: Alignment.topLeft,child: new Text('- Includes all your high value information?')),
                    new Text('            '),
                    Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.cyan[600],
                        textColor: Colors.white,
                        child: Text('Upload Resume',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              textBaseline: TextBaseline.alphabetic
                          ),),
                        onPressed: () {},
                      ),
                    ),
                  ] ),
            ),
          ),
        ),

      ),
    );
  }
}