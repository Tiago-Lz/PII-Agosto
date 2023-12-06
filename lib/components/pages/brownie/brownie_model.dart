import '../../../common/util.dart';
import 'brownie_widget.dart' show BrownieWidget;
import 'package:flutter/material.dart';

class BrownieModel extends FlutterFlowModel<BrownieWidget> {
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
