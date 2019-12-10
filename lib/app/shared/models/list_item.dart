class ListItem {
  String description;
  bool checked;

  ListItem({this.description, this.checked = false});

  factory ListItem.fromJson(Map json) {
    return ListItem(
      description: json["description"],
      checked: json["checked"],
    );
  }

  toJson() {
    return {
      "description": description,
      "checked": checked,
    };
  }
}
