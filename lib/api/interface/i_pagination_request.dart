abstract class IPaginationRequest {

  final int page;

  final int pageSize;

  IPaginationRequest(this.page, this.pageSize);

  Map<String, dynamic> toJson() => throw UnimplementedError();
}