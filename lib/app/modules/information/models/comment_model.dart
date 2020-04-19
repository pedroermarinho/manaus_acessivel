class CommentModel {
  String idComment;
  String idUser;
  String idMarker;
  String comment;
  DateTime dateTime;

  CommentModel({
    this.idComment,
    this.idUser,
    this.idMarker,
    this.comment,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUser": idUser,
      "idMarker": idMarker,
      "comment": comment,
      "dateTime": dateTime
    };
    return map;
  }
}
