class Constants{
  static final String baseUrl = "https://arcane-eyrie-98677.herokuapp.com";
  static final String loginProvider = baseUrl+"/login_employer/login_employer";
  static final String loginSeeker = baseUrl+"/login_jobseeker/login_jobseeker";
  static final String signUpProvider = baseUrl+"/reg_employer/addemployer";
  static final String signUpSeeker = baseUrl+"/reg_jobseeker/addjobseeker";
  static final String providerProfile = baseUrl+"/employer_profile/view_profile";
  static final String seekerProfile = baseUrl+"/jobseeker_profile/view_profile";
  static final String seekerUpdateProfile = baseUrl+"/reg_jobseeker/edit:id";
  static final String providerUpdateProfile = baseUrl+"/reg_employer/edit";
  static final String addJobs = baseUrl+"/jobs/addjob";
  static final String viewJobs = baseUrl+"/jobs/view";
  static final String viewJobDetails = baseUrl+"/jobs/view_job_details";
  static final String getOtp = baseUrl+"/login_employer/forgot_password";
  static final String checkOtp = baseUrl+"/login_employer/check_otp";
  static final String viewApplicants = baseUrl+"/applications/view_applicants";


  // SESSION PARAMETER

  static final String loginStatus="LOGIN_STATUS";
  static final String loginType="LOGIN_TYPE";
  static final String userId="USER_ID";
  static final String jobId="JOB_ID";
  static final String email="Registered Email";

}