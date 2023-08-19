import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/moduls/quran/widgets/suraName_widget.dart';
import 'package:islami/moduls/quran/widgets/verses_widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class SuraDetailsView extends StatefulWidget {
  SuraDetailsView({super.key});

  static const String routeName = 'sura_detail';

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  String versContent = '';
  List<String> versList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetails;

    if (versContent.isEmpty) readFile(args.suraNumber);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.getMainBackground(),
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Islami'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(
            top: 15,
            bottom: 80,
            left: 30,
            right: 30,
          ),
          padding: EdgeInsets.only(
            top: 40,
          ),
          decoration: BoxDecoration(
            color: provider.currentTheme != ThemeMode.dark
                ? const Color(0xFFF8F8F8).withOpacity(0.75)
                : const Color(0xFF141A2E).withOpacity(0.75),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سورة ${args.suraName}',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: provider.currentTheme != ThemeMode.dark
                          ? Colors.black
                          : theme.canvasColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.play_circle,
                    color: provider.currentTheme != ThemeMode.dark
                        ? Colors.black
                        : theme.canvasColor,
                  ),
                ],
              ),
              Divider(
                color: theme.canvasColor,
                thickness: 1.5,
                indent: 40,
                endIndent: 40,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => VersesWidgets(
                    content: versList[index],
                    index: index + 1,
                  ),
                  itemCount: versList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  readFile(int index) async {
    String text = await rootBundle.loadString('assets/files/${index + 1}.txt');
    versContent = text;
    versList = versContent.split('\n');
    setState(() {});
    print(text);
  }
}
