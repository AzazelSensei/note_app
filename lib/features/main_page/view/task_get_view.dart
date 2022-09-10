// ignore_for_file: unused_field, depend_on_referenced_packages

import 'dart:async';

import 'package:note_app/common_libs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/core/components/default_action_pane.dart';
import 'package:note_app/core/components/default_button.dart';
import '../../../core/components/default_textfield.dart';
import '../cubit/task_delete_cubit/task_delete_cubit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TaskGetView extends StatefulWidget {
  const TaskGetView({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  State<TaskGetView> createState() => _TaskGetViewState();
}

class _TaskGetViewState extends State<TaskGetView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late final TaskDeleteCubit _taskDeleteCubit;
  late final TaskGetCubit _taskGetCubit;
  late final TaskPostCubit _taskPostCubit;

  Message? _selectNote;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _taskGetCubit = context.read<TaskGetCubit>();
    _taskPostCubit = context.read<TaskPostCubit>();
    _taskDeleteCubit = context.read<TaskDeleteCubit>();

    _taskGetCubit.taskGet();
  }

  Future<void> _onDeleted(TaskGetSuccess state, int index) async {
    await context.read<TaskDeleteCubit>().taskDelete(
          token: widget.token,
          id: state.message![index].id!.toInt(),
        );
    await EasyLoading.showSuccess('Delete Success!');
    await _taskGetCubit.taskGet();
  }

  void _beUpdate(TaskGetSuccess state, int index) {
    setState(() {
      _selectNote = state.message![index];
    });
    _pc.open();
    _titleController.text = _selectNote!.name!;
    _contentController.text = _selectNote!.body!;
  }

  Future<void> _onUpdate() async {
    await context.read<TaskUpdateCubit>().taskUpdate(
          token: widget.token,
          body: _contentController.text,
          id: _selectNote!.id!.toInt(),
          name: _titleController.text,
        );
    setState(() {
      _selectNote = null;
    });
    _taskGetCubit.taskGet();
    _clearText();
    _closeKeyboard();
    _pc.close();
    await EasyLoading.showSuccess('Update Success!');
  }

  void _forPost() async {
    await context.read<TaskPostCubit>().taskPost(
          token: widget.token,
          name: _titleController.text,
          body: _contentController.text,
        );
    _taskGetCubit.taskGet();
    _clearText();
    _closeKeyboard();
    _pc.close();
    await EasyLoading.showSuccess('Add Success!');
  }

  void _clearText() {
    _titleController.clear();
    _contentController.clear();
  }

  Widget spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : Colors.black12,
        ),
      );
    },
  );

  void _closeKeyboard() => FocusScope.of(context).unfocus();

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
        appBar: _appBar,
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                color: Colors.black,
                backgroundColor: Colors.white,
                onRefresh: () async => await _taskGetCubit.taskGet(),
                child: BlocBuilder<TaskGetCubit, TaskGetState>(
                  builder: _stateRouter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlidingUpPanel(
                controller: _pc,
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                minHeight: MediaQuery.of(context).size.height * 0.07,
                color: const Color.fromARGB(255, 32, 31, 31),
                collapsed: GestureDetector(
                  onTap: () => _pc.open(),
                  child: Center(
                    child: Icon(
                      _selectNote != null ? Icons.edit : Icons.add,
                      size: 40,
                    ),
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                panel: _slidingPanel,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stateRouter(context, state) {
    if (state is TaskGetLoading) {
      return Center(
        child: spinkit,
      );
    } else if (state is TaskGetSuccess) {
      return ListView.builder(
        itemCount: state.message?.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ObjectKey(index),
            closeOnScroll: false,
            startActionPane: DefaultActionPane(
              dismissible: DismissiblePane(
                onDismissed: () async => await _onDeleted(state, index),
              ),
              onPressed: (context) async => await _onDeleted(state, index),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            endActionPane: DefaultActionPane(
              onPressed: (context) {},
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            child: ListTile(
              title: Text(state.message?[index].name ?? ""),
              subtitle: Text(state.message?[index].body ?? ""),
              leading: const Icon(Icons.panorama_fish_eye_sharp),
            ),
          );
        },
      );
    } else if (state is TaskGetError) {
      return RefreshIndicator(
        color: Colors.black,
        backgroundColor: Colors.white,
        onRefresh: () async => await _taskGetCubit.taskGet(),
        child: Center(
          child: Text(state.statusCode.toString()),
        ),
      );
    } else {
      return const Center(
        child: SizedBox(),
      );
    }
  }

  AppBar get _appBar => AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text("My Notes"),
      );

  Padding get _slidingPanel => Padding(
        padding: context.lowHorPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextField(
              controller: _titleController,
              hintText: "Title",
              maxLines: null,
            ),
            DefaultTextField(
              controller: _contentController,
              hintText: "Content",
              maxLines: null,
            ),
            const CustomSpacer(),
            addButton,
          ],
        ),
      );

  Widget get addButton => DefaultButton(
        onPressed: () async {
          await context.read<TaskPostCubit>().taskPost(
                name: _titleController.text,
                body: _contentController.text,
              );
          _taskGetCubit.taskGet(token: widget.token);
          _clearText();
          _closeKeyboard();
          _pc.close();
        },
        text: "Add Task",
      );
}
