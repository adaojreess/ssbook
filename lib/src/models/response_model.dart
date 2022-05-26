class ResponseModel<T> {
  T? response;
  ResponseModel({T? response}) {
    assert(response != null);
    this.response = response;
  }
}
