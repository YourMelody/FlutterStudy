import 'package:json_annotation/json_annotation.dart';

// DrugClassModel.g.dart文件将在执行生成命令后自动产生
part "DrugClassModel.g.dart";

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class DrugClassModel {

	DrugClassModel(this.categoryCode, this.hasNode, this.categories, this.categoryName);

	String categoryCode;
	bool hasNode;
	List <DrugClassModel> categories;
	String categoryName;

	factory DrugClassModel.fromJson(Map<String, dynamic> json) => _$DrugClassModelFromJson(json);
	Map<String, dynamic> toJson() => _$DrugClassModelToJson(this);
}