// import 'application_info.dart';

// class ApplicationSaver {

//   late ApplicationInfo _applicationInfo;

//   Map<String, dynamic> get data => this._applicationInfo.toJson();
//   Map<String, dynamic> get clientData =>
//       this._applicationInfo.clientInfo.toJson();

//   ApplicationSaver(

//   ) {
//     _applicationInfo = ApplicationInfo(
//         DependantsStore.instance._dependants,
//          ClientDataSaver.instance._clientInfo,);

//   }
//   bool get hasDependants =>  DependantsStore.instance.hasData;
// }

// class ClientDataSaver {
//   ClientDataSaver._();
//   static final instance = ClientDataSaver._();
//   ClientData _clientInfo = ClientData();
//   ClientData get clientInfo => this._clientInfo;

//    name(String name) => _clientInfo.name=name;
//    address(String address) => _clientInfo.address=address;
//    company(String company) => _clientInfo.company=company;
//    dateOfBirth(String dateOfBirth) => _clientInfo.dateOfBirth=dateOfBirth;
//    email(String email) => _clientInfo.email=email;
//    gender(String gender) => _clientInfo.gender=gender;
//    phonenumber(String phonenumber) => _clientInfo.phoneNumber=phonenumber;
// }

// class DependantsStore {
//   DependantsStore._();
//   static final instance = DependantsStore._();
//   bool get hasData => _dependants.isNotEmpty;
//   var _dependants = <DependantInfo>[];
//   List<DependantInfo> get dependants => this._dependants;

//   void addToDependants(DependantInfo dependant) {
//     _dependants.add(dependant);
//   }
// }

// class DependantSaver {
//   var _dependant = DependantInfo();
//   DependantInfo get dependant => _dependant;
//    name(String name) => _dependant.name = name;
//    gender(String gender) => _dependant.gender = gender;
//    dateOfBirth(String dateOfBirth) => _dependant.dateOfBirth = dateOfBirth;
//   bool get _hasName => _dependant.name != null;
//   bool get _hasGender => _dependant.gender != null;
//   bool get _hasDateOfBirth => _dependant.dateOfBirth != null;

//   bool get _isReady => _hasName && _hasGender && _hasDateOfBirth;
//   void save(DependantsStore store) {
//     if (_isReady) {
//       store.addToDependants(dependant);
//       _dependant = DependantInfo();
//     }
//   }
// }
