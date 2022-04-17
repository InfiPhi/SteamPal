import 'package:flutter/material.dart';
import 'package:steam_pal/widgets/buttons/button_icon_gradient.dart';
import 'package:steam_pal/widgets/text/text_gradient.dart';
import 'package:steam_pal/widgets/textfield/textfield_gradient.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.title,
    required this.searchCallback,
    this.filters,
  }) : super(key: key);

  final String title;
  final void Function(String) searchCallback;
  final List<String>? filters;

  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool isSearching = false;
  String dropdownValue = "";

  void onTextChange(value) {
    widget.searchCallback(value);
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
    onTextChange("");
  }

  void clearText() {
    // Already empty, pop instead
    if (_controller.text.isEmpty) {
      cancelSearch();
    } else {
      _controller.text = "";
      onTextChange("");
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.filters != null) {
      dropdownValue = widget.filters!.first;
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
                icon: Icons.chevron_left_rounded, onPressed: cancelSearch),
            actions: [
              ButtonIconGradient(icon: Icons.clear, onPressed: clearText)
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
            leadingWidth: 100,
            leading: widget.filters == null
                ? const SizedBox()
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        dropdownColor: const Color(0xff5d2750),
                        style: const TextStyle(color: Color(0xff8cbb6e)),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Color(0xff8cbb6e)),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            onTextChange(newValue == widget.filters?.first
                                ? ""
                                : newValue);
                          });
                        },
                        items: widget.filters
                            ?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: TextGradient(value,
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff37C4B7),
                                    Color(0xffB9C44E),
                                  ])),
                            ),
                          );
                        }).toList()),
                  )),
            actions: [ButtonIconGradient(onPressed: beginSearch)],
          );
  }
}
