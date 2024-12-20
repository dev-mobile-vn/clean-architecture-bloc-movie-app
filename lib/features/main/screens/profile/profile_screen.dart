import 'package:flutter/material.dart';
import '../../../../core/common/contants/routers.dart';
import '../../../../core/common/translations/l10n.dart';
import '../../../../core/common/widgets/svg_widget.dart';
import 'widgets/menu_item.dart';
import 'widgets/menu_item_dark_mode.dart';
import 'widgets/menu_item_language.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SvgWidget(ic: 'assets/icons/ic_logo.svg'),
        title: Text('Profile',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            const AvatarAccount(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Andrew Ainsley',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text('andrew_ainsley@yourdomain.com', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 24,
            ),
            const AddPremium(),
            const SizedBox(
              height: 24,
            ),
            MenuItem(title: S.of(context).label_menu_edit_profile, icLeft: 'assets/icons/ic_person.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            MenuItem(title: S.of(context).label_menu_notification, icLeft: 'assets/icons/ic_noti.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            MenuItem(title: S.of(context).label_menu_download, icLeft: 'assets/icons/ic_download.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            MenuItem(title: S.of(context).label_menu_security, icLeft: 'assets/icons/ic_security.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            const MenuItemLanguage(),
            const SizedBox(
              height: 20,
            ),
            const MenuItemDarkMode(),
            const SizedBox(
              height: 20,
            ),
            MenuItem(title: S.of(context).label_menu_help_center, icLeft: 'assets/icons/ic_helper.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            MenuItem(
                title: S.of(context).label_menu_privacy_policy, icLeft: 'assets/icons/ic_person.svg', action: () {}),
            const SizedBox(
              height: 20,
            ),
            MenuItem(
                title: S.of(context).label_menu_log_out,
                icLeft: 'assets/icons/ic_person.svg',
                action: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 226,
                          padding: const EdgeInsets.only(top: 8),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SvgWidget(ic: 'assets/icons/ic_divider.svg'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Theme.of(context).primaryColor),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: Divider(),
                              ),
                              Text('Are you sure you want to log out?', style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red.withOpacity(0.5),
                                        minimumSize: Size((MediaQuery.sizeOf(context).width * 0.5 - 20), 46)),
                                    child: const Text('Cancel'),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Theme.of(context).primaryColor,
                                          minimumSize: Size((MediaQuery.sizeOf(context).width * 0.5 - 20), 46)),
                                      child: Text(
                                        'Yes, Logout',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                                      )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}

class AvatarAccount extends StatelessWidget {
  const AvatarAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://www.elleman.vn/wp-content/uploads/2022/05/07/213899/doctor-strange-2-elleman-2022.jpg'),
              fit: BoxFit.cover)),
    );
  }
}

class AddPremium extends StatelessWidget {
  const AddPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme
                .of(context)
                .colorScheme
                .primary, width: 1.5)),
        child: Row(
          children: [
            SvgWidget(
              ic: 'assets/icons/ic_ premium.svg',
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Join Premium!',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme
                        .of(context)
                        .colorScheme
                        .primary, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Enjoy watching Full-HD movies, without restrictions and without ads',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SvgWidget(
              ic: 'assets/icons/ic_arrow_right.svg',
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            )
          ],
        ),
      ),
    );
  }
}
