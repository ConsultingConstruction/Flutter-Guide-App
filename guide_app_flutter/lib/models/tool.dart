import 'extra_description.dart';
import 'image.dart';

class Tool {
	int? id;
	int? guideId;
	String? iconByteData;
	String? toolName;
	String? steps;
	String? description;
	List<Image>? images;
	List<ExtraDescription>? extraDescriptions;

	Tool({
		this.id, 
		this.guideId, 
		this.iconByteData, 
		this.toolName, 
		this.steps, 
		this.description, 
		this.images, 
		this.extraDescriptions, 
	});

	factory Tool.fromJson(Map<String, dynamic> json) => Tool(
				id: json['id'] as int?,
				guideId: json['guideId'] as int?,
				iconByteData: json['iconByteData'] as String?,
				toolName: json['toolName'] as String?,
				steps: json['steps'] as String?,
				description: json['description'] as String?,
				images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
				extraDescriptions: (json['extraDescriptions'] as List<dynamic>?)
						?.map((e) => ExtraDescription.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'guideId': guideId,
				'iconByteData': iconByteData,
				'toolName': toolName,
				'steps': steps,
				'description': description,
				'images': images?.map((e) => e.toJson()).toList(),
				'extraDescriptions': extraDescriptions?.map((e) => e.toJson()).toList(),
			};
}
