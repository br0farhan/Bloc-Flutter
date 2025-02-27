class ContactPatternModel {
  String _contactName;
  String _contactImageUrl;
  String _contactStatus;

  ContactPatternModel(
      this._contactName, this._contactImageUrl, this._contactStatus);

  set contactName(String contactName) {
    _contactName = contactName;
  }

  set contactImageUrl(String contactImageUrl) {
    _contactImageUrl = contactImageUrl;
  }

  set contactStatus(String contactStatus) {
    _contactStatus = contactStatus;
  }

  // ignore: unnecessary_getters_setters
  String get contactName => _contactName;
  // ignore: unnecessary_getters_setters
  String get contactImageUrl => _contactImageUrl;
  // ignore: unnecessary_getters_setters
  String get contactStatus => _contactStatus;
}
