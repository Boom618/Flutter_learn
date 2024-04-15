import 'package:flutter/material.dart';

/// 定义 SearchBar 的三种样式：
/// home 首页默认状态下使用的样式
/// homeLight 首页发生上滑后使用的样式
/// normal 为默认情况下使用的样式

enum SearchBarType { home, homeLight, normal }

class SearchBarWidget extends StatefulWidget {
  final bool hideLeft; // 左侧返回

  ///搜索框类型
  final SearchBarType searchBarType;

  ///提示文案
  final String? hint;

  /// 默认内容
  final String? defaultText;

  ///左侧按钮点击回调
  final void Function()? leftButtonClick;

  ///右侧按钮点击回调
  final void Function()? rightButtonClick;

  ///输入框点击回调
  final void Function()? inputBoxClick;

  /// 内容变化的回调
  final ValueChanged<String>? onChanged;

  const SearchBarWidget(
      {super.key,
      this.hideLeft = false,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.inputBoxClick,
      this.onChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  get _backBtn => widget.hideLeft ?? false
      ? null
      : Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
          size: 26,
        );

  get _inputBox {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = const Color(0xffededed);
    }
    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? const Color(0xffa9a9a9)
                : Colors.blue,
          ),
          Expanded(child: Container()),
          // 右侧的图标按钮
          _wrapTap(
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "搜索",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.defaultText != null) {
      _controller.text = widget.defaultText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _normalSearchBar();
  }

  Widget _normalSearchBar() {
    return Row(
      children: [
        // 左侧返回按钮
        _wrapTap(
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: _backBtn,
            ),
            widget.leftButtonClick),
        // 中间搜索框
        Expanded(child: _inputBox),
      ],
    );
  }

  _wrapTap(Widget? widget, void Function()? callback) {
    return GestureDetector(
      onTap: callback,
      child: widget,
    );
  }
}
