import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../nav.dart';

class EncodeBase64Page extends StatefulWidget {
  const EncodeBase64Page({Key? key}) : super(key: key);

  @override
  State<EncodeBase64Page> createState() => _EncodeBase64PageState();
}

class _EncodeBase64PageState extends State<EncodeBase64Page> {
  final _inputController = TextEditingController();
  final _outputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  void updateOutput(String input) {
    setState(() {
      _outputController.text = base64Encode(input);
    });
  }

  void pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      _inputController.text = data.text!;
      updateOutput(data.text!);
    }
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _outputController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encode Base64'),
      ),
      drawer: const NavigationDrawer(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Input'),
                  const Spacer(),
                  Tooltip(
                    message: 'Paste input from clipboard',
                    child: ElevatedButton(
                      onPressed: pasteFromClipboard,
                      child: const Icon(Icons.paste),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _inputController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text to encode',
                ),
                style: const TextStyle(fontFamily: 'CascadiaMono'),
                onChanged: updateOutput,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Output'),
                  const Spacer(),
                  Tooltip(
                    message: 'Copy output to clipboard',
                    child: ElevatedButton(
                      onPressed: copyToClipboard,
                      child: const Icon(Icons.copy),
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
                  hintText: 'Base64 encoded text',
                ),
                style: const TextStyle(fontFamily: 'CascadiaMono'),
                readOnly: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String base64Encode(String text) {
  final bytes = utf8.encode(text);
  return base64.encode(bytes);
}
