import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modal_task_create_2/modal_task_create2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'modal_create_project_widget.dart' show ModalCreateProjectWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalCreateProjectModel
    extends FlutterFlowModel<ModalCreateProjectWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> assignUsers = [];
  void addToAssignUsers(UsersRecord item) => assignUsers.add(item);
  void removeFromAssignUsers(UsersRecord item) => assignUsers.remove(item);
  void removeAtIndexFromAssignUsers(int index) => assignUsers.removeAt(index);
  void insertAtIndexInAssignUsers(int index, UsersRecord item) =>
      assignUsers.insert(index, item);
  void updateAssignUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      assignUsers[index] = updateFn(assignUsers[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameTextController;
  String? Function(BuildContext, String?)? projectNameTextControllerValidator;
  String? _projectNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rxy1hzw9' /* Please enter a project name. */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3hfkufri' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? createdProject;

  @override
  void initState(BuildContext context) {
    projectNameTextControllerValidator = _projectNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
