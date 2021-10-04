import 'tool.dart';

class Tools {
	List<Tool>? tools;

	Tools({this.tools});

	factory Tools.fromJson(Map<String, dynamic> json) => Tools(
				tools: (json['tools'] as List<dynamic>?)
						?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'tools': tools?.map((e) => e.toJson()).toList(),
			};
}
