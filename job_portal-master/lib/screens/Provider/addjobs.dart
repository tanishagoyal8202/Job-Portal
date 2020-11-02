import 'dart:convert';
import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'dart:async';
import 'package:job_portal/screens/CustomProgressLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Create a Form widget.
class AddJobsForm extends StatefulWidget {
  @override
  AddJobsFormState createState() {
    return AddJobsFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddJobsFormState extends State<AddJobsForm>  {
  SharedPreferences prefs;
  String id;
  TextEditingController jobTitle = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController workingHours = new TextEditingController();
  TextEditingController workingDays = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController experience = new TextEditingController();
  TextEditingController jobDescription = new TextEditingController();
  TextEditingController skillsRequired = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController status = new TextEditingController();
  final TextEditingController last = new TextEditingController();
  TextEditingController email = new TextEditingController();
  Future<String> apiRequest(String url, Map jsonMap) async {
    try {
      CustomProgressLoader.showLoader(context);

      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      var reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();
      print(Constants.userId);
      print('RESPONCE_DATA : ' + status);

      CustomProgressLoader.cancelLoader(context);

      if (status == "1") {
        Fluttertoast.showToast(
            msg: "Job added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
        return reply;
      } else  {
        Fluttertoast.showToast(
            msg: "Try Again ,Some Thing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,

            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      CustomProgressLoader.cancelLoader(context);
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      id=prefs.getString(Constants.userId);
      print('$id');

    });
  }
  @override
  void initState() {

    super.initState();
    _incrementCounter();

  }
  Future validation() async {

    if (jobTitle.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter the Job Title!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (salary.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter the Salary!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (company.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter the Company Name!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (experience.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Experience Required!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (category.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Category of the job!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (skillsRequired.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter the Skills that are Required!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }  else if (location.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Location of the Job!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (status.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Status of the Job!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (last.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter the Last Date To Apply!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }  else {
      Map map = {
        "Job Title": '${jobTitle.text}',
        "Category": '${category.text}',
        "Company": '${company.text}',
        "email": '${email.text}',
        "Working hours": '${workingHours.text}',
        "Working days": '${workingDays.text}',
        "Salary": '${salary.text}',
        "Experience required": '${experience.text}',
        "Job description": '${jobDescription.text}',
        "Skills required": '${skillsRequired.text}',
        "Location": '${location.text}',
        "Status": '${status.text}',
        "Last date to apply": '${last.text}',
        "employer_id": '${'$id'}'

      };
      apiRequest(Constants.addJobs, map);
    }
  }

  Map<String, dynamic> formData;
  List<String> cities = ["Adilabad","Agra","Ahmedabad","Ahmednagar","Aizawl","Ajitgarh (Mohali)","Ajmer","Akola","Alappuzha","Aligarh","Alirajpur","Prayagraj","Almora","Alwar","Ambala","Ambedkar Nagar","Amravati","Amreli district","Amritsar","Anand","Anantapur","Anantnag",
    "Angul","Anjaw","Anuppur","Araria","Ariyalur","Arwal","Ashok Nagar","Auraiya","Aurangabad","Aurangabad","Azamgarh","Badgam","Bagalkot","Bageshwar","Bagpat","Bahraich","Baksa","Balaghat","Balangir","Balasore","Ballia","Balrampur","Banaskantha","Banda","Bandipora","Bangalore Rural",
    "Bangalore Urban","Banka","Bankura","Banswara","Barabanki","Baramulla","Baran","Bardhaman","Bareilly","Bargarh (Baragarh)","Barmer","Barnala","Barpeta","Barwani","Bastar","Basti","Bathinda","Beed","Begusarai","Belgaum","Bellary","Betul","Bhadrak","Bhagalpur","Bhandara","Bharatpur",
    "Bharuch","Bhavnagar","Bhilwara","Bhind","Bhiwani","Bhojpur","Bhopal","Bidar","Bijapur","Bijapur","Bijnor","Bikaner","Bilaspur","Bilaspur","Birbhum","Bishnupur","Bokaro","Bongaigaon","Boudh (Bauda)","Budaun","Bulandshahr","Buldhana","Bundi","Burhanpur","Buxar","Cachar","Central Delhi",
    "Chamarajnagar","Chamba","Chamoli","Champawat","Champhai","Chandauli","Chandel","Chandigarh","Chandrapur","Changlang","Chatra","Chennai","Chhatarpur","Chhatrapati Shahuji Maharaj Nagar","Chhindwara","Chikkaballapur","Chikkamagaluru","Chirang","Chitradurga","Chitrakoot","Chittoor","Chittorgarh",
    "Churachandpur","Churu","Coimbatore","Cooch Behar","Cuddalore","Cuttack","Dadra and Nagar Haveli","Dahod","Dakshin Dinajpur","Dakshina Kannada","Daman","Damoh","Dantewada","Darbhanga","Darjeeling","Darrang","Datia","Dausa","Davanagere","Debagarh (Deogarh)","Dehradun","Deoghar","Deoria","Dewas",
    "Dhalai","Dhamtari","Dhanbad","Dhar","Dharmapuri","Dharwad","Dhemaji","Dhenkanal","Dholpur","Dhubri","Dhule","Dibang Valley","Dibrugarh","Dima Hasao","Dimapur","Dindigul","Dindori","Diu","Doda","Dumka","Dungapurv","Durg","East Champaran","East Delhi","East Garo Hills","East Khasi Hills","East Siang",
    "East Sikkim","East Singhbhum","Eluru","Ernakulam","Erode","Etah","Etawah","Faizabad","Faridabad","Faridkot","Farrukhabad","Fatehabad","Fatehgarh Sahib","Fatehpur","Fazilka","Firozabad","Firozpur","Gadag","Gadchiroli","Gajapati","Ganderbal","Gandhinagar","Ganganagar","Ganjam","Garhwa","Gautam Buddh Nagar",
    "Gaya","Ghaziabad","Ghazipur","Giridih","Goalpara","Godda","Golaghat","Gonda","Gondia","Gopalganj","Gorakhpur","Gulbarga","Gumla","Guna","Guntur","Gurdaspur","Gurugram","Gwalior","Hailakandi","Hamirpur","Hanumangarh","Harda","Hardoi","Haridwar","Hassan","Haveri district","Hazaribag","Hingoli","Hissar","Hooghly",
    "Hoshangabad","Hoshiarpur","Howrah","Hyderabad","Idukki","Imphal East","Imphal West","Indore","Jabalpur","Jagatsinghpur","Jaintia Hills","Jaipur","Jaisalmer","Jajpur","Jalandhar","Jalaun","Jalgaon","Jalna","Jalore","Jalpaiguri","Jammu","Jamnagar",
    "Jamtara","Jamui","Janjgir-Champa","Jashpur","Jaunpur district","Jehanabad","Jhabua","Jhajjar","Jhalawar","Jhansi","Jharsuguda","Jhunjhunu","Jind","Jodhpur","Jorhat","Junagadh","Jyotiba Phule Nagar","Kabirdham (formerly Kawardha)","Kadapa","Kaimur","Kaithal","Kakinada","Kalahandi","Kamrup","Kamrup Metropolitan", "Kanchipuram","Kandhamal","Kangra","Kanker","Kannauj","Kannur","Kanpur",
    "Kanshi Ram Nagar","Kanyakumari","Kapurthala","Karaikal","Karauli","Karbi Anglong","Kargil","Karimganj","Karimnagar","Karnal","Karur","Kasaragod","Kathua","Katihar","Katni","Kaushambi","Kendrapara","Kendujhar (Keonjhar)","Khagaria","Khammam",
    "Khandwa (East Nimar)","Khargone (West Nimar)","Kheda","Khordha","Khowai","Khunti","Kinnaur","Kishanganj","Kishtwar","Kodagu","Koderma","Kohima","Kokrajhar","Kolar","Kolasib","Kolhapur","Kolkata","Kollam","Koppal","Koraput","Korba","Koriya","Kota","Kottayam","Kozhikode","Krishna","Kulgam","Kullu","Kupwara","Kurnool",
    "Kurukshetra","Kurung Kumey","Kushinagar","Kutch","Lahaul and Spiti","Lakhimpur","Lakhimpur Kheri","Lakhisarai","Lalitpur","Latehar","Latur","Lawngtlai","Leh","Lohardaga","Lohit","Lower Dibang Valley","Lower Subansiri","Lucknow","Ludhiana","Lunglei","Madhepura","Madhubani","Madurai","Mahamaya Nagar","Maharajganj","Mahasamund",
    "Mahbubnagar","Mahe","Mahendragarh","Mahoba","Mainpuri","Malappuram","Maldah","Malkangiri","Mamit","Mandi","Mandla","Mandsaur","Mandya","Mansa","Marigaon","Mathura","Mau","Mayurbhanj","Medak","Meerut","Mehsana","Mewat","Mirzapur","Moga","Mokokchung","Mon","Moradabad","Morena","Mumbai City","Mumbai suburban","Munger","Murshidabad",
    "Muzaffarnagar","Muzaffarpur","Mysore","Nabarangpur","Nadia","Nagaon","Nagapattinam","Nagaur","Nainital","Nalanda","Nalbari","Nalgonda","Namakkal","Nanded","Nandurbar","Narayanpur","Narmada","Narsinghpur","Nashik","Navsari","Nawada","Nawanshahr","Nayagarh","Neemuch","Nellore","New Delhi","Nilgiris","Nizamabad","North 24 Parganas",
    "North Delhi","North East Delhi","North Goa","North Sikkim","North Tripura","North West Delhi","Nuapada","Ongole","Osmanabad","Pakur","Palakkad","Palamu","Pali","Palwal","Panchkula","Panchmahal","Panchsheel Nagar district (Hapur)","Panipat","Panna","Papum Pare","Parbhani","Paschim Medinipur","Patan","Pathanamthitta","Pathankot","Patiala",
    "Patna","Pauri Garhwal","Perambalur","Phek","Pilibhit","Pithoragarh","Pondicherry","Poonch","Porbandar","Pratapgarh","Pudukkottai","Pulwama","Pune","Purba Medinipur","Puri","Purnia","Purulia","Raebareli","Raichur","Raigad","Raigarh","Raipur","Raisen","Rajauri","Rajgarh","Rajkot","Rajnandgaon","Rajsamand","Ramabai Nagar (Kanpur Dehat)","Ramanagara",
    "Ramanathapuram","Ramban","Ramgarh","Rampur","Ranchi","Ratlam","Ratnagiri","Rayagada","Reasi","Rewa","Rewari","Ri Bhoi","Rohtak","Rohtas","Rudraprayag","Rupnagar","Sabarkantha","Sagar","Saharanpur","Saharsa","Sahibganj","Saiha","Salem","Samastipur","Samba","Sambalpur","Sangli","Sangrur","Sant Kabir Nagar","Sant Ravidas Nagar","Saran","Satara","Satna",
    "Sawai Madhopur","Sehore","Senapati","Seoni","Seraikela Kharsawan","Serchhip","Shahdol","Shahjahanpur","Shajapur","Shamli","Sheikhpura","Sheohar","Sheopur","Shimla","Shimoga","Shivpuri","Shopian","Shravasti","Sibsagar","Siddharthnagar","Sidhi","Sikar","Simdega","Sindhudurg","Singrauli","Sirmaur","Sirohi","Sirsa","Sitamarhi","Sitapur","Sivaganga","Siwan",
    "Solan","Solapur","Sonbhadra","Sonipat","Sonitpur","South 24 Parganas","South Delhi","South Garo Hills","South Goa","South Sikkim","South Tripura","South West Delhi","Sri Muktsar Sahib","Srikakulam","Srinagar","Subarnapur (Sonepur)","Sultanpur","Sundergarh","Supaul","Surat","Surendranagar","Surguja","Tamenglong","Tarn Taran","Tawang","Tehri Garhwal","Thane",
    "Thanjavur","The Dangs","Theni","Thiruvananthapuram","Thoothukudi","Thoubal","Thrissur","Tikamgarh","Tinsukia","Tirap","Tiruchirappalli","Tirunelveli","Tirupur","Tiruvallur","Tiruvannamalai","Tiruvarur","Tonk","Tuensang","Tumkur","Udaipur","Udalguri","Udham Singh Nagar","Udhampur","Udupi","Ujjain","Ukhrul","Umaria","Una","Unnao","Upper Siang","Upper Subansiri",
    "Uttar Dinajpur","Uttara Kannada","Uttarkashi","Vadodara","Vaishali","Valsad","Varanasi","Vellore","Vidisha","Viluppuram","Virudhunagar","Visakhapatnam",
    'Vizianagaram','Vyara','Warangal','Wardha','Washim','Wayanad','West Champaran','West Delhi','West Garo Hills','West Kameng','West Khasi Hills','West Siang','West Sikkim','West Singhbhum','West Tripura','Wokha','Yadgir','Yamuna Nagar','Yanam','Yavatmal','Zunheboto',

  ];
  List<String> Skills = [
    ".NET Developement","3D Printing","Accounts","Analytics","Android App Developement","Angular.js Developement","Animation","Artificial Intelligence (AI)","ASP.NET Developement","Big Data","Backend Data","Blogging","CAD Design","Cloud Computing","Content Writing","Cyber Security","Data Science","Data Entry","Database Developement","Digital Marketing","Front End Developement","Full Stack Developement","Game Developement","General Management","Graphic Design","Hotel Management","Human Resource (HR)","Image Processing","Information Technology","Internet of Things (IoT)","iOS App Developement","Java Developement","Media","Networking"
  ];

  AddJobsFormState() {
    formData = {
      'City': 'Bangalore',
      'Skills': '.NET Developement',
    };
  }
  Future chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      last.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }
  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.title;

    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null) {
                  return Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: true ,
                        backgroundColor: Colors.cyan[600] ,
                        title: Text("Add a Job") ,
                        centerTitle: true ,
                        leading: IconButton(icon: Icon(Icons.arrow_back) ,
                          onPressed: () => Navigator.pop(context , false) ,
                        ) ,
                      ),
                      body: Container(
                        color: Colors.white,
                        constraints: BoxConstraints.expand(),
                        child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom:5.0,
                                  ),
                                  child: TextField(
                                    controller: jobTitle,
                                    decoration:InputDecoration(
                                        labelText:'Job Title',
                                        hintText:'eg- software engineering',
                                        labelStyle:textStyle,
                                        border:OutlineInputBorder(
                                            borderRadius:BorderRadius.circular(5.0))
                                    ),
                                    onChanged:(String string){
                                      setState((){});
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.black,

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child:  DropDownField(
                                      controller: category,

                                      icon: Icon(Icons.map),
                                      required: false,
                                      hintText: 'Choose a Category',
                                      labelStyle: textStyle,
                                      labelText: 'Category',
                                      items: Skills,
                                      setter: (dynamic newValue) {
                                        formData['Preferences'] = newValue;
                                      }
                                  ),
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom: 5.0,
                                  ),
                                  child: DropDownField(
                                      controller: location,
                                      value: formData['city'],
                                      labelStyle: textStyle,
                                      icon: Icon(Icons.location_city),
                                      hintText: 'Choose a city',
                                      labelText: 'City *',
                                      items: cities,
                                      strict: false,
                                      setter: (dynamic newValue) {
                                        formData['City'] = newValue;
                                      }),
                                ),
                                Divider(
                                  height: 10.0,
                                  color: Colors.black,

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: company,
                                      decoration:InputDecoration(
                                          labelText:'Company Name',
                                          hintText:'eg-Ziasy Technologies',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.text,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: workingHours,
                                      decoration:InputDecoration(
                                          labelText:'Work hour',
                                          hintText:'eg-5',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.text,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom:5.0,
                                  ),
                                  child: TextField(
                                      controller: workingDays,
                                      decoration:InputDecoration(
                                          labelText:'Working days',
                                          hintText:'eg-6 days a week',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.text,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: salary,
                                      decoration:InputDecoration(
                                          labelText:'Salary',
                                          hintText:'eg-5 lakh per annum',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.text,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: experience,
                                      decoration:InputDecoration(
                                          labelText:'Experience Required',
                                          hintText:'eg- 2 years',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.text,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(

                                      controller: skillsRequired,
                                      decoration:InputDecoration(
                                          labelText:'Skills Required',
                                          hintText:'eg- c , c++',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      onChanged:(String string){
                                        setState((){});}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: jobDescription,
                                      decoration:InputDecoration(
                                          labelText:'Job Description',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      keyboardType:TextInputType.multiline,
                                      onChanged:(String string){
                                        setState((){});}),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom: 5.0,
                                  ),
                                  child: TextField(
                                      controller: status,
                                      decoration:InputDecoration(
                                          labelText:'Status',
                                          hintText:'eg- Active',
                                          labelStyle:textStyle,
                                          border:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0))
                                      ),
                                      onChanged:(String string){
                                        setState((){});}),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom:5.0,
                                  ),
                                  child: TextFormField(

                                    decoration:InputDecoration(
                                        labelText:'Last date to apply',
                                        hintText:'eg- 10 June 2019',
                                        labelStyle:textStyle,
                                        border:OutlineInputBorder(
                                            borderRadius:BorderRadius.circular(5.0))
                                    ),
                                    controller: last,
                                    keyboardType:TextInputType.datetime,
                                    validator: (val) => isValidDob(val) ? null : 'Not a valid date',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top:5.0,
                                    bottom: 5.0,
                                  ),
                                  child: FlatButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    onPressed: validation,
                                    child: Text(
                                      "Add Job",
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ),

                              ],
                            )
                        ),
                      )
                  );
                } else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
}
