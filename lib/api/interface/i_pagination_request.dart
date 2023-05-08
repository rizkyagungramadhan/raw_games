abstract class IPaginationRequest {

  int page;

  int pageSize;

  IPaginationRequest(this.page, this.pageSize);

  Map<String, dynamic> toJson() => throw UnimplementedError();
}