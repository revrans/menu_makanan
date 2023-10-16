import 'package:flutter/material.dart';
import 'menu.dart';
import 'pesan_page.dart';

//ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  List<Menu> listMenu = [];
  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'Sate Ayam',
        deskripsi: "Sate yang dibuat dari Ayam",
        harga: 20000,
        gambar: 'Sate.jpg'));
    listMenu.add(Menu(
        nama: "Soto Ayam",
        deskripsi: "Soto ayam gurih kuah kental kentul",
        harga: 15000,
        gambar: 'Soto-Ayam-Kuning.jpg'));
    listMenu.add(Menu(
        nama: "Bubur Ayam",
        deskripsi: "Bubur Ayam Jakarta",
        harga: 18000,
        gambar: 'Bubur-Ayam.jpg'));
    listMenu.add(Menu(
        nama: "Steak",
        deskripsi: "Steak ala Waroeng",
        harga: 25000,
        gambar: 'Steak-enak.jpg'));
    listMenu.add(Menu(
        nama: "Es Teh Ajib",
        deskripsi: "Es Teh Ajib segar menyegarkan #estehajib",
        harga: 3000,
        gambar: 'Estehajib-Jumbo.jpg'));
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
