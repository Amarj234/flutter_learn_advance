import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ado/screens/board_config/available_boards.dart';
import 'package:ado/screens/board_config/wifi_ios.dart';
import 'package:ado/screens/home/bloc/tab_bloc.dart';
import 'package:ado/screens/home/bloc/tab_event.dart';
import 'package:ado/screens/home/bloc/tab_state.dart';
import 'package:ado/screens/home/home_screen.dart';
import 'package:ado/screens/rooms/bloc/room_bloc.dart';
import 'package:ado/screens/rooms/bloc/room_event.dart';
import '../schedule/schedule_page.dart';

class StayBottomNavigationBar extends StatefulWidget {
  final int? index;
  const StayBottomNavigationBar({super.key, this.index});

  @override
  State<StayBottomNavigationBar> createState() => _StayBottomNavigationBarState();
}

class _StayBottomNavigationBarState extends State<StayBottomNavigationBar> {
  final Color brownColor = const Color(0xFFD19C68);
  DateTime? _lastBackPressed;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
        (index) => GlobalKey<NavigatorState>(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      context.read<TabBloc>().add(TabEvent.getTabs(widget.index!));
    }
    BlocProvider.of<RoomBloc>(context).add(RoomEvent.getRooms());
  }

  Future<bool> _onWillPop() async {
    final currentIndex = context.read<TabBloc>().state.currentIndex;
    final NavigatorState currentNavigator = _navigatorKeys[currentIndex].currentState!;

    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    final now = DateTime.now();
    final shouldExit = _lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2);
    _lastBackPressed = now;

    if (shouldExit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                _buildNavigator(0, const HomeScreen()),
                _buildNavigator(1, const AvailableDevices() ),
                _buildNavigator(2, const SchedulePage()),
                _buildNavigator(3, const SettingsPage()), // your custom settings widget
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                if(index==state.currentIndex){

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const StayBottomNavigationBar()),
                    (route) => false,
                  );
                }else {
                  context.read<TabBloc>().add(TabEvent.getTabs(index));
                }
              },
              selectedItemColor: brownColor,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.device_thermostat), label: "Devices"),
                BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label: "Schedule"),
                BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    print(index);
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => child,
          settings: settings,
        );
      },
    );
  }
}

// Dummy Settings Page for example
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(child: Text("Settings Page")),
    );
  }
}
