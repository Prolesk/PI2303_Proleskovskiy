import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import '../widgets/display.dart';
import '../widgets/control_panel.dart';

class ResourcesTab extends StatefulWidget {
  final Machine machine;
  final VoidCallback update;

  ResourcesTab(this.machine, this.update);

  @override
  _ResourcesTabState createState() => _ResourcesTabState();
}

class _ResourcesTabState extends State<ResourcesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Display(widget.machine),

            Expanded(
              child: SingleChildScrollView(
                child: ControlPanel(widget.machine, widget.update),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
