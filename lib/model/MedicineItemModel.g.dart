// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MedicineItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineItemModel _$MedicineItemModelFromJson(Map<String, dynamic> json) {
  return MedicineItemModel(
      json['productCode'] as int,
      json['mainProductCode'] as int,
      json['productName'] as String,
      json['classCode'] as String,
      json['commonTitle'] as String,
      json['unit'] as String,
      json['manufacturer'] as String,
      json['packing'] as String,
      json['productStatusType'] as int,
      json['purchasePrice'] as int,
      json['marketPrice'] as int,
      json['ourPrice'] as int,
      json['img100'] as String,
      json['img180'] as String,
      json['img320'] as String,
      json['mobilephoneUrl'] as String,
      json['prescriptionType'] as int,
      json['dosage'] as String,
      json['merchantManageCode'] as String,
      json['priceCommission'] as int);
}

Map<String, dynamic> _$MedicineItemModelToJson(MedicineItemModel instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'mainProductCode': instance.mainProductCode,
      'productName': instance.productName,
      'classCode': instance.classCode,
      'commonTitle': instance.commonTitle,
      'unit': instance.unit,
      'manufacturer': instance.manufacturer,
      'packing': instance.packing,
      'productStatusType': instance.productStatusType,
      'purchasePrice': instance.purchasePrice,
      'marketPrice': instance.marketPrice,
      'ourPrice': instance.ourPrice,
      'img100': instance.img100,
      'img180': instance.img180,
      'img320': instance.img320,
      'mobilephoneUrl': instance.mobilephoneUrl,
      'prescriptionType': instance.prescriptionType,
      'dosage': instance.dosage,
      'merchantManageCode': instance.merchantManageCode,
      'priceCommission': instance.priceCommission
    };
