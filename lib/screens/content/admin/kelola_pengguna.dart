import 'package:flutter/material.dart';
import 'package:internshiplink/models/models.dart';
import 'package:internshiplink/services/supervisor_service.dart';
import 'package:internshiplink/services/user_service.dart';

import '../../../component/ev_color.dart';
import '../../../services/intern_service.dart';

class KelolaPengguna extends StatefulWidget {
  const KelolaPengguna({super.key});

  @override
  State<KelolaPengguna> createState() => _KelolaPenggunaState();
}

class _KelolaPenggunaState extends State<KelolaPengguna> {
  List<Map<String, dynamic>>? supervisors;
  List<Map<String, dynamic>>? users;
  List<Map<String, dynamic>>? interns;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    'Kelola Pengguna',
    style: TextStyle(color: EVColor.primary),
  );

  @override
  void initState() {
    super.initState();

    getUser();
    getIntern();
    getSupervisor();
    // getInterns();
  }

  Future getUser() async {
    List<Map<String, dynamic>>? result = await UserService().getUsers();

    if (result != null) {
      setState(() {
        users = result;
      });
    }
  }

  Future getSupervisor() async {
    List<Map<String, dynamic>>? result =
        await SupervisorService().getSupervisors();

    if (result != null) {
      setState(() {
        supervisors = result;
      });
    }
  }

  Future getIntern() async {
    List<Map<String, dynamic>>? result = await InternService().getInterns();

    if (result != null) {
      setState(() {
        interns = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColor.neutral10,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = const ListTile(
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'cari sesuai nama...',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      );
                    } else {
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text(
                        'Kelola Pengguna',
                        style: TextStyle(color: EVColor.primary),
                      );
                    }
                  });
                },
                child: customIcon,
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
        title: customSearchBar,
        backgroundColor: EVColor.neutral10,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              if (users != null)
                Wrap(
                  children: List.generate(users!.length, (i) {
                    UserModel userModel = UserModel.fromJson(users![i]);
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral30)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(userModel.name, style: TextStyle(fontSize: 12)),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_square),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          )
                        ],
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
