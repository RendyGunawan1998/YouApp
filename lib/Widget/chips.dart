import '../core.dart';

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Chip(
        backgroundColor: HexColor('#384D51'),
        labelPadding: EdgeInsets.only(left: 8.0),
        label: textInter(label, Colors.white, 12, FontWeight.w600),
        deleteIcon: Icon(
          Icons.close,
          size: 18,
          color: Colors.white,
        ),
        onDeleted: () {
          onDeleted(index);
        },
      ),
    );
  }
}

class Chips1 extends StatelessWidget {
  const Chips1({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Chip(
        backgroundColor: HexColor('#1C272C'),
        labelPadding: EdgeInsets.all(4),
        label: textInter(label, Colors.white, 12, FontWeight.w600),
      ),
    );
  }
}
