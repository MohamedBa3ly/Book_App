import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/navigation/screens.dart';
import 'package:book_app/ui/details/cubits/similar_books_cubit.dart';
import 'package:book_app/ui/home/cubits/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:book_app/ui/home/cubits/featured_cubit/featured_books_cubit.dart';
import 'package:book_app/ui/home/data/model/book_model.dart';
import 'package:book_app/ui/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/utils/app_colors.dart';
import '../ui/details/details_screen.dart';
import '../ui/home/data/repository/home_repository_impl.dart';
import '../ui/home/home_screen.dart';
import '../ui/splash/splash_screen.dart';



//Nav Graph For go route if you use:
class NavGraph extends StatelessWidget {
  const NavGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepositoryImpl>())..fetchFeaturedBooks()
        ),
        BlocProvider(create: (context) => BestSellerBooksCubit(getIt.get<HomeRepositoryImpl>())..fetchBestSellerBooks()
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: appColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: InitialScreens.splash,
  routes: [
    GoRoute(
      path: InitialScreens.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: BottomNavigationScreen.home.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: InitialScreens.details,
      builder: (context, state) => BlocProvider(
  create: (context) => SimilarBooksCubit(getIt.get<HomeRepositoryImpl>()),
  child: DetailsScreen(bookModel: state.extra as BookModel),
),
    ),
    GoRoute(
      path: InitialScreens.search,
      builder: (context, state) => SearchScreen(),
    ),
  ],
);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Add Bottom navigation screen
  final List<Widget> _pages = [
    // Add your actual screens here

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ''),
        ],
        selectedItemColor: Colors.black26,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}



//Nav Graph For Git if you use: (For Learning)
// class NavGraph extends StatelessWidget {
//   const NavGraph({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: InitialScreens.splash,
//       getPages: [
//         GetPage(name: InitialScreens.splash, page: () => SplashScreen()),
//         GetPage(name: BottomNavigationScreen.home.route, page: () => const MainScreen()),
//         GetPage(name: InitialScreens.details, page: () => DetailsScreen()),
//
//       ],
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: appColor,
//         textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
//       ),
//     );
//   }
// }
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final NavController navController = Get.put(NavController());
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Obx(() => navController.pages[navController.selectedIndex.value]),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: navController.selectedIndex.value,
//         onTap: (index) {
//           navController.changePage(index);
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ''),
//         ],
//         selectedItemColor: Colors.black26,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }


