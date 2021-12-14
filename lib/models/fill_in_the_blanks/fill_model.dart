class FillModel {
  String id;
  String type;
  String subType;
  List<int> ageLevel;
  String name;
  String question;
  List<String> options;
  String answer;
  String qaAudioUrl;
  List<String> knowledgeId;
  String language;
  String subject;
  int duration;
  String title;
  double fileSize;
  CoverPageImageData coverPageImageData;
  String coverPageImgBase64;
  String answerBase64;
  String qaAudioUrlBase64;

  FillModel({
    required this.id,
    required this.type,
    required this.subType,
    required this.ageLevel,
    required this.name,
    required this.question,
    required this.options,
    required this.answer,
    required this.qaAudioUrl,
    required this.knowledgeId,
    required this.language,
    required this.subject,
    required this.duration,
    required this.title,
    required this.fileSize,
    required this.coverPageImageData,
    required this.coverPageImgBase64,
    required this.answerBase64,
    required this.qaAudioUrlBase64,
  });

  factory FillModel.fromJson(Map<String, dynamic> json) => FillModel(
        id: json["_id"],
        type: json["type"],
        subType: json["subType"],
        ageLevel: json["ageLevel"],
        name: json["name"],
        question: json["question"],
        options: json["options"],
        answer: json["answer"],
        qaAudioUrl: json["qaAudioUrl"],
        knowledgeId: json["knowledgeId"],
        language: json["language"],
        subject: json["subject"],
        duration: json["duration"],
        title: json["title"],
        fileSize: json["fileSize"],
        coverPageImageData: json["coverPageImageData"],
        coverPageImgBase64: json["coverPageImgBase64"],
        answerBase64: json["answerBase64"],
        qaAudioUrlBase64: json["qaAudioUrlBase64"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "sub_type": subType,
        "age_level": List<dynamic>.from(ageLevel.map((x) => x)),
        "name": name,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "answer": answer,
        "qa_audio_url": qaAudioUrl,
        "knowledge_id": List<dynamic>.from(knowledgeId.map((x) => x)),
        "language": language,
        "subject": subject,
        "duration": duration, //required this.coverPageImg,
        "title": title,
        "file_size": fileSize,
        "cover_page_image_data": coverPageImageData.toJson(),
        "cover_page_img_base64": coverPageImgBase64,
        "answer_base64": answerBase64,
        "qa_audio_url_base64": qaAudioUrlBase64,
      };
}

class CoverPageImageData {
  CoverPageImageData({
    required this.empty,
  });

  bool empty;

  factory CoverPageImageData.fromJson(Map<String, dynamic> json) =>
      CoverPageImageData(
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "empty": empty,
      };
}
