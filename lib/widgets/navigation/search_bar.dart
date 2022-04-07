import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/buttons/button_icon_gradient.dart';
import 'package:steam_pal/widgets/text/text_gradient.dart';
import 'package:steam_pal/widgets/textfield/textfield_gradient.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.title,
    required this.list,
    required this.updateList,
  }) : super(key: key);

  final String title;
  final List<String> list;
  final void Function(List<String>) updateList;

  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool isSearching = false;

  void onTextChange(value) {
    print(value);
    var filteredList = widget.list
        .where((title) => title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    widget.updateList(filteredList);
  }

  void beginSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void cancelSearch() {
    setState(() {
      isSearching = false;
    });
    _controller.text = "";
    widget.updateList(widget.list);
  }

  void clearText() {
    // Already empty, pop instead
    if (_controller.text.isEmpty) {
      cancelSearch();
    } else {
      _controller.text = "";
      widget.updateList(widget.list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isSearching
        ? AppBar(
            title: TextFieldGradient(
                controller: _controller,
                onChange: onTextChange,
                hint: "Enter Game Title",
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffB9C44E),
                    Color(0xff37C4B7),
                  ],
                )),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: ButtonIconGradient(
                icon: Icons.chevron_left_rounded,
                onPressed: cancelSearch),
            actions: [
              ButtonIconGradient(
                  icon: Icons.clear, onPressed: clearText)
            ],
          )
        : AppBar(
            title: TextGradient(
              widget.title,
              gradient: const LinearGradient(colors: [
                Color(0xff37C4B7),
                Color(0xffB9C44E),
              ]),
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              ButtonIconGradient(onPressed: beginSearch)
            ],
          );
  }
}
