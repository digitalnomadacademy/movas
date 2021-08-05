import 'package:flutter/material.dart';

class ServiceSwitch extends StatelessWidget {
  const ServiceSwitch({
    Key key,
    @required this.useProdService,
    @required this.onChanged,
  }) : super(key: key);

  final bool useProdService;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(value: useProdService, onChanged: onChanged),
        Text(useProdService ? 'Prod Service' : 'Mock Service'),
      ],
    );
  }
}
