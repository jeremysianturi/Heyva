class PhysicalCheckinModel {
  final int index;
  final String title;
  final String subtitle;
  var isSelected = false;

  PhysicalCheckinModel(
      {required this.index,
      required this.title,
      required this.subtitle,
      required this.isSelected});
}
