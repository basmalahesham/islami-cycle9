import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/moduls/hadeth/hadeth_details.dart';

class HadethView extends StatefulWidget {
  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  //String versContent = '';
  List<HadethData> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    readFile();
    var theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          Divider(
            color: theme.primaryColor,
            thickness: 2,
          ),
          const Text(
            'الأحاديث',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: theme.primaryColor,
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allHadeth[index]);
                },
                child: Text(
                  allHadeth[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              itemCount: allHadeth.length,
            ),
          ),
        ],
      ),
    );
  }

  readFile() async {
    List<HadethData> list = [];
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    //versContent = content;
    List<String> allHadethContent = content.split('#');

    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadethContent = allHadethContent[i].trim();
      int indexOfFirstLine = singleHadethContent.indexOf("\n");
      String title = singleHadethContent.substring(0, indexOfFirstLine);
      String content = singleHadethContent.substring(indexOfFirstLine + 1);

      HadethData hadeth = HadethData(title, content);
      list.add(hadeth);

      /*List<String> singleHadethLines = allHadethContent[i].trim().split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');*/
    }
    allHadeth = list;
    setState(() {});
  }
}

class HadethData {
  String title;
  String content;

  HadethData(this.title, this.content);
}
