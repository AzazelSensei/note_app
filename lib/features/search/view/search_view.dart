import 'dart:async';

import 'package:note_app/core/init/theme/colors_manager.dart';

import '../../../common_libs.dart';
import '../search_cubit/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _search = TextEditingController();

  var debounce = Timer(const Duration(milliseconds: 500), () {});
  void handleSearch(String value) {
    debounce.cancel();
    setState(() {
      debounce = Timer(const Duration(milliseconds: 500), () {
        context.read<SearchCubit>().search(name: _search.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.greyColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: TextField(
          controller: _search,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            handleSearch(value);
          },
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return const Center(
              child: Text('Search'),
            );
          } else if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchLoaded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.message!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.message![index].name),
                  subtitle: Text(state.message![index].body),
                );
              },
            );
          } else if (state is SearchError) {
            return const Center(
              child: Text('Not Found'),
            );
          } else {
            return const Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}
