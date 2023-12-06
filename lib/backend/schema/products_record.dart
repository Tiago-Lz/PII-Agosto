import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nomedescricao" field.
  String? _nomedescricao;
  String get nomedescricao => _nomedescricao ?? '';
  bool hasNomedescricao() => _nomedescricao != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  void _initializeFields() {
    _nomedescricao = snapshotData['nomedescricao'] as String?;
    _preco = castToType<double>(snapshotData['preco']);
    _imagem = snapshotData['imagem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? nomedescricao,
  double? preco,
  String? imagem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomedescricao': nomedescricao,
      'preco': preco,
      'imagem': imagem,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.nomedescricao == e2?.nomedescricao &&
        e1?.preco == e2?.preco &&
        e1?.imagem == e2?.imagem;
  }

  @override
  int hash(ProductsRecord? e) =>
      const ListEquality().hash([e?.nomedescricao, e?.preco, e?.imagem]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
