import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modal_project/modal_project_widget.dart';
import '/components/modal_user_profile/modal_user_profile_widget.dart';
import '/components/u_i_components/add_team/add_team_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'modal_task_details_widget.dart' show ModalTaskDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalTaskDetailsModel extends FlutterFlowModel<ModalTaskDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for content widget.
  ScrollController? content;
  // Stores action output result for [Backend Call - Create Document] action in markComplete widget.
  ActivityRecord? completedActivity;
  // Stores action output result for [Backend Call - Create Document] action in markComplete widget.
  NotesRecord? taskActivityComplete;
  // Stores action output result for [Backend Call - Create Document] action in accept widget.
  ActivityRecord? activityCreated;
  // Stores action output result for [Backend Call - Create Document] action in accept widget.
  NotesRecord? taskActivity;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for updateActivity widget.
  FocusNode? updateActivityFocusNode;
  TextEditingController? updateActivityTextController;
  String? Function(BuildContext, String?)?
      updateActivityTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? newNoteDesktop;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityNew;

  @override
  void initState(BuildContext context) {
    content = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    content?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    updateActivityFocusNode?.dispose();
    updateActivityTextController?.dispose();
  }
}
