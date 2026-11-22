
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Faraz Portfolio'),
          ),
        );
      },
    ),

    GoRoute(
      path: '/admin/login',
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Admin Login'),
          ),
        );
      },
    ),

    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Admin Dashboard'),
          ),
        );
      },
    ),
  ],
);
