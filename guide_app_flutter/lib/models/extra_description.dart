import 'image.dart';

class ExtraDescription {
	int? id;
	int? toolId;
	String? title;
	String? description;
	List<Image>? images;

	ExtraDescription({
		this.id, 
		this.toolId, 
		this.title, 
		this.description, 
		this.images, 
	});

	factory ExtraDescription.fromJson(Map<String, dynamic> json) {
		return ExtraDescription(
			id: json['id'] as int?,
			toolId: json['toolId'] as int?,
			title: json['title'] as String?,
			description: json['description'] as String?,
			images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}

	Map<String, dynamic> toJson() => {
				'id': id,
				'toolId': toolId,
				'title': title,
				'description': description,
				'images': images?.map((e) => e.toJson()).toList(),
			};
}
