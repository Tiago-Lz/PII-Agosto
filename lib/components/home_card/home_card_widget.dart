import '../../common/theme.dart';
import '../../common/util.dart';
import 'package:flutter/material.dart';
import 'home_card_model.dart';
export 'home_card_model.dart';

class HomeCardWidget extends StatefulWidget {
  const HomeCardWidget({super.key});

  @override
  _HomeCardWidgetState createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  late HomeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x230F1113),
              offset: Offset(0.0, 4.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ),
      ),
    );
  }
}
