import '/backend/backend.dart';
import '../../../common/icon_button.dart';
import '../../../common/theme.dart';
import '../../../common/util.dart';
import '../../../common/widgets.dart';
import '../../../common/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'palhas_italianas_model.dart';
export 'palhas_italianas_model.dart';

class PalhasItalianasWidget extends StatefulWidget {
  const PalhasItalianasWidget({super.key});

  @override
  _PalhasItalianasWidgetState createState() => _PalhasItalianasWidgetState();
}

class _PalhasItalianasWidgetState extends State<PalhasItalianasWidget> {
  late PalhasItalianasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PalhasItalianasModel());

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
        title: 'PalhasItalianas',
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
                  context.pushNamed('Categorias');
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'j08biscv' /* PALHAS ITALIANAS */,
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
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.12, -0.96),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/palha.jpeg',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, -0.32),
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'mqzedk3r' /* Palhas Tradicionais */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '1w4263ze' /*  - Um doce composto por um bri... */,
                                  ),
                                  style: const TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.90, -0.18),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await CartRecord.collection
                                  .doc()
                                  .set(createCartRecordData(
                                    imagem: random_data.randomImageUrl(
                                      0,
                                      0,
                                    ),
                                  ));
                            },
                            text: FFLocalizations.of(context).getText(
                              'u3g3w5jk' /* ADICIONE AO CARRINHO */,
                            ),
                            options: FFButtonOptions(
                              width: 203.0,
                              height: 30.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFF5C00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
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
                          alignment: const AlignmentDirectional(-0.12, 0.28),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/PALHA2.jpeg',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.63),
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '5jt540ia' /* Palhas de Leite Ninho  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '30f0uvs0' /*  - Similar a palha tradicional... */,
                                  ),
                                  style: const TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.88, 0.77),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'v3h99tg2' /* ADICIONE AO CARRINHO */,
                            ),
                            options: FFButtonOptions(
                              width: 203.0,
                              height: 30.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFF5C00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
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
                          alignment: const AlignmentDirectional(-0.66, -0.18),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2e11tctb' /* R$6.00 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 24.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.62, 0.75),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'f4tszf4h' /* R$6.00 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 24.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
