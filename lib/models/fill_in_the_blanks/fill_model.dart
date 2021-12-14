class ActivityModel {
  String id;
  String type;
  String subType;
  List<int> ageLevel;
  String name;
  String coverPageImg;
  String question;
  List<String> options;
  String answer;
  String qaAudioUrl;
  List<String> knowledgeId;
  String language;
  String syllabusClass;
  String school;
  String region;
  String subject;
  int duration;
  String title;
  String tags;
  double fileSize;
  CoverPageImageData coverPageImageData;
  dynamic imageData;
  dynamic urlParams;
  dynamic game;
  dynamic url;
  String coverPageImgBase64;
  dynamic imageBase64;
  String answerBase64;
  dynamic audioBase64;
  dynamic musicBase64;
  dynamic wordAudioBase64;
  String qaAudioUrlBase64;
  dynamic rhymeBgImageBase64;
  dynamic rhymeAudioUrlBase64;
  List<dynamic> rhymeImagesBase64;
  List<dynamic> elements;
  List<dynamic> pages;

  ActivityModel({
    required this.id,
    required this.type,
    required this.subType,
    required this.ageLevel,
    required this.name,
    required this.coverPageImg,
    required this.question,
    required this.options,
    required this.answer,
    required this.qaAudioUrl,
    required this.knowledgeId,
    required this.language,
    required this.syllabusClass,
    required this.school,
    required this.region,
    required this.subject,
    required this.duration,
    required this.title,
    required this.tags,
    required this.fileSize,
    required this.coverPageImageData,
    this.imageData,
    this.urlParams,
    this.game,
    this.url,
    required this.coverPageImgBase64,
    this.imageBase64,
    required this.answerBase64,
    this.audioBase64,
    this.musicBase64,
    this.wordAudioBase64,
    required this.qaAudioUrlBase64,
    this.rhymeBgImageBase64,
    this.rhymeAudioUrlBase64,
    required this.rhymeImagesBase64,
    required this.elements,
    required this.pages,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json["_id"],
        type: json["type"],
        subType: json["sub_type"],
        ageLevel: List<int>.from(json["age_level"].map((x) => x)),
        name: json["name"],
        coverPageImg: json["cover_page_img"],
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        answer: json["answer"],
        qaAudioUrl: json["qa_audio_url"],
        knowledgeId: List<String>.from(json["knowledge_id"].map((x) => x)),
        language: json["language"],
        syllabusClass: json["syllabus_class"],
        school: json["school"],
        region: json["region"],
        subject: json["subject"],
        duration: json["duration"],
        title: json["title"],
        tags: json["tags"],
        fileSize: json["file_size"].toDouble(),
        coverPageImageData:
            CoverPageImageData.fromJson(json["cover_page_image_data"]),
        imageData: json["image_data"],
        urlParams: json["url_params"],
        game: json["game"],
        url: json["url"],
        coverPageImgBase64: json["cover_page_img_base64"],
        imageBase64: json["image_base64"],
        answerBase64: json["answer_base64"],
        audioBase64: json["audio_base64"],
        musicBase64: json["music_base64"],
        wordAudioBase64: json["word_audio_base64"],
        qaAudioUrlBase64: json["qa_audio_url_base64"],
        rhymeBgImageBase64: json["rhyme_bg_image_base64"],
        rhymeAudioUrlBase64: json["rhyme_audio_url_base64"],
        rhymeImagesBase64:
            List<dynamic>.from(json["rhyme_images_base64"].map((x) => x)),
        elements: List<dynamic>.from(json["elements"].map((x) => x)),
        pages: List<dynamic>.from(json["pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "sub_type": subType,
        "age_level": List<dynamic>.from(ageLevel.map((x) => x)),
        "name": name,
        "cover_page_img": coverPageImg,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "answer": answer,
        "qa_audio_url": qaAudioUrl,
        "knowledge_id": List<dynamic>.from(knowledgeId.map((x) => x)),
        "language": language,
        "syllabus_class": syllabusClass,
        "school": school,
        "region": region,
        "subject": subject,
        "duration": duration,
        "title": title,
        "tags": tags,
        "file_size": fileSize,
        "cover_page_image_data": coverPageImageData.toJson(),
        "image_data": imageData,
        "url_params": urlParams,
        "game": game,
        "url": url,
        "cover_page_img_base64": coverPageImgBase64,
        "image_base64": imageBase64,
        "answer_base64": answerBase64,
        "audio_base64": audioBase64,
        "music_base64": musicBase64,
        "word_audio_base64": wordAudioBase64,
        "qa_audio_url_base64": qaAudioUrlBase64,
        "rhyme_bg_image_base64": rhymeBgImageBase64,
        "rhyme_audio_url_base64": rhymeAudioUrlBase64,
        "rhyme_images_base64":
            List<dynamic>.from(rhymeImagesBase64.map((x) => x)),
        "elements": List<dynamic>.from(elements.map((x) => x)),
        "pages": List<dynamic>.from(pages.map((x) => x)),
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
