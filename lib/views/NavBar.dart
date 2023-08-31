import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 24, 25, 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align at the bottom
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30, top: 50),
                  leading: Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Create Timer',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  leading: Icon(
                    Icons.inbox_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Inbox',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  leading: Icon(
                    Icons.backpack_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Filtered Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  leading: Icon(
                    Icons.rocket_launch_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Integrations',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  title: Text(
                    'Favorites',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  leading: Icon(
                    Icons.monitor_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Deliwafa',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  leading: Icon(
                    Icons.source_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    '12 RPL-2',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => null,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                'Admin',
                style: TextStyle(fontFamily: 'Inter', fontSize: 18),
              ),
              accountEmail: Text(
                'Email@gmail.com',
                style: TextStyle(fontFamily: 'Inter', fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://example.com/profile_image.jpg"),
              ),
            ),
          ),
        ],
      ),
      // child: ListView(
      //   children: [
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30, top: 50),
      //       leading: Icon(
      //         Icons.timer_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         'Create Timer',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30),
      //       leading: Icon(
      //         Icons.inbox_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         'Inbox',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30),
      //       leading: Icon(
      //         Icons.backpack_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         'Filtered Tasks',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30),
      //       leading: Icon(
      //         Icons.rocket_launch_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         'Integrations',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       title: Text(
      //         'Favorites',
      //         style: TextStyle(
      //           color: Colors.white.withOpacity(0.4),
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30),
      //       leading: Icon(
      //         Icons.monitor_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         'Deliwafa',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.only(left: 30),
      //       leading: Icon(
      //         Icons.source_outlined,
      //         color: Colors.white,
      //       ),
      //       title: Text(
      //         '12 RPL-2',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Inter',
      //           fontSize: 14,
      //         ),
      //       ),
      //       onTap: () => null,
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     Divider(
      //       color: Colors.white.withOpacity(0.4),
      //     ),
      //     ListTile(
      //       contentPadding: EdgeInsets.zero,
      //       title: UserAccountsDrawerHeader(
      //         accountName: Text(
      //           'Admin',
      //           style: TextStyle(fontFamily: 'Inter', fontSize: 18),
      //         ),
      //         accountEmail: Text(
      //           'Email@gmail.com',
      //           style: TextStyle(fontFamily: 'Inter', fontSize: 16),
      //         ),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage:
      //               NetworkImage("https://example.com/profile_image.jpg"),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
