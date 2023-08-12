import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/home/component/api_find_song.dart';
import 'package:music_app/screens/search_result/search_result.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../const/component.dart';
import '../const/dimen.dart';

class BaseSearchBar extends StatelessWidget {
  BaseSearchBar({super.key, required this.controller});
  final TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: StringConst.textSearch,
            fillColor: ColorConst.primaryColorTextFormField,
            hintStyle: Component.textStyleTextFormField,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Dimen.borderRadiusTextFormField),
            ),
            suffixIcon: Icon(
              Icons.search_rounded,
              color: Colors.orange[900],
            ),
          ),
          readOnly: false,
          onFieldSubmitted: (value) {
            _submitForm(context);
          },
        ),
      ),
    );

    // return SizedBox(
    //   width: MediaQuery.of(context).size.width * 0.9,
    //   child:  BaseTextformFieldSurfixIcon(
    //     controller: controller,
    //     text: StringConst.textSearch,
    //     function: function,
    //     validator: (value) {},
    //     isReadOnly: false,
    //     surfixIcon: Icon(
    //       Icons.search_rounded,
    //       color: Colors.orange[900],
    //     ),
    //   ),
    // );
  }

  void _submitForm(context) async {
    if (_formKey.currentState!.validate()) {
      List<Song> listSongs = await ApiFindSong().findSong(controller.text);
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: RoutesScreen.routesSearchResult),
        screen: SearchResultScreen(
          listSongs: listSongs,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }
}
