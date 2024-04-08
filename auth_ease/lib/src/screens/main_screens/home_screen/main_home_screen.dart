import 'package:auth_ease/src/screens/main_screens/drawer_screen.dart';
import 'package:auth_ease/src/screens/main_screens/home_screen/tab_views/schedules_view.dart';
import 'package:auth_ease/src/utils/constants/colors.dart';
import 'package:auth_ease/src/utils/constants/fontsizes.dart';
import 'package:auth_ease/src/utils/constants/fontweights.dart';
import 'package:auth_ease/src/utils/constants/strings.dart';
import 'package:auth_ease/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/text_widget.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  late ValueNotifier<bool> valueNotifier;
  late TextEditingController textEditingController;

  @override
  void initState(){
    super.initState();
    textEditingController = TextEditingController();
    controller = TabController(
      length: 3,
      vsync: this
    );

    valueNotifier = ValueNotifier(false);

    controller.addListener(() {
      if(controller.index == 1 || controller.index == 2){
        valueNotifier.value = true;
      }
      else{
        valueNotifier.value = false;
      }
    });
  }

  @override 
  void dispose(){
    textEditingController.dispose();
    controller.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: redColor.shade100,//Color.fromARGB(150, 150, 50, 50),
          centerTitle: true,
          title: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (_, value, __) => Visibility(
              visible: !value,
              replacement: GenericTextField2(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                controller: textEditingController,
                hintText: searchString,
              ),
              child: const GenericText(
                fontSize: fontSize3half,
                fontWeight: fontWeight5,
                text: campusConnectString
              ),
            ),
          )
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                universityJpg,
              ),
              fit: BoxFit.cover
            )
          ),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  unselectedLabelColor: blackColor,
                  dividerColor: whiteColor,
                  indicatorColor: redColor,
                  splashBorderRadius: const BorderRadius.all(Radius.circular(100)),
                  dividerHeight: 0,
                  overlayColor: MaterialStatePropertyAll(redColor.withOpacity(0.5)),
                  tabs: const [
                    Tab(
                      icon: Icon(Iconsax.house),
                      iconMargin: EdgeInsets.zero,
                      child: GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight5,
                        text: homeString
                      ),
                    ),
                    Tab(
                      icon: Icon(Iconsax.clock),
                      iconMargin: EdgeInsets.zero,
                      child: GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight5,
                        text: eventsString
                      ),
                    ),
                    Tab(
                      icon: Icon(Iconsax.home),
                      iconMargin: EdgeInsets.zero,
                      child: GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight5,
                        text: schedulesString
                      ),
                    ),
                  ],
                ),
                
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: const [
                      Center(
                        child: Text('20')
                      ),
                      Center(
                        child: Text('Tab2')
                      ),
                      Center(
                        child: SchedulesView()
                      ),
                    ]
                  )
                )
              ],
            )
          ),
        ),
        drawer: const DrawerScreen(),
      ),
    );
  }
}