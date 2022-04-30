import 'dart:io';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_preview/color/material_color.dart';
import 'package:flutter_pdf_preview/utils/text_styles.dart';
import 'document_viewer_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? path;
  PDFDocument? doc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: createMaterialColor(Color(0xFFfafafa)),
      appBar: AppBar(
        backgroundColor: createMaterialColor(Color(0xFFe2e2e2)),
        title: Text("Documents",style: AppTextStyles.boldTextStyle),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 150,
                child: IconButton(onPressed: () async {
                  openPdfFileExplorer();
                }, icon: Image.asset("assets/images/file_picker.png",color: createMaterialColor(Color(0xFFe2e2e2)),height: 150, width: 150,),),
              ),
              const SizedBox(height: 10,),
              const Text(
                'No Pdf Found',
                style: AppTextStyles.lightTextStyle,
              ),
              const SizedBox(height: 10,),
              const Text(
                'Click to select pdf',
                style: AppTextStyles.lightTextStyle,
              ),
            ],
          ),
        ),
    );
  }

  Future<void> openPdfFileExplorer()
  async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(result != null)
    {
      File file = File(result.files.single.path!);
      doc = await PDFDocument.fromFile(file);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> DocumentViewerScreen(document:doc)));
    }
  }
}