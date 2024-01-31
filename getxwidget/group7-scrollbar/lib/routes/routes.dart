import 'package:get/get.dart';
import 'package:group7_scrollbar/app/splash.dart';
import 'package:group7_scrollbar/bindings/autocomplete_binding.dart';
import 'package:group7_scrollbar/bindings/copy_paste_binding.dart';
import 'package:group7_scrollbar/bindings/date_picker_binding.dart';
import 'package:group7_scrollbar/bindings/emojipicker_binding.dart';
import 'package:group7_scrollbar/bindings/expansion_panel_list_binding.dart';
import 'package:group7_scrollbar/bindings/hide_floating_action_btn_binding.dart';
import 'package:group7_scrollbar/bindings/number_picker_binding.dart';
import 'package:group7_scrollbar/bindings/scroll_notif_binding.dart';
import 'package:group7_scrollbar/bindings/scrollbar_one_binding.dart';
import 'package:group7_scrollbar/bindings/searh_filter_binding.dart';
import 'package:group7_scrollbar/pages/autocomplete_page.dart';
import 'package:group7_scrollbar/pages/copy_paste_page.dart';
import 'package:group7_scrollbar/pages/date_picker_page.dart';
import 'package:group7_scrollbar/pages/emoji_picker_page.dart';
import 'package:group7_scrollbar/pages/expansion_panel_list_page.dart';
import 'package:group7_scrollbar/pages/hide_floating_action_btn_page.dart';
import 'package:group7_scrollbar/pages/number_picker_page.dart';
import 'package:group7_scrollbar/pages/scroll_notif_page.dart';
import 'package:group7_scrollbar/pages/scrollbar_scrollable_page.dart';
import 'package:group7_scrollbar/pages/search_filter_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static final settings = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
        name: '/scrollbarWithScroll',
        page: () => ScrollbarScrollablePage(),
        binding: ScrollbarOneBinding()),
    GetPage(
      name: '/scrollNotification',
      page: () => ScrollNotifPage(),
      binding: ScrollNotifBinding(),
    ),
    GetPage(
      name: '/autoComplete',
      page: () => AutocompletePage(),
      binding: AutocompleteBinding(),
    ),
    GetPage(
      name: '/emojiPicker',
      page: () => EmojiPickerPage(),
      binding: EmojiPickerBinding(),
    ),
    GetPage(
        name: '/datePicker',
        page: () => DatePickerPage(),
        binding: DatePickerBinding()),
    GetPage(
        name: '/numPicker',
        page: () => NumberPickerPage(),
        binding: NumberPickerBinding()),
    GetPage(
        name: '/expansionPanel',
        page: () => ExpansionPanelListPage(),
        binding: ExpansionPanelListBinding()),
    GetPage(
        name: '/copyPaste',
        page: () => CopyPastePage(),
        binding: CopyPasteBinding()),
    GetPage(
        name: '/hideFAB',
        page: () => HideFloatingActionBtnPage(),
        binding: HideFloatingActionBtnBinding()),
    GetPage(
        name: '/searchFilter',
        page: () => SearchFilterPage(),
        binding: SearchFilterBinding()),
  ];
}
