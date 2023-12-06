import '../../../common/util.dart';
import 'palhas_italianas_widget.dart' show PalhasItalianasWidget;
import 'package:flutter/material.dart';

class PalhasItalianasModel extends FlutterFlowModel<PalhasItalianasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
