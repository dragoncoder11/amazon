import 'package:amazon/core/utils/cashe_network.dart';
import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:amazon/features/auth/presentation/views/screens/login.dart';
import 'package:amazon/features/auth/presentation/views/screens/sign_up.dart';
import 'package:amazon/features/home/data/repos/home_repo_implement.dart';
import 'package:amazon/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:amazon/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:amazon/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:amazon/features/home/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:amazon/features/home/presentation/manager/product_cubit/products_cubit.dart';
import 'package:amazon/features/home/presentation/views/screens/details.dart';
import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:amazon/on_boarding.dart';
import 'package:amazon/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(AmazonApp());
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');
  print('usertoken is :$userToken');
}

class AmazonApp extends StatelessWidget {
  AmazonApp({super.key});
  HomeRepoImplement homeRepo = HomeRepoImplement();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => BannersCubit(homeRepo)..fetchBanners(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(homeRepo)..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(homeRepo)..fetchProducts(),
        ),
        BlocProvider(create: (context) => CartCubit(homeRepo)..fetchCarts()),
        BlocProvider(create: (context) => FavouritesCubit(homeRepo)..fetchFavourites()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: kScaffoldColor),
        debugShowCheckedModeBanner: false,
        routes: {
          Home.id: (context) => Home(),
          Splash.id: (context) => const Splash(),
          OnBoarding.id: (context) => OnBoarding(),
          SignUp.id: (context) => const SignUp(),
          Login.id: (context) => const Login(),
          Details.id: (context) => const Details(),
        },
        initialRoute: Splash.id,
      ),
    );
  }
}
