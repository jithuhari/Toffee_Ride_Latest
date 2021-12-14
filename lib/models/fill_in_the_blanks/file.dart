// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//   Welcome({
//     this.success,
//     this.data,
//   });

//   bool success;
//   Data data;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.items,
//   });

//   List<Item> items;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//       };
// }

// class Item {
//   Item({
//     this.id,
//     this.type,
//     this.subType,
//     this.ageLevel,
//     this.name,
//     this.coverPageImg,
//     this.question,
//     this.options,
//     this.answer,
//     this.qaAudioUrl,
//     this.knowledgeId,
//     this.language,
//     this.syllabusClass,
//     this.school,
//     this.region,
//     this.subject,
//     this.duration,
//     this.title,
//     this.tags,
//     this.fileSize,
//     this.coverPageImageData,
//     this.imageData,
//     this.urlParams,
//     this.game,
//     this.url,
//     this.coverPageImgBase64,
//     this.imageBase64,
//     this.answerBase64,
//     this.audioBase64,
//     this.musicBase64,
//     this.wordAudioBase64,
//     this.qaAudioUrlBase64,
//     this.rhymeBgImageBase64,
//     this.rhymeAudioUrlBase64,
//     this.rhymeImagesBase64,
//     this.elements,
//     this.pages,
//   });

//   String id;
//   String type;
//   String subType;
//   List<int> ageLevel;
//   String name;
//   String coverPageImg;
//   String question;
//   List<String> options;
//   String answer;
//   String qaAudioUrl;
//   List<String> knowledgeId;
//   String language;
//   String syllabusClass;
//   String school;
//   String region;
//   String subject;
//   int duration;
//   String title;
//   String tags;
//   double fileSize;
//   CoverPageImageData coverPageImageData;
//   dynamic imageData;
//   dynamic urlParams;
//   dynamic game;
//   dynamic url;
//   String coverPageImgBase64;
//   dynamic imageBase64;
//   String answerBase64;
//   dynamic audioBase64;
//   dynamic musicBase64;
//   dynamic wordAudioBase64;
//   String qaAudioUrlBase64;
//   dynamic rhymeBgImageBase64;
//   dynamic rhymeAudioUrlBase64;
//   List<dynamic> rhymeImagesBase64;
//   List<dynamic> elements;
//   List<dynamic> pages;

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["_id"],
//         type: json["type"],
//         subType: json["sub_type"],
//         ageLevel: List<int>.from(json["age_level"].map((x) => x)),
//         name: json["name"],
//         coverPageImg: json["cover_page_img"],
//         question: json["question"],
//         options: List<String>.from(json["options"].map((x) => x)),
//         answer: json["answer"],
//         qaAudioUrl: json["qa_audio_url"],
//         knowledgeId: List<String>.from(json["knowledge_id"].map((x) => x)),
//         language: json["language"],
//         syllabusClass: json["syllabus_class"],
//         school: json["school"],
//         region: json["region"],
//         subject: json["subject"],
//         duration: json["duration"],
//         title: json["title"],
//         tags: json["tags"],
//         fileSize: json["file_size"].toDouble(),
//         coverPageImageData:
//             CoverPageImageData.fromJson(json["cover_page_image_data"]),
//         imageData: json["image_data"],
//         urlParams: json["url_params"],
//         game: json["game"],
//         url: json["url"],
//         coverPageImgBase64: json["cover_page_img_base64"],
//         imageBase64: json["image_base64"],
//         answerBase64: json["answer_base64"],
//         audioBase64: json["audio_base64"],
//         musicBase64: json["music_base64"],
//         wordAudioBase64: json["word_audio_base64"],
//         qaAudioUrlBase64: json["qa_audio_url_base64"],
//         rhymeBgImageBase64: json["rhyme_bg_image_base64"],
//         rhymeAudioUrlBase64: json["rhyme_audio_url_base64"],
//         rhymeImagesBase64:
//             List<dynamic>.from(json["rhyme_images_base64"].map((x) => x)),
//         elements: List<dynamic>.from(json["elements"].map((x) => x)),
//         pages: List<dynamic>.from(json["pages"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "type": type,
//         "sub_type": subType,
//         "age_level": List<dynamic>.from(ageLevel.map((x) => x)),
//         "name": name,
//         "cover_page_img": coverPageImg,
//         "question": question,
//         "options": List<dynamic>.from(options.map((x) => x)),
//         "answer": answer,
//         "qa_audio_url": qaAudioUrl,
//         "knowledge_id": List<dynamic>.from(knowledgeId.map((x) => x)),
//         "language": language,
//         "syllabus_class": syllabusClass,
//         "school": school,
//         "region": region,
//         "subject": subject,
//         "duration": duration, //required this.coverPageImg,
//         "title": title,
//         "tags": tags,
//         "file_size": fileSize,
//         "cover_page_image_data": coverPageImageData.toJson(),
//         "image_data": imageData,
//         "url_params": urlParams,
//         "game": game,
//         "url": url,
//         "cover_page_img_base64": coverPageImgBase64,
//         "image_base64": imageBase64,
//         "answer_base64": answerBase64,
//         "audio_base64": audioBase64,
//         "music_base64": musicBase64,
//         "word_audio_base64": wordAudioBase64,
//         "qa_audio_url_base64": qaAudioUrlBase64,
//         "rhyme_bg_image_base64": rhymeBgImageBase64,
//         "rhyme_audio_url_base64": rhymeAudioUrlBase64,
//         "rhyme_images_base64":
//             List<dynamic>.from(rhymeImagesBase64.map((x) => x)),
//         "elements": List<dynamic>.from(elements.map((x) => x)),
//         "pages": List<dynamic>.from(pages.map((x) => x)),
//       };
// }

// class CoverPageImageData {
//   CoverPageImageData({
//     this.empty,
//   });

//   bool empty;

//   factory CoverPageImageData.fromJson(Map<String, dynamic> json) =>
//       CoverPageImageData(
//         empty: json["empty"],
//       );

//   Map<String, dynamic> toJson() => {
//         "empty": empty,
//       };
// }
