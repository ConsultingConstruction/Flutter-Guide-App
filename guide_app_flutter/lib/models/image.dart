class Image {
	int? id;
	int? toolId;
	int? descriptionId;
	String? imageByteData;

	Image({this.id, this.toolId, this.descriptionId, this.imageByteData});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				id: json['id'] as int?,
				toolId: json['toolId'] as int?,
				descriptionId: json['descriptionId'] as int?,
				imageByteData: json['imageByteData'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'toolId': toolId,
				'descriptionId': descriptionId,
				'imageByteData': imageByteData,
			};
}
