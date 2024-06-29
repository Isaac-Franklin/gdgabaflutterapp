import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgcommapp/communities/bloc/all_nav_bloc_bloc.dart';

class NavItem extends StatelessWidget {
  final String title;

  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation tap
        print('$title tapped');
        context.read<AllNavBlocBloc>().add(CommunityChanged(title));
        // if (title == 'Lagos') {
        //   context.read<AllNavBlocBloc>().add(CommunityChanged(title));
        //   print('LAGOS WAS JUST CLICKED');
        // }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.black,
          // color: const Color.fromRGBO(237, 72, 59, 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
