
import 'package:flutter_getx/app/translations/en_us/en_us_translation.dart';
import 'package:flutter_getx/app/translations/es_mx/es_mx_translation.dart';
import 'package:flutter_getx/app/translations/pt_br/pt_br_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'pt_BR': ptBR,
    'en_US': enUs,
    'es_MX': esMx
  };
}

// class AppTranslation extends Translations {
// //   static Map<String, Map<String, String>>
// //    translations =
// // {
// //     'pt_BR' : ptBR,
// //     'en_US' : enUs,
// //     'es_mx' : esMx
// // };

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'pt_BR': ptBR,
//         'en_US': enUs,
//         'es_mx': esMx,
//       };

//   // @override
//   // Map<String, Map<String, String>> get keys => {
//   //       'en_US': {
//   //         'GetX': 'GetX',
//   //         'oi': 'Hello',
//   //       },
//   //       'es_MX': {
//   //         'GetX': 'obtener',
//   //         'oi': 'Holla',
//   //       }
//   //     };
// }
