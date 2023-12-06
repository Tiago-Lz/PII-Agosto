import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '7h17r73h': {
      'pt': 'Iniciar',
      'en': '',
    },
    'temosbho': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'k2fdjcba': {
      'pt': 'Doceria do Ga',
      'en': '',
    },
    'p9p67e9u': {
      'pt': 'Cadastro',
      'en': '',
    },
    'brzviubv': {
      'pt': 'Vamos iniciar preenchendo os seguintes dados!',
      'en': '',
    },
    '9ytxwblc': {
      'pt': 'Email',
      'en': '',
    },
    'ioiuz715': {
      'pt': 'Senha',
      'en': '',
    },
    'e4sk0n2p': {
      'pt': 'Login',
      'en': '',
    },
    'w409418n': {
      'pt': 'Email',
      'en': '',
    },
    'ajnr16yt': {
      'pt': 'Password',
      'en': '',
    },
    '83m72am6': {
      'pt': 'Confirm Password',
      'en': '',
    },
    'mce9fgo7': {
      'pt': 'Create Account',
      'en': '',
    },
    'zours6op': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Categorias
  {
    'bktgwtdy': {
      'pt': 'BROWNIES',
      'en': '',
    },
    'pi7mu440': {
      'pt': 'PALHAS\n',
      'en': '',
    },
    '9sf838ot': {
      'pt': 'SALGADOS',
      'en': '',
    },
    'nxcsrut0': {
      'pt': 'CATEGORIAS',
      'en': '',
    },
    'fabon9qd': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Brownie
  {
    '775ty23c': {
      'pt': 'BROWNIES',
      'en': '',
    },
    'hd5gkm6w': {
      'pt': 'Brownie Tradicional',
      'en': '',
    },
    'nxt6tkyc': {
      'pt':
          ' - Nosso delicioso Brownie tradicional é a mistura perfeita entre suavidade de sabor e o ponto perfeito!',
      'en': '',
    },
    '2z74p25j': {
      'pt': 'ADICIONE AO CARRINHO\n',
      'en': '',
    },
    '860f9q11': {
      'pt': 'Brownie com Castanhas',
      'en': '',
    },
    'xlpmditf': {
      'pt':
          ' - Além da opção clássica, o brownie com castanha é perfeito para quem quer inovar e se surpreender!',
      'en': '',
    },
    '1fx9psxj': {
      'pt': 'ADICIONE AO CARRINHO',
      'en': '',
    },
    'zvupia08': {
      'pt': 'R\$6.00',
      'en': '',
    },
    'm7dmhl08': {
      'pt': 'R\$6.00',
      'en': '',
    },
    'p86ukyc9': {
      'pt': 'Home',
      'en': '',
    },
  },
  // PalhasItalianas
  {
    'j08biscv': {
      'pt': 'PALHAS ITALIANAS',
      'en': '',
    },
    'mqzedk3r': {
      'pt': 'Palhas Tradicionais',
      'en': '',
    },
    '1w4263ze': {
      'pt':
          ' - Um doce composto por um brigadeiro, bolacha e açúcar de complemento!',
      'en': '',
    },
    'u3g3w5jk': {
      'pt': 'ADICIONE AO CARRINHO',
      'en': '',
    },
    '5jt540ia': {
      'pt': 'Palhas de Leite Ninho ',
      'en': '',
    },
    '30f0uvs0': {
      'pt':
          ' - Similar a palha tradicional, mas com um brigadeiro de leite ninho delicioso!',
      'en': '',
    },
    'v3h99tg2': {
      'pt': 'ADICIONE AO CARRINHO',
      'en': '',
    },
    '2e11tctb': {
      'pt': 'R\$6.00',
      'en': '',
    },
    'f4tszf4h': {
      'pt': 'R\$6.00',
      'en': '',
    },
    'reevigqu': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Salgados
  {
    '3xtl436s': {
      'pt': 'SALGADOS',
      'en': '',
    },
    'qugaae25': {
      'pt': 'ADICIONE AO CARRINHO\n',
      'en': '',
    },
    'c69ui2fn': {
      'pt': 'Coxinha',
      'en': '',
    },
    'sz1llhf8': {
      'pt':
          ' - Deliciosa coxinha com recheio suculento de frango e casquinha crocante.',
      'en': '',
    },
    'qygv4sqf': {
      'pt': 'ADICIONE AO CARRINHO',
      'en': '',
    },
    'po1sdzc1': {
      'pt': 'Empada',
      'en': '',
    },
    'or76491l': {
      'pt': ' - Deliciosa empada recheada de frango.',
      'en': '',
    },
    '2otqfa7h': {
      'pt': 'R\$6.00',
      'en': '',
    },
    'oxzz3j8j': {
      'pt': 'R\$6.00',
      'en': '',
    },
    '94d2inme': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Carrinho
  {
    '25brwc3d': {
      'pt': 'Seu Carrinho',
      'en': '',
    },
    'dh8295ub': {
      'pt': 'Abaixo está a sua lista de produtos.',
      'en': '',
    },
    'dccf32hq': {
      'pt': 'Remove',
      'en': '',
    },
    'xcxak54x': {
      'pt': 'Palha Tradicional',
      'en': '',
    },
    'qdg6jn9i': {
      'pt': 'R\$6.00',
      'en': '',
    },
    '0e3vem9h': {
      'pt': 'Deliciosa Palha Italiana Tradicional',
      'en': '',
    },
    'q0x0vbel': {
      'pt': 'Remove',
      'en': '',
    },
    'zlu57m08': {
      'pt': 'Resumo do Pedido',
      'en': '',
    },
    'bnsog55b': {
      'pt': 'Preço Total',
      'en': '',
    },
    '78jg0nw9': {
      'pt': 'Preço',
      'en': '',
    },
    'o2h5javi': {
      'pt': 'R\$0.00',
      'en': '',
    },
    'vyls6s86': {
      'pt': 'Total',
      'en': '',
    },
    'wxy2t4xp': {
      'pt': 'R\$0.00',
      'en': '',
    },
    '4jvw3bnv': {
      'pt': 'Continue Para o Pagamento',
      'en': '',
    },
    '5a5m5syh': {
      'pt': 'CARRINHO',
      'en': '',
    },
    'rtguq6l2': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Pagamento
  {
    '8h3gplhv': {
      'pt': 'PAGAMENTO',
      'en': '',
    },
    'ix6jo5b2': {
      'pt': 'Realize o pagamento através do PIX utilizando o QRCODE abaixo:',
      'en': '',
    },
    'vgt8rxsz': {
      'pt': 'PAGAMENTO REALIZADO',
      'en': '',
    },
    '9z8gef5z': {
      'pt': 'CANCELAR',
      'en': '',
    },
    'eabldvtm': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ov2smw2q': {
      'pt': '',
      'en': '',
    },
    'o8ibk1ed': {
      'pt': '',
      'en': '',
    },
    'rf66wo6y': {
      'pt': '',
      'en': '',
    },
    'jrgcr4zw': {
      'pt': '',
      'en': '',
    },
    'c4wzxjq9': {
      'pt': '',
      'en': '',
    },
    '6mc8t75g': {
      'pt': '',
      'en': '',
    },
    '0wkvqsga': {
      'pt': '',
      'en': '',
    },
    'pndn0tjv': {
      'pt': '',
      'en': '',
    },
    'nlkds361': {
      'pt': '',
      'en': '',
    },
    '2zwkyms2': {
      'pt': '',
      'en': '',
    },
    'lmssvbpk': {
      'pt': '',
      'en': '',
    },
    'o4t22qtw': {
      'pt': '',
      'en': '',
    },
    'bqq9mfvd': {
      'pt': '',
      'en': '',
    },
    '1dmlbkvz': {
      'pt': '',
      'en': '',
    },
    'q3ky2ynz': {
      'pt': '',
      'en': '',
    },
    'orzcglvw': {
      'pt': '',
      'en': '',
    },
    'wqb3klzh': {
      'pt': '',
      'en': '',
    },
    'mxqom51v': {
      'pt': '',
      'en': '',
    },
    'zv1ofi99': {
      'pt': '',
      'en': '',
    },
    'ynz6w182': {
      'pt': '',
      'en': '',
    },
    'zg7cct13': {
      'pt': '',
      'en': '',
    },
    'xzqwduuu': {
      'pt': '',
      'en': '',
    },
    'aopobiin': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
