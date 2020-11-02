import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privacy Policy',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Privacy Policy'),
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          leading:IconButton(icon:Icon(Icons.arrow_back),
              onPressed: ()=>Navigator.pop(context,false)),
        ),

        body: SingleChildScrollView(
          child:
          new Container(
            // margin: new EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: new Column(
                  children: <Widget>[
                    new Text('Introduction',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('JOB-SHOP assures complete protection regarding the privacy of our website users and '
                        'dedicates towards a safe usage comfort. Our privacy terms details how are all personal information '
                        'being collected, used, shared and saved. This also covers any type of use, logins and any changes '
                        'to your personal information.'),
                    new Text('Usage of this site and its accompanying application/software automatically implies in you agreeing'
                        'to any collection, use or changes of your data as provided under this Privacy Policy.'
                        'Should you not want such information to be used in this way as stipulated in this privacy policy,'
                        'you may at any point of time revoke your acknowledgement by contacting us directly. Any revocation '
                        'from your part will result in your account and information saved being removed from our website and '
                        'server within 2 working days.'
                        'Any information that is being saved on our website and whereby is stored in Mauritius is subject '
                        'to Mauritian law.'),
                    new Text('Extent this Privacy Policy',style: TextStyle(fontWeight: FontWeight.bold)),

                    new Text('Our privacy policy is applicable to information that we collect through our website or server. '
                        'Any other third party using such information will be directly under the control of'
                        'We are linked to different company websites where we have no control and their privacy policies'
                        'or practices are at no point of time under our management. You are strongly advised to check the'
                        'privacy policies of those websites in order to understand how they deal with your information.'),
                    new Text('What do we collect',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Any information that you put while using our website is being collected. We collect details '
                        'like contact information, resumes uploaded or typed, profile created information and any other business '
                        'information. These types of data are being saved through our website, when you send it to us in any other'
                        ' way.'
                        'Sample information we collect:'
                        'Bank or credit card/smile number and its billing information'
                        'Any other information from you in regards to third parties'
                        'Race, Gender, Education, BRN number, Company Name and other details.'),
                    new Text('Referrals',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Any information we collect from you about other companies or seekers or sharing of our service is '
                        'subject to identification. He will then be sent a link via email to visit our site. Any contacts provided '
                        'will be used only for the specified purpose decided.'),
                    new Text('Passive Collection:',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Other automatic data collection being done while you are on our website may relate or include '
                        'IP Addresses, Browsers being used, Device Used, ISP, Contents viewed on our website, Date, Time, Stamp. '
                        'This information is being collected in order to prevent fraud and protect both you and Targetplus Ltd.'),
                    new Text('User Data',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('We can gather data about you from other sources of websites and these information may be used to '
                        'create a profile even if you do not have an active account with us. You will be allowed to claim your '
                        'information, change or remove it through us. However, any information collected from publicly available '
                        'sources will not be subject to violation of data on our behalf.'),
                    new Text('Single time sign in:',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Using hireme.mu site through Facebook or any particular sites having our services'
                        'automatically allows us to collect your information and transfer it to ours. We make sure that you'
                        'are publicly available by default. When you post any type of data on another user’s profile or comment on a'
                        'user’s post, that information will be subject to the other user’s privacy settings '),
                    new Text('How We Use Information',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('we try our best to use any information collected in order to provide you the best services, be timely '
                        'responsive and improve our sites. We also aim to provide you a very user friendly experience.'
                        'By Using and providing data to hireme.mu, you are thereby consenting that we can use your information '
                        'in these ways to:'
                        'Create a profile'
                        'Add data collected from third parties'
                        'Provide personalised, targeted contents, services and advertising from us and third parties'
                        'Adding information collected from other public sources to your profile'
                        'Allowing you to connect/invite other users to visit and use our website'
                        'make payments/purchases'
                        'keep you updated about any new improvement to the sites, promotions, '
                        'newsletters, career advice and service related communications'
                        'Important security updates conducted and applicable'
                        'Informing you of events from us or affiliates using or providing us a service'
                        'Enable you and us to contact each other'
                        'Conduct contests, surveys and publishing of results thereof'
                        'Facilitate others to contact you'
                        'Provide your information to employers/customers'
                        'Send you replies/messages from employers in relation to your resume or profile'
                        'Provide services to employer to make the recruitment process a success'
                        'Generate internal reports'
                        'Provide government any reports asked containing your details or participation upon request'
                        'Let you share jobs and profile information with your connections'
                        'Allow search engines to get information publicly'
                        'Check, investigate and prevent fraud or any illegal activities or impersonation that violates our policies'
                        'Some of our services and products may enable third parties to get your personal '
                        'details and contact you.  Any information that you post publicly on hireme.mu may '
                        'be accessible/stored by others around the world.'
                        'We take maximum care to protect your data from any unauthorised party and prevent '
                        'them from using them in a wrong way. However, we do not have control over third parties '
                        'and thus not responsible for any use of your information that they take from us or you give us'
                        'Our main aim is to provide a display service of products, adverts and contents regarding or '
                        'matching your career expectation and interest online. Your information is being used to '
                        'crosscheck if you are interested in our products and services or services of a third party. '
                        'We bring to you adverts online that may interest you'
                        'Ways We Share Information'
                        'Hireme.mu gives you a place to show cast your information to increase your career prospects. '
                        'Any information shared with us may be shared to our affiliates across the world. Like Facebook '
                        'or LinkedIn. Rest assured that your information is not being shared with third parties for '
                        'marketing purposes till and until you give us the right to do so.'
                        'We can share your data with other third parties who in had may decide to provide you our '
                        'services through them. They will have full access to your personal information in order to '
                        'deliver their task to their best ability. However, they will not be able to use any such'
                        'collected data for other activities other than ours. We shall be responsible in case so happens'
                        'Upon you consent we may provide third parties your information'
                        'We remain at the disposal of our local government authorities to provide any details about you '
                        'in good faith or if there is a suspicion of fraud, crime or public safety'
                        'Any mergers or partners will automatically receive your data and but still remains under the privacy policy. '),
                    new Text('Cookies and Online Advertising',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Cookies:',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Hireme.mu makes use of cookies or other technologies to determine trends, administer websites, '
                        'track user movement on our website and also gather other marketing similar information. Cookies help '
                        'in providing you a better user experiment and satisfaction. Using our website will require you to store '
                        'a cookie file on your device. They are harmless. You should always enable cookies from hireme.mu in '
                        'order to get the best experience while our website features'
                        'There may exist some of our cookies left on your device when you decide to leave us. These are security '
                        'cookies and will remain only for a period of 60 days. Poll cookies will be stores for around 90 days.'
                        'However any cookie related to adverts will exist and stored for a period of 2 years. You are free to '
                        'delete them at any point of time. Cookies from third parties may be stored on your device for a period '
                        'of 20 years unless you decide to delete them.'
                        'Hireme.mu tends to use web beacons and java Scripts. We may receive an email confirmation when '
                        'you open our emails sent to you. We also make use of flash cookies which is also known as Local '
                        'Shared Objects, to protect video setting.'),
                    new Text(' Social media policy',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Hireme.mu is connected to different social media sites such as LinkedIn and Facebook. Feature'
                        ' like ’likes’, ‘share’ buttons are linked to our privacy policy and of the company providing the service.'),
                    new Text('About Your Resume',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('When you create or post your resume through us, we in hand store them in our server/database. '
                        'You can control this status at any point of time by logging your account or by talking to us directly. '
                        'Note that companies affiliated with us will be able to access your resume only if they have a valid contract'
                        ' with us. You may use such resumes to apply for jobs on our website and this will be viewed by us and the '
                        'employer. The latter may also keep a copy of it.'
                        'Any details about a reference will be under your responsibility. That is hireme.mu will automatically assume'
                        'that you have taken his or her consent before putting it in your hireme.mu profile.'
                        'Your Resume or profile will grant us access to the followings for example:'
                        'Origin,'
                        'Political beliefs,'
                        'Religion,'
                        'Any union forming part of,'
                        'Biometric details,'
                        'ID Number,'
                        'Passport number,'
                        'Criminal records,'
                        'Educational records,'
                        'Telephone numbers,'
                        'Addresses,'
                        'Other important details/data,'
                        'We do not control third party access to such information from our database.'),
                    new Text('Your Personal Information',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('We always thieve to make this career journey successful for you. Hence, '
                        'we keep all information you provide us to such as long as your account is active. '
                        'This is also used to resolve any disputes that may arise and also to strengthen our '
                        'agreements. You can at any point of time access, review, correct, update, and change '
                        'or delete your resume or profile by signing in your account. Should you find someone '
                        'has impersonated your account or name, you should contact us as soon as possible so '
                        'that we can take the appropriate steps. Hireme.mu admin can also access and make '
                        'changes to your account as long as you have consented to it. However, JOB-SHOP '
                        'can also deny you access or possibility of updating your account if they find it illegal.'),
                    new Text('Security',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('You are responsible for username and password'
                        'We believe that your details security is vital. '
                        'We try our best so safeguard your data that you give us'),
                    new Text('AGE',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('You are not allowed to use our website if you are under the age of 16. We are not responsible '
                        'for any information that we collect unknowingly due to impersonations. Internet is a vast '
                        'open platform and people are constantly trying to hack things. We try our best to protect you '
                        'and your information.'),
                    new Text('Changes',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('We can modify this policy with immediate effect to improve our practices. However, any '
                        'changes made will be sent to you by email provided or via your account.'),
                    new Text('The Security Hub',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Hireme.mu tries at all times to provide you the best user experience while using our '
                        'website to find a job. In order to better help you, we always ask you to disregard any '
                        'emails that you may receive via non hireme.mu emails. Any person who tries to do so violates '
                        'our terms and conditions and may be liable under the Mauritian Law Judicial System.'
                        'However there exist many types of scams nowadays. We try our level best to protect you from '
                        'them but we are not totally able to do it.'),
                    new Text('HOW WE PROTECT YOU AND HOW TO PROTECT YOURSELF-',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Safe Search',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Steps to take into consideration:'
                        'Resume Security'
                        'Scam: Money Laundering & Reshipping'
                        'Scam: Work At Home Jobs'
                        'Scam: Car Wrapping'
                        'Protect your information at all times'),
                    new Text('Identity Protection',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Identity protection is mandatory nowadays as there are loads of ways to steal your identity information.'
                        'Email scams and phishing'
                        'Computer threats and Malware'
                        'Victim of identity theft'
                        'Awareness and precautions'
                        'Cyber-crime unit'),
                    new Text('Maintain Your Privacy',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Manage your privacy online well'
                        'privacy setting to be read at all times'
                        'Move safely online'
                        'Cookies and web beacons'
                        'Manage your information'),
                    new Text('Detected a Fraud activity?',style: TextStyle(fontWeight: FontWeight.bold)),
                    new Text('Should you find any suspicious fraud or activity on hireme.mu, you are requested '
                        'to contact us as soon as possible and we will help you with it. It is also advisable '
                        'to report any such activity to the cyber-crime unit and police of Mauritius immediately.'),


                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}


