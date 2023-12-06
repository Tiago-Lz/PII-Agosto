import '../../../common/util.dart';
import 'salgados_widget.dart' show SalgadosWidget;
import 'package:flutter/material.dart';

class SalgadosModel extends FlutterFlowModel<SalgadosWidget> {
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
