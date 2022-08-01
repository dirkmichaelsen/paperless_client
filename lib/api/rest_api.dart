import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paperless_client/model/correspondent.dart';
import 'package:paperless_client/api/correspondent_result.dart';
import 'package:paperless_client/model/document_type.dart';
import 'package:paperless_client/api/document_type_result.dart';
import 'package:paperless_client/model/tag.dart';
import 'package:paperless_client/api/tag_result.dart';
import 'package:paperless_client/utils.dart';

const token = 'cc78ab87732e3f77de5e40f201b824d355f8801b';
const server = 'http://192.168.178.101:8930';
const urlBase = '$server/api/';
const urlTags = 'tags/';
const urlDocumentTypes = 'document_types/';
const urlCorrespondents = 'correspondents/';

// --- Headers

Map<String, String> headers() => {"Authorization": "Token $token"};

// --- Tags ---

Future<Tag> getTagById(int id) async {
  final response =
      await http.get(Uri.parse('$urlBase$urlTags/$id/'), headers: headers());
  return Tag.fromJson(jsonDecode(response.body, reviver: transformEncoding));
}

Future<List<Tag>> fetchAllTags() async {
  TagResult tagResult;
  List<Tag> tags = [];
  bool fetchNextPage = true;
  for (int page = 1; fetchNextPage; page++) {
    tagResult = await fetchTagsPaged(page);
    tags.addAll(tagResult.tags);
    fetchNextPage = tagResult.next != null;
  }
  return tags;
}

Future<TagResult> fetchTagsPaged(int page) async {
  final response = await http.get(Uri.parse('$urlBase$urlTags?page=$page'),
      headers: headers());
  return TagResult.fromJson(
      jsonDecode(response.body, reviver: transformEncoding));
}

// --- Document Types ---

Future<List<DocumentType>> fetchAllDocumentTypes() async {
  DocumentTypeResult documentTypeResult;
  List<DocumentType> documentTypes = [];
  bool fetchNextPage = true;
  for (int page = 1; fetchNextPage; page++) {
    documentTypeResult = await fetchDocumentTypesPaged(page);
    documentTypes.addAll(documentTypeResult.documentTypes);
    fetchNextPage = documentTypeResult.next != null;
  }
  return documentTypes;
}

Future<DocumentTypeResult> fetchDocumentTypesPaged(int page) async {
  final response = await http.get(
      Uri.parse('$urlBase$urlDocumentTypes?page=$page'),
      headers: headers());
  return DocumentTypeResult.fromJson(
      jsonDecode(response.body, reviver: transformEncoding));
}

// --- Correspondents ---

Future<List<Correspondent>> fetchAllCorrespondents() async {
  CorrespondentResult correspondentResult;
  List<Correspondent> correspondents = [];
  bool fetchNextPage = true;
  for (int page = 1; fetchNextPage; page++) {
    correspondentResult = await fetchCorrespondentsPaged(page);
    correspondents.addAll(correspondentResult.correspondents);
    fetchNextPage = correspondentResult.next != null;
  }
  return correspondents;
}

Future<CorrespondentResult> fetchCorrespondentsPaged(int page) async {
  final response = await http.get(
      Uri.parse('$urlBase$urlCorrespondents?page=$page'),
      headers: headers());
  return CorrespondentResult.fromJson(
      json.decode(response.body, reviver: transformEncoding));
}
