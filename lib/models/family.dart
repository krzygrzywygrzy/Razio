class Family {
  String familyId,
      familyName,
      psyId,
      psychologistNames,
      usrId,
      userNames,
      invitationCode;

  Family(this.familyId, this.familyName, this.psyId, this.psychologistNames,
      this.usrId, this.userNames, this.invitationCode);

  Family.fromJson(Map<String, dynamic> json)
      : familyId = json['familyId'],
        familyName = json['familyName'],
        psyId = json['psyId'],
        psychologistNames = json["psychologistNames"],
        usrId = json['usrId'],
        userNames = json['userNames'],
        invitationCode = json['invitationCode'];
}
