import 'package:note_app/common_libs.dart';
import 'package:note_app/features/main_page/cubit/task_post_cubit/task_post_cubit.dart';

class TaskGetView extends StatefulWidget {
  const TaskGetView(
      {Key? key, required this.token, required this.noteRepository})
      : super(key: key);

  final String token;
  final NoteRepository noteRepository;

  @override
  State<TaskGetView> createState() => _TaskGetViewState();
}

class _TaskGetViewState extends State<TaskGetView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  void _onRefresh() =>
      context.read<TaskGetCubit>().taskGet(token: widget.token);

  void _clearText() {
    _titleController.clear();
    _contentController.clear();
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
    TextEditingController().clear();
  }

  final PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
        _pc.close();
      },
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TaskGetCubit, TaskGetState>(
                builder: _builder,
              ),
            ),
      ),
    );
  }

  Widget _builder(context, state) {
    if (state is TaskGetLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TaskGetSuccess) {
                child: ListTile(
                  title: Text(state.message?[index].name ?? ""),
                  subtitle: Text(state.message?[index].body ?? ""),
                  leading: const Icon(Icons.panorama_fish_eye_sharp),
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

  AppBar _appBar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      automaticallyImplyLeading: false,
      title: const Text("My Notes"),
    );
  }

  Padding _slidingPanel() {
    return Padding(
      padding: context.lowHorPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            maxLines: null,
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          TextFormField(
            maxLines: null,
            controller: _contentController,
            decoration: const InputDecoration(
              hintText: "Content",
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          const CustomSpacer(),
          addButton(context),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    return GFButton(
        borderShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          context.read<TaskPostCubit>().taskPost(
                token: widget.token,
                name: _titleController.text,
                body: _contentController.text,
              );
          _onRefresh();
          _clearText();
          _closeKeyboard();
          _pc.close();
        },
        text: "Add Task",
        textStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 15,
            fontWeight: FontWeight.bold),
        size: context.height * 0.05,
        fullWidthButton: true,
        color: const Color(0xFF937DC2));
  }
}
