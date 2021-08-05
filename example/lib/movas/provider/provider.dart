import 'package:provider/single_child_widget.dart';

import 'service_providers.dart';
import 'store_providers.dart';
import 'stream_providers.dart';

List<SingleChildWidget> providers = [
  ...streamProviders,
  ...serviceProviders,
  ...storeProviders,
];
