import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
    final User currentUser;
    final List<IconData> icons;
    final int selectedIndex;
    final Function(int) onTap;

    const CustomAppBar({
        required this.currentUser,
        required this.icons,
        required this.selectedIndex,
        required this.onTap,
        Key? key,
    }) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 65.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Expanded(
                    child: Text(
                      'facebook',
                      style: const TextStyle(
                        color: Palette.facebookBlue,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      ),
                            ),
                  ),
        Container(
          height: double.infinity,
          width: 600.0,
          child: CustomTabBar(
            icons: icons, 
            selectedIndex: selectedIndex, 
            onTap: onTap,
            isBottomIndicator: true,
            ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(width: 12.0),
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('Search'),
              ),
              CircleButton(
                icon: Icons.chat,
                iconSize: 30.0,
                onPressed: () => print('Messenger'),
              ),
            ],
          ),
        ),
        ]
        )
        );
      }
}
