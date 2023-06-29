
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModdel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModdel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModdel.fromJsonMap(Map<String, dynamic> json) => YesNoModdel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', 
      fromWho: FromWho.hers,
      imageUrl: image
    );
}