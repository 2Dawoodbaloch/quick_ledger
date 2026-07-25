import 'package:flutter/material.dart';

/// Reusable search field with a search icon (prefix) and a clear
/// button (suffix) that only appears once text is typed.
///
/// IMPORTANT: this uses TextField's built-in `suffixIcon` slot for
/// the clear button — NOT a Positioned/Stack overlay. Positioned
/// widgets only work as a direct child of a Stack; if you (or an
/// earlier version of this widget) wrapped the field in a Column and
/// tried to Positioned() a button on top of it, that's exactly the
/// "Incorrect use of ParentDataWidget" crash you hit. suffixIcon
/// avoids the problem entirely since TextField handles the layout
/// for you.
class GSearchBar extends StatefulWidget {
  const GSearchBar({
    super.key,
    this.hintText = 'Search',
    this.onChanged,
    this.enabled = true,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  State<GSearchBar> createState() => _GSearchBarState();
}

class _GSearchBarState extends State<GSearchBar> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        // This is the fix: suffixIcon is a normal, supported slot on
        // TextField — no Positioned/Stack needed at all.
        suffixIcon: _hasText
            ? IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: _clear,
              )
            : null,
      ),
    );
  }
}