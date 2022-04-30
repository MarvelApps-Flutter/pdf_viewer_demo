import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
class DocumentViewerScreen extends StatefulWidget {
  final PDFDocument? document;

  const DocumentViewerScreen({Key? key, this.document}) : super(key: key);
  @override
  _DocumentViewerScreenState createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: PDFViewer(document: widget.document!));
  }
}
