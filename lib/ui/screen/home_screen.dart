import 'package:flutter/material.dart';
import 'package:learn_projects/ui/widgets/custom_cahced_network_image_rounded.dart';
import 'package:learn_projects/utils/colors.dart';
import 'package:learn_projects/utils/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ScrollController _scrollController = ScrollController();
GlobalKey<ScaffoldState>? scaffoldStateKey=GlobalKey<ScaffoldState>();
bool isDrawerOpen=false;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldStateKey,
        backgroundColor: MyColors.agateBlue,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: size.width * 0.50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Home",style: MyStyle.textStyle(fontSize: 16),),
                    SizedBox(height: 16,),
                    Text("Profile",style: MyStyle.textStyle(fontSize: 16),),
                    SizedBox(height: 16,),
                    Text("Home",style: MyStyle.textStyle(fontSize: 16),),
                    SizedBox(height: 16,),
                    Text("Logout",style: MyStyle.textStyle(fontSize: 16),),

                  ],),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: 0,
              bottom:0,
              right:isDrawerOpen?size.width * -0.50:0,
              left:isDrawerOpen?size.width * 0.50:0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                       setState(() {
                                         isDrawerOpen=!isDrawerOpen;
                                       });
                                      },
                                      icon: Icon(
                                        Icons.menu_rounded,
                                        color: MyColors.white,
                                      )),
                                  Text(
                                    "Dashboard",
                                    style: MyStyle.textStyle(
                                        fontSize: 25, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.filter_alt_rounded,
                                        color: MyColors.white,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          buildContainerSearch(),

                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),)),
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 150),
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) => Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: MyColors.cobaltBlue,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImageRounded(
                                  imageUrl:
                                  "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/flutter%20logo.png",
                                  height: 100,
                                  width: size.width,
                                  boxFit: BoxFit.fill,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                ),
                                Flexible(
                                  child: Center(
                                    child: Text(
                                      "State Management",
                                      style: MyStyle.textStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),

          ],
        ));
  }

  Container buildContainerSearch() {
    return Container(
                    height: 45,
                    margin: EdgeInsets.only(top: 40, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.white.withOpacity(0.40),
                    ),
                    child: TextFormField(
                      style: MyStyle.textStyle(fontSize: 14),
                      showCursor: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: MyStyle.textStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        prefixIcon: Icon(
                          Icons.search,
                          color: MyColors.white.withOpacity(0.80),
                        ),
                      ),
                    ),
                  );
  }
}
