import 'package:flutter/material.dart';
import 'package:quiz_app/drivers/repo_shared_pref.dart';
import 'package:quiz_app/presentation/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String appbarTitle;
  const CustomAppbar({
    Key? key,
    required this.appbarTitle,
  }) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

  Future<void> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final val = prefs.getBool("isLoggedIn") ?? false;
    setState(() {
      isLoggedIn = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo.shade400,
      leading: const Icon(Icons.contact_support_outlined),
      title: Text(widget.appbarTitle),
      actions: [
        isLoggedIn
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.logout_outlined),
                  onPressed: () async {
                    await Auth.logout();
                    if (!mounted) return;
                    LoginScreen.navigate(context);
                  },
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
