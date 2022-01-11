part of 'widgets.dart';

class Dropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  const Dropdown(
      {Key? key,
      required this.hintText,
      this.options = const [],
      required this.value,
      required this.getLabel,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: greyFontStyle,
            hintText: hintText,
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
            value: value,
            isDense: true,
            onChanged: onChanged,
            items: options.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(getLabel(value)),
              );
            }).toList(),
          )),
        );
      },
    );
  }
}
