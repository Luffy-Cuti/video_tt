import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/kakoak_api_service.dart';
import '../core/services/notification_service.dart';
import '../features/auth/bloc/auth_bloc.dart';
import '../features/auth/view/login_page.dart';
import '../features/channel/bloc/channel_bloc.dart';
import '../features/channel/view/channel_create_page.dart';
import '../features/channel/view/my_channel_page.dart';
import '../features/home/bloc/home_bloc.dart';
import '../features/home/view/home_page.dart';
import '../features/search/bloc/search_bloc.dart';
import '../features/search/view/search_page.dart';
import '../features/upload/bloc/upload_bloc.dart';
import '../features/upload/view/upload_page.dart';
import '../features/video/bloc/video_feed_bloc.dart';
import '../features/video/view/video_feed_page.dart';

class VideoApp extends StatelessWidget {
  const VideoApp({
    super.key,
    required this.apiService,
    required this.notificationService,
  });

  final KakoakApiService apiService;
  final NotificationService notificationService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => HomeBloc(apiService)..add(const HomeLoaded())),
        BlocProvider(create: (_) => SearchBloc(apiService)),
        BlocProvider(create: (_) => VideoFeedBloc(apiService)..add(const VideoFeedLoaded())),
        BlocProvider(create: (_) => ChannelBloc(apiService)),
        BlocProvider(create: (_) => UploadBloc(notificationService)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video TT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginPage(),
          '/main': (_) => const MainShell(),
          '/create-channel': (_) => const ChannelCreatePage(),
        },
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _pages = [
    HomePage(),
    SearchPage(),
    VideoFeedPage(),
    UploadPage(),
    MyChannelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.play_circle), label: 'Video'),
          NavigationDestination(icon: Icon(Icons.upload), label: 'Upload'),
          NavigationDestination(icon: Icon(Icons.person), label: 'My Channel'),
        ],
      ),
    );
  }
}