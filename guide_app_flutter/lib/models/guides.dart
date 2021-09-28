import 'guide.dart';

class Guides {
	List<Guide>? guides;

	Guides({this.guides});

	factory Guides.fromJson(Map<String, dynamic> json) => Guides(
				guides: (json['guides'] as List<dynamic>?)
						?.map((e) => Guide.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'guides': guides?.map((e) => e.toJson()).toList(),
			};
}
