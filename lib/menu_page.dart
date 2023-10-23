import 'package:flutter/material.dart';
import 'menu.dart';
import 'pesan_page.dart';

//ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  List<Menu> listMenu = [];
  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'sempolan',
        deskripsi: "sempolan ayam",
        harga: 10000,
        gambar: 'sempolan1.jpg'));
    listMenu.add(Menu(
        nama: "bakso bakar",
        deskripsi: "bakso bakar ayam",
        harga: 12000,
        gambar: 'baksobakar1.jpg'));
    listMenu.add(Menu(
        nama: "nugget",
        deskripsi: "nugget ikan",
        harga: 18000,
        gambar: 'nugget1.jpg'));
    listMenu.add(Menu(
        nama: "kaki naga",
        deskripsi: "dari ayam",
        harga: 10000,
        gambar: 'kakinaga1.jpg'));
    listMenu.add(Menu(
        nama: "jus alpukat",
        deskripsi: "dari buah alpukat pilihan",
        harga: 8000,
        gambar: 'jusalpukat1.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Menu Makanan')),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          child: Text("Pilih Menu"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listMenu.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading:
                      Image.asset('assets/images/${listMenu[index].gambar}'),
                  title: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(listMenu[index].nama)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listMenu[index].deskripsi),
                      Text("Rp. ${listMenu[index].harga}")
                    ],
                  ),
                  trailing: ElevatedButton(
                    child: const Text("Pesan"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PesanPage(pesananMenu: listMenu[index])));
                    },
                  ),
                );
              }),
        )
      ]),
    );
  }
}
