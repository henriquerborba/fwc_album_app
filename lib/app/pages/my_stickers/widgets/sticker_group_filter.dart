import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

import '../presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;

  const StickerGroupFilter({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StickerGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
              clearCallBack: () {
                setState(() {
                  selected = null;
                  context.get<MyStickersPresenter>().countryFilter(selected);
                });
              },
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: (_, item) => item['value'] ?? '',
          title: (_, item) => item['title'] ?? '',
        ),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallBack;

  const _StickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0XFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: context.textStyles.textSecundaryFontRegular
                  .copyWith(fontSize: 11),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                clearCallBack();
              },
              child: const Icon(
                Icons.clear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
