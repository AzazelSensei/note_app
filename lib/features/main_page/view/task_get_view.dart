import 'package:note_app/common_libs.dart';

class TaskGetView extends StatefulWidget {
  const TaskGetView({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<TaskGetView> createState() => _TaskGetViewState();
}

class _TaskGetViewState extends State<TaskGetView> {
  @override
  void initState() {
    super.initState();
    context.read<TaskGetCubit>().taskGet(token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Task Get"),
        ),
        body: const BlocBuilder<TaskGetCubit, TaskGetState>(
          builder: _builder,
        ),
      ),
    );
  }
}

Widget _builder(context, state) {
  if (state is TaskGetLoading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else if (state is TaskGetSuccess) {
    return Center(
      child: ListView.builder(
        itemCount: state.message?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.message?[index].body ?? ""),
            subtitle: Text(state.message?[index].name ?? ""),
          );
        },
      ),
    );
  } else if (state is TaskGetError) {
    return Center(
      child: Text(state.statusCode.toString()),
    );
  } else {
    return const Center(
      child: SizedBox(),
    );
  }
}
