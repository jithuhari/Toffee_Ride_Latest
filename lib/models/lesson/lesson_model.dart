// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonModal {
  LessonModal({
    required this.id,
    required this.type,
    required this.name,
    required this.ageLevel,
    required this.coverPageImg,
    required this.language,
    required this.syllabusClass,
    required this.school,
    required this.region,
    required this.subject,
    required this.pages,
    required this.duration,
    required this.title,
    required this.subType,
    required this.tags,
    required this.fileSize,
    this.coverPageImageData,
    this.imageData,
    this.urlParams,
    this.answer,
    this.game,
    this.url,
    this.coverPageImgBase64,
    this.imageBase64,
    this.answerBase64,
    this.audioBase64,
    this.musicBase64,
    this.wordAudioBase64,
    this.qaAudioUrlBase64,
    this.rhymeBgImageBase64,
    this.rhymeAudioUrlBase64,
    required this.rhymeImagesBase64,
    required this.elements,
  });

  String id;
  String type;
  String name;
  List<int> ageLevel;
  String coverPageImg;
  String language;
  String syllabusClass;
  String school;
  String region;
  String subject;
  List<Page> pages;
  int duration;
  String title;
  String subType;
  String tags;
  double fileSize;
  dynamic coverPageImageData;
  dynamic imageData;
  dynamic urlParams;
  dynamic answer;
  dynamic game;
  dynamic url;
  dynamic coverPageImgBase64;
  dynamic imageBase64;
  dynamic answerBase64;
  dynamic audioBase64;
  dynamic musicBase64;
  dynamic wordAudioBase64;
  dynamic qaAudioUrlBase64;
  dynamic rhymeBgImageBase64;
  dynamic rhymeAudioUrlBase64;
  List<dynamic> rhymeImagesBase64;
  List<dynamic> elements;

  factory LessonModal.fromJson(Map<String, dynamic> json) => LessonModal(
        id: json["_id"],
        type: json["type"],
        name: json["name"],
        ageLevel: List<int>.from(json["age_level"].map((x) => x)),
        coverPageImg: json["cover_page_img"],
        language: json["language"],
        syllabusClass: json["syllabus_class"],
        school: json["school"],
        region: json["region"],
        subject: json["subject"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
        duration: json["duration"],
        title: json["title"],
        subType: json["sub_type"],
        tags: json["tags"],
        fileSize: json["file_size"].toDouble(),
        coverPageImageData: json["cover_page_image_data"],
        imageData: json["image_data"],
        urlParams: json["url_params"],
        answer: json["answer"],
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
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "name": name,
        "age_level": List<dynamic>.from(ageLevel.map((x) => x)),
        "cover_page_img": coverPageImg,
        "language": language,
        "syllabus_class": syllabusClass,
        "school": school,
        "region": region,
        "subject": subject,
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
        "duration": duration,
        "title": title,
        "sub_type": subType,
        "tags": tags,
        "file_size": fileSize,
        "cover_page_image_data": coverPageImageData,
        "image_data": imageData,
        "url_params": urlParams,
        "answer": answer,
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
      };
}

class Page {
  Page({
    required this.text,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.audio,
    required this.audioDuration,
    required this.sequence,
    required this.imageArrayBase64,
    required this.audioBase64,
  });

  String text;
  String image1;
  String image2;
  String image3;
  String audio;
  String audioDuration;
  String sequence;
  List<String> imageArrayBase64;
  String audioBase64;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        text: json["text"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        audio: json["audio"],
        audioDuration: json["audio_duration"],
        sequence: json["sequence"],
        imageArrayBase64:
            List<String>.from(json["image_array_base64"].map((x) => x)),
        audioBase64: json["audio_base64"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "audio": audio,
        "audio_duration": audioDuration,
        "sequence": sequence,
        "image_array_base64":
            List<dynamic>.from(imageArrayBase64.map((x) => x)),
        "audio_base64": audioBase64,
      };
}
