import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import '../widgets.dart';

class GenerateGuidPage extends StatefulWidget {
  const GenerateGuidPage({Key? key}) : super(key: key);

  @override
  State<GenerateGuidPage> createState() => _GenerateGuidPageState();
}

class _GenerateGuidPageState extends State<GenerateGuidPage> {
  final _outputController = TextEditingController();

  @override
  void dispose() {
    _outputController.dispose();
    super.dispose();
  }

  void generateGuid(BuildContext context) async {
    final uuid = const Uuid().v4();
    setState(() {
      _outputController.text = uuid;
    });
    Clipboard.setData(ClipboardData(text: uuid));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Generate GUID',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text('GUID'),
                const Spacer(),
                Tooltip(
                  message: 'Generate',
                  child: ElevatedButton(
                    onPressed: () => generateGuid(context),
                    child: const Text('Generate'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _outputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Click Generate',
              ),
              style: const TextStyle(fontFamily: 'CascadiaMono'),
              readOnly: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
