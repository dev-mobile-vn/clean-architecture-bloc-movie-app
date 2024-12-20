import 'package:movie_app/features/main/bloc/main_bloc.dart';
import 'package:movie_app/features/main/bloc/main_event.dart';
import 'package:movie_app/features/main/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/common/resource/icons.dart';
import '../../../core/common/translations/l10n.dart';
import '../../../core/common/widgets/svg_widget.dart';
import 'download/download_screen.dart';
import 'explore/presentation/sreen/explore_screen.dart';
import 'home/home_screen.dart';
import 'my_list/my_list_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        builder: (ctx, state) {
          return Scaffold(
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeScreen(),
                ExploreScreen(),
                MyListScreen(),
                DownloadScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: const SvgWidget(ic: kTabHome),
                  label: S.of(context).tab_home,
                  activeIcon: const SvgWidget(ic: kTabSelectedHome),
                ),
                BottomNavigationBarItem(
                  icon: const SvgWidget(ic: kTabExplore),
                  label: S.of(context).tab_explore,
                  activeIcon: const SvgWidget(ic: kTabSelectedExplore),
                ),
                BottomNavigationBarItem(
                    icon: const SvgWidget(ic: kTabMyList),
                    label: S.of(context).tab_my_list,
                    activeIcon: const SvgWidget(ic: kTabSelectedMyList)),
                BottomNavigationBarItem(
                    icon: const SvgWidget(ic: kTabDownload),
                    label: S.of(context).tab_download,
                    activeIcon: const SvgWidget(ic: kTabSelectedDownload)),
                BottomNavigationBarItem(
                    icon: const SvgWidget(ic: kTabProfile),
                    label: S.of(context).tab_profile,
                    activeIcon: const SvgWidget(ic: kTabSelectedProfile)),
              ],
              currentIndex: state.tabIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 14,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              selectedLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
              onTap: (index) {
                BlocProvider.of<MainBloc>(context).add(TabChangeEvent(index));
              },
            ),
          );
        },
        listener: (ctx, state) {
           _pageController.jumpToPage(state.tabIndex);
        });
  }
}
