class ApiConfigs {
  ApiConfigs._();

  // base url
  static String baseUrlTest = 'https://apitest.quanlysan.vn';
  static String baseUrl = 'https://api.quanlysan.vn';

  // Booking auth
  static const String login = '/api/BookingUser/Login';
  static const String googleLogin = '/api/BookingUser/ProcessGoogleLogin';
  static const String icloudLogin = '/api/BookingUser/ICloudLogin';
  static const String logout = '/api/User/Logout';
  static const String addLogUserLogin = '/api/User/AddLogUserLogin';
  static const String register = '/api/BookingUser/Register';
  static const String verifyAccountBookingRegister =
      '/api/BookingUser/VerifyAccountBookingRegister';
  static const String lockAccount = '/api/BookingUser/LockMyAccount';

  // home
  static const String bookingFieldSport =
      '/api/BookingFieldSport/GetBookingFieldSport'; // ds san
  static const String likeOrDislikeShop =
      '/api/BookingContract/AccountBookingLikeOrDisLikeShop';

  // User
  static const String checkUsernameExist =
      '/api/BookingUser/CheckExistUsername';
  static const String getAccountInfo = '/api/BookingUser/GetMyUserBookingInfor';
  static const String editAccountInfo =
      '/api/BookingUser/EditAccountBoookingInfor';
  static const String forgotPassword = '/api/BookingUser/ForgotPassword';
  static const String changePassword = '/api/BookingUser/ChangePassword';
  static const String addReview = '/api/BookingUser/UserFeedBack';

  // Price
  static const String getAllPriceObject =
      '/api/Price/GetAllPriceRenterOptional';

  // Schedule
  static const String getAllSchedule = '/api/Price/GetScheduleView';
  static const String addContractSchedule =
      '/api/BookingContract/VisitorAddContractSchedule';
  static const String getInfoPaymentContractCustomer =
      '/api/BookingContract/GetInfoPaymentContract'; // thong tin thanh toan don ngay
  static const String visitorAddDepositContractSchedule =
      '/api/ContractVisitor/VisitorAddDepositContractSchedule'; // Cung cấp chứng từ đặt cọc đơn ngày

  // xé vé
  static const String getContractEventByShopID =
      '/api/BookingContract/GetContractEventByShopID'; // ds su kien xe ve cua 1 san
  static const String getInfoPaymentContractEventCustomer =
      '/api/BookingContract/GetInfoPaymentContractEventCustomer'; // thong tin thanh toan xe ve cua san

  static const String registerContractEvent =
      '/api/BookingContract/RegisterContractEvent'; // dki xe ve cua san

  // payment
  static const String getUpdateDocumentDepositContractEventCustomer =
      '/api/BookingContract/UpdateDocumentDepositContractEventCustomer'; // tải lên chứng từ chuyển khoản xé vé

  // chung
  static const String uploadImage = '/api/BookingUpload/UploadImage';
  static const String getCities = '/api/City/GetCities';
  static const String getDistricts = '/api/District/GetDistrictByCityID';

  // thong tin san
  static const String getDetailShopByBookingLink =
      '/api/BookingContract/GetDetailShopByBookingLink';
  static const String getContractVisitorSchedule =
      '/api/BookingContract/GetContractVisitorSchedule';
  static const String getContractVisitorScheduleWithoutLogin =
      '/api/BookingContract/GetContractVisitorScheduleWithoutLogin';
  static const String getReviewByShop = '/api/BookingFieldSport/GetByShop';
  static const String getListServiceProductFieldDetails =
      '/api/BookingService/GetListServiceProductRetails';
  static const String getContractEventCustomerDetail =
      '/api/BookingContract/GetContractEventCustomerDetail';
  static const String getContractScheduleInfo =
      '/api/BookingContract/GetContractScheduleInfo';

  static const String rejectContractEventByCustomer =
      '/api/BookingContract/RejectContractEventByCustomer';
  static const String cancelContractByCustomer =
      '/api/BookingContract/CancelContractByCustomer';
  static const String addReviewShop = '/api/BookingFieldSport/AddReviewShop';

  // thong bao
  static const String getListNotify = '/api/BookingUser/GetNotifySent';
  static const String getMarkAsReadNoti = '/api/BookingUser/MarkAsReadNoti';
}
