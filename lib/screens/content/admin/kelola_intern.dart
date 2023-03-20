import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:internshiplink/services/intern_service.dart';

class KelolaIntern extends StatefulWidget {
  const KelolaIntern({super.key});

  @override
  State<KelolaIntern> createState() => _KelolaInternState();
}

class _KelolaInternState extends State<KelolaIntern> {
  List<Map<String, dynamic>>? supervisors;
  List<Map<String, dynamic>>? interns;

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    'Kelola Pengguna',
    style: TextStyle(color: EVColor.primary),
  );

  @override
  void initState() {
    super.initState();
    getIntern();
    // getInterns();
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
      backgroundColor: EVColor.neutral10,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              if (interns != null)
                Wrap(
                  children: List.generate(interns!.length, (i) {
                    InternModel internModel = InternModel.fromJson(interns![i]);
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral30)),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.amber),
                            height: 50,
                            width: 50,
                            child: const Center(child: Text('nama')),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(internModel.user!.name,
                              style: TextStyle(fontSize: 12)),
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
