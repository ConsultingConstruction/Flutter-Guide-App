class Guide {
	int? id;
	String? guideName;
	String? iconByteData;

	Guide({this.id, this.guideName, this.iconByteData});

	factory Guide.fromJson(Map<String, dynamic> json) => Guide(
				id: json['id'] as int?,
				guideName: json['guideName'] as String?,
				iconByteData: json['iconByteData'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'guideName': guideName,
				'iconByteData': iconByteData,
			};
}
