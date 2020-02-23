import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnCancelListener = void Function();
class LoadingDialog extends Dialog {

  LoadingDialog({
    this.title,
    this.isCancel = true,
    this.indicatorRadius = 20,
    this.textSize = 14,
    Color color,
    Color textColor,
    BorderRadiusGeometry borderRadius,
    EdgeInsetsGeometry padding,
    this.cancelListener,
  }): _borderRadius = borderRadius == null ? BorderRadius.circular(10) : borderRadius,
        _padding = padding == null ? EdgeInsets.fromLTRB(20, 15, 20, 15) : padding,
        _color = color == null ? Colors.white : color,
        _textColor = textColor == null ? Colors.black : textColor;

  final String title;// 内容文本
  final bool isCancel;// 是否点击外部或者返回键关闭Dialog
  final Color _color;// 内容背景颜色
  final BorderRadiusGeometry _borderRadius;// 内容倒角半径
  final EdgeInsetsGeometry _padding;// 内容内边距
  final double indicatorRadius;// 菊花半径
  final Color _textColor;// 文本颜色
  final double textSize;// 字体大小
  final OnCancelListener cancelListener;

  List<Widget> _buildWidget() {
    List<Widget> widgets = List();
    widgets.add(CircularProgressIndicator());
    if (title != null && title.isNotEmpty && title.trim().length > 0) {
      widgets.add(Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: TextStyle(
                color: _textColor,
                fontSize: textSize,
              ),
            ),
          )
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isCancel,// 拦截Android返回键
      child: GestureDetector(
        onTap: () {
          if (isCancel) {
            // 点击Dialog外部关闭Dialog
            Navigator.pop(context);
            if(cancelListener != null) {
              cancelListener();
            }
          }
        },
        child: Container(
          padding: EdgeInsets.all(36),// 外边距
          color: Colors.transparent,// 必须设置颜色之后外层GestureDetector的onTap才会回调
          child: GestureDetector(
            onTap: () {},// 点击Dialog不响应外部点击关闭事件
            child: Center(
              child: Material(
                color: _color,// 背景
                borderRadius: _borderRadius,// 倒角
                child: Padding(
                  padding: _padding,// 内边距
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildWidget(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}