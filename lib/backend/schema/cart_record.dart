import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "quantidade" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  bool hasQuantidade() => _quantidade != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _imagem = snapshotData['imagem'] as String?;
    _preco = castToType<double>(snapshotData['preco']);
    _quantidade = castToType<double>(snapshotData['quantidade']);
    _nome = snapshotData['nome'] as String?;
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  String? imagem,
  double? preco,
  double? quantidade,
  String? nome,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagem': imagem,
      'preco': preco,
      'quantidade': quantidade,
      'nome': nome,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.imagem == e2?.imagem &&
        e1?.preco == e2?.preco &&
        e1?.quantidade == e2?.quantidade &&
        e1?.nome == e2?.nome &&
        e1?.users == e2?.users;
  }

  @override
  int hash(CartRecord? e) => const ListEquality()
      .hash([e?.imagem, e?.preco, e?.quantidade, e?.nome, e?.users]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
