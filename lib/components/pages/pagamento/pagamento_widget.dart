import '../../../common/icon_button.dart';
import '../../../common/theme.dart';
import '../../../common/util.dart';
import '../../../common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagamento_model.dart';
export 'pagamento_model.dart';

class PagamentoWidget extends StatefulWidget {
  const PagamentoWidget({super.key});

  @override
  _PagamentoWidgetState createState() => _PagamentoWidgetState();
}

class _PagamentoWidgetState extends State<PagamentoWidget> {
  late PagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Title(
        title: 'Pagamento',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: const Color(0xFFFF5C00),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '8h3gplhv' /* PAGAMENTO */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.08, -0.06),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/QR_CODE_DOCE.jpg',
                        width: 300.0,
                        height: 330.0,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0.00, 0.00),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, -0.62),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ix6jo5b2' /* Realize o pagamento através do... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.08, 0.59),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Categorias');
                      },
                      text: FFLocalizations.of(context).getText(
                        'vgt8rxsz' /* PAGAMENTO REALIZADO */,
                      ),
                      options: FFButtonOptions(
                        width: 240.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFF5C00),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.08, 0.77),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Carrinho');
                      },
                      text: FFLocalizations.of(context).getText(
                        '9z8gef5z' /* CANCELAR */,
                      ),
                      options: FFButtonOptions(
                        width: 240.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFF5C00),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
