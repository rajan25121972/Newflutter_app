
class Exp_SubCategory_help {
  final String SubCategory;
  final String ExpSubCategoryDescr;
  final String hdnLocationClassificationAppl;
  final String hdnTravelmodeApp;
  final String hdnLimitAmt;
  final String hdnShareAppl;
  final String hdnLimitAppl;
  final String hdnlimiRes;
  final String hdnScanAttached;
  final String hdnMobDoc;
  final String hdnPolicyApp;


  Exp_SubCategory_help({this.SubCategory, this.ExpSubCategoryDescr,
    this.hdnLocationClassificationAppl, this.hdnTravelmodeApp,
    this.hdnLimitAmt, this.hdnShareAppl, this.hdnLimitAppl, this.hdnlimiRes,
    this.hdnScanAttached, this.hdnMobDoc,
    this.hdnPolicyApp}); //Exp_SubCategory_help({this.username, this.password});

  factory Exp_SubCategory_help.fromJson(Map<String, dynamic> json)
  {
    print("data availbale");
    print(json['Table0']);


    return Exp_SubCategory_help(
        SubCategory: json['COL0'].toString(),
        ExpSubCategoryDescr: json['COL1'].toString()

    );
  }


}
