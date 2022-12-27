class URL {
  static String loginUrl = "/api/Auth/Login";

  static String workstepsUrl = "/api/ModuleTask/GetMobileList";
  static String workstepEdit = "/api/ModuleTask/MobileEdit";
  static String workstepGetMaterials = "/api/ModuleTask/GetModalSubTaskMaterials";

  static String workstepStopTask = "/api/ModuleTask/StopTask";
  static String workstepRedirectTaskPersonels = "/api/ModuleTask/RedirectTaskPersonels";

  static String workstepStartTask = "/api/ModuleTask/StartTask";
  static String workstepCompleteTask = "/api/ModuleTask/CompleteTask";
  static String workstepSubmitTaskForApproval = "/api/ModuleTask/SubmitTaskForApproval";
  static String workstepApproveTask = "/api/ModuleTask/ApproveTask";
  static String workstepRejectTask = "/api/ModuleTask/RejectTask";

  static String workstepGet = "/api/ModuleTask/GetView";
  static String workstepAddFiletoModules = "/api/ModuleTask/SaveTaskFile";

  static String getPersonnelByContactId = "/api/ContactPerson/GetPersonnelByContactId";
  
  //drive urls do not touch
  static String driveGetToken = "/api/DriveAuthentication/GetApiAccessInformations/1";
  static String driveGetFile = "/api/files/GetFiles";
  static String driveDeleteFile = "/api/files/DeleteFile";
  static String driveUploadFile = "/api/files/UploadFile";

  static String driveCreateFolder = "/api/folders/CreateFolder";
}
