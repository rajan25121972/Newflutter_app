class ExpenseData {
  int PkId;
  String V_StartDate;
  String V_EndDate;
  int V_NoOfDays;
  String V_ExpSubcategory;
  String V_ExpDescr;
  String V_Share;
  String V_ShareWith;
  String V_ToCity;
  String V_LimitAmount;
  double V_Amount;
  String V_Remarks;
  String V_ExpPurpose;
  String V_ExpPurposeDesc;
  String V_CostCenter;


  String V_FromCity;
  String V_TravelMode;
  String V_TravelType;
  String V_Carrier;
  String V_FlightTrainNo;
  //String V_CrdtcrdXml;
  String V_LocationClassificationAppl;
  String V_TrvModeApp;
  String V_LimitApp;
  // String V_TablelimitAmt;
  String V_LimiRes;
  String V_TrvModeSequence;
  String V_hdnConveyance;
  String V_hdnActualLimAmt;
  String V_hdnScanAttach;
  String V_hdnMobDoc;
  String V_PolicyApp;
  String V_CarrieCode;
  String V_UnsettleADvFlg;
  String V_LodgingAlert;
  String V_ShareAppl;
  String V_ProductCode;
  String V_CarrierTrvType;

  ExpenseData(
      this.PkId,
      this.V_StartDate,
      this.V_EndDate,
      this.V_NoOfDays,
      this.V_ExpSubcategory,
      this.V_ExpDescr,
      this.V_Share,
      this.V_ShareWith,
      this.V_ToCity,
      this.V_LimitAmount,
      this.V_Amount,
      this.V_Remarks,
      this.V_ExpPurpose,
      this.V_ExpPurposeDesc,
      this.V_CostCenter,
      this.V_FromCity,
      this.V_TravelMode,
      this.V_TravelType,
      this.V_Carrier,
      this.V_FlightTrainNo,
      this.V_LocationClassificationAppl,
      this.V_TrvModeApp,
      this.V_LimitApp,
      this.V_LimiRes,
      this.V_TrvModeSequence,
      this.V_hdnConveyance,
      this.V_hdnActualLimAmt,
      this.V_hdnScanAttach,
      this.V_hdnMobDoc,
      this.V_PolicyApp,
      this.V_CarrieCode,
      this.V_UnsettleADvFlg,
      this.V_LodgingAlert,
      this.V_ShareAppl,
      this.V_ProductCode,
      this.V_CarrierTrvType);

  @override
  String toString() {}
}
