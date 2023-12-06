import '/backend/backend.dart';
import '../../../common/icon_button.dart';
import '../../../common/theme.dart';
import '../../../common/util.dart';
import '../../../common/widgets.dart';
import '../../../common/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'brownie_model.dart';
export 'brownie_model.dart';

class BrownieWidget extends StatefulWidget {
  const BrownieWidget({super.key});

  @override
  _BrownieWidgetState createState() => _BrownieWidgetState();
}

class _BrownieWidgetState extends State<BrownieWidget> {
  late BrownieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrownieModel());

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
        title: 'Brownie',
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
                  '775ty23c' /* BROWNIES */,
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
                    alignment: const AlignmentDirectional(0.02, -0.95),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/brownie.jpeg',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                        alignment: const Alignment(0.00, 0.00),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, -0.31),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'hd5gkm6w' /* Brownie Tradicional */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'nxt6tkyc' /*  - Nosso delicioso Brownie tra... */,
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
                    alignment: const AlignmentDirectional(0.02, 0.38),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/brownie2.jpeg',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.80, -0.16),
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
                        '2z74p25j' /* ADICIONE AO CARRINHO
 */
                        ,
                      ),
                      options: FFButtonOptions(
                        width: 203.0,
                        height: 30.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFF5C00),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).black600,
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
                    alignment: const AlignmentDirectional(0.00, 0.72),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '860f9q11' /* Brownie com Castanhas */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'xlpmditf' /*  - Além da opção clássica, o b... */,
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
                    alignment: const AlignmentDirectional(0.84, 0.86),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '1fx9psxj' /* ADICIONE AO CARRINHO */,
                      ),
                      options: FFButtonOptions(
                        width: 203.0,
                        height: 30.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFF5C00),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).black600,
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
                    alignment: const AlignmentDirectional(-0.71, -0.17),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zvupia08' /* R$6.00 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 24.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.68, 0.86),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'm7dmhl08' /* R$6.00 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 24.0,
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
