import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import '../database_helper/database_helper.dart';
import '../model/Note_model.dart';
import '../routing/app_routes.dart';

class NoteController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  var notes = <Note>[];

  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  bool isEmpty() {
    if (notes.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
    Note note = Note(
      title: title,
      content: content,
      dateTimeEdited: DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now()),
      dateTimeCreated: DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now()),
    );

    await DatabaseHelper.instance.addNote(note);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.back();
  }

  void updateNote(int id, String dTCreated) async {
    final title = titleController.text;
    final content = contentController.text;
    Note note = Note(
      id: id,
      title: title,
      content: content,
      dateTimeEdited: DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await DatabaseHelper.instance.updateNote(note);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.offAllNamed(AppRoute.HOME);
  }

  void deleteNote(int id) async {
    Note note = Note(
      id: id,
    );
    await DatabaseHelper.instance.deleteNote(note);
    getAllNotes();
  }

  void deleteAllNotes() async {
    await DatabaseHelper.instance.deleteAllNotes();
    getAllNotes();
  }

  void getAllNotes() async {
    notes = await DatabaseHelper.instance.getNoteList();
    update();
  }

  void shareNote(String title, String content) {
    Share.share("$title \n$content");
  }
}
