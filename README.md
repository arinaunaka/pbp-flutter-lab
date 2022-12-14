# **Tugas 7: counter_7**

## Stateless Widget dan Stateful Widget
- Stateless widget adalah widget yang tidak membutuhkan state yang bisa berubah.
- Stateful widget adalah widget yang memiliki state yang bisa berubah, sehingga dapat memengaruhi tampilannya.
- Perbedaan keduanya ialah **stateless widget bersifat statis**, sedangkan **stateful widget bersifat dinamis**.

## Widget dan Fungsinya
- `MaterialApp`: widget untuk membuat aplikasi yang menggunakan Material Design.
- `Scaffold`: widget untuk menerapkan struktur layout visual Material Design.
- `AppBar`: widget untuk membuat bilah aplikasi Material Design.
- `Text`: widget untuk menampilkan sebuah teks.
- `Center`: widget untuk memusatkan posisi anaknya (widget child) di dalam dirinya sendiri.
- `Column`: widget untuk menampilkan anak-anaknya (widget children) dalam bentuk vertikal.
- `Padding`: widget untuk menyisipkan anaknya (widget child) dengan padding yang diberikan. 
- `Row`: widget untuk menampilkan anakn-anaknya (widget children) dalam bentuk horizontal.
- `FloatingActionButton`: widget untuk membuat tombol aksi melingkar yang mengambang.
- `Icon`: widget untuk menggunakan icon yang telah disediakan.
- `Spacer`: widget untuk membuat *space* fleksibel yang dapat digunakan untuk mengatur jarak antar widget dalam container Flex, seperti Row atau Coloumn.

## Fungsi dari `setState()`
`setState()` berfungsi untuk memberitahukan pada framework bahwa terdapat perubahan dalam internal state dari suatu objek.
Variabel yang dapat terdampak dengan fungsi tersebut adalah semua variabel pada class tersebut, kecuali yang bersifat `final` atau `const` (*immutable*). 

## Perbedaan antara `const` dan `final`
Keduanya dapat digunakan untuk membuat variabel yang bersifat immutable. Namun, perbedaannya adalah `const` mengharuskan variabel harus sudah memiliki nilai yang bersifat konstan saat dikompilasi, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung / eskplisit pada saat kompilasi.

## Implementasi Checklist
1. Membuat flutter app baru dengan syntax `flutter create counter_7`.
2. Menambahkan dua Floating Action Button yang berfungsi tombol + dan tombol - dalam Row.
3. Menambahkan fungsi `_decrementCounter` yang mengurangi angka sebanyak satu satuan dan di-set sebagai `onPressed` pada tombol -, sedangkan fungsi `_incrementCounter` yang menambahkan angka sebanyak satu satuan di-set sebagai `onPressed` pada tombol +.
4. Dengan menggunakan if-else, jika counter bernilai genap maka Text yang akan ditampilkan adalah GENAP dengan `style` berwarna merah, dan jika counter bernilai ganjil maka Text yang akan ditampilkan adalah GANJIL dengan `style` berwarna biru.
5. Bonus: dengan menggunakan if, jika counter bernilai 0, maka tombol yang ditampilkan hanya tombol + saja.


# **Tugas 8: Flutter Form**

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` akan menambahkan rute/page baru diatas page sebelumnya (tanpa menghapus yang sebelumnya), sehingga seperti tumpukan layer page. Sedangkan, `Navigator.pushReplacement` akan me-*replace* page saat ini dengan page yang baru. 

## Widget dan Fungsinya
- `Drawer`: widget untuk membuat drawer Material Design.
- `ListTile`: widget untuk membuat list tile.
- `Navigator`: widget yang mengelola sekumpulan child widget dengan prinsip stack.
- `TextEditingController`: widget untuk membuat controller untuk text field yang dapat diedit.
- `Form`: widget yang membuat container untuk form field.
- `Container`: widget yang berfungsi sebagai container untuk menampung widget lainnya.
- `TextFormField`: widget untuk membuat form field yang berisi Text Field.
- `SizedBox`: widget untuk membuat fixed size box.
- `DropdownButtonFormField`: widget untuk membuat widget DropdownButton yang dibungkus dengan InputDecorator.
- `TextButton`: widget untuk membuat text button.
- `Align`: widget untuk membuat penyelarasan widget.
- `ListView`: widget untuk membuat array widget linier yang scrollable dari sebuah list.
- `Card`: widget untuk membuat card Material Design.

## Jenis-jenis Event pada Flutter
- `onPressed`
- `onChanged`
- `onSaved`
- `onTap`
- `onPressed`
- `onLongPress`
- `onSubmitted`
- `onEditingComplete`
- `onLoading`
- `onRefresh`
- `onPointerMove`

## Cara Kerja `Navigator`
`Navigator` bekerja seperti stack, yaitu menggunakan prinsip LIFO (Last-In, First-Out) dimana layar yang ditampilkan saat ini adalah page yang berada di top of stack dari stack page (tumpukan layar) tersebut. 

## Implementasi Checklist
1. Bonus: membuat drawer.dart yang berisikan Drawer dengan 3 tombol navigasi, yaitu halaman counter (`main.dart`), halaman form (`form.dart`), halaman yang menampilkan data budget (`databudget.dart`).
2. Menambahkan drawer ke tiap file-file: `main.dart`, `form.dart`, dan `databudget.dart`.
3. Membuat `budget.dart` untuk model Budget.
4. Membuat `form.dart` yang berisikan form field untuk diisi user dengan `TextFormField` untuk judul dan nominal budget, `DropdownButtonFormField` untuk jenis budget, `showDatePicker` untuk date budget (bonus), dan `TextButton` untuk menyimpan budget ke dalam list budget dan menampilkan datanya dalam sebuah pop up dialog. 
5. Membuat `databudget.dart` untuk mengambil data budget dari list budget dan menampilkannya dalam bentuk card.

# **Tugas 9: Integrasi Web Service pada Flutter**

## Pengambilan Data JSON Tanpa Membuat Model
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Akan tetapi cara ini tidak lebih baik dibandingkan membuat model sebelum melakukan pengambilan data JSON, karena strukturnya tidak sesuai dengan apa yang diinginkan dan kita tidak dapat mengakses datanya sebagai sebuah "class" sehingga lebih sulit digunakan dan kurang efisien.

## Widget dan Fungsinya
- `Checkbox`: widget untuk membuat checkbox Material Design.
- `FutureBuilder`: widget yang membangun dirinya sendiri berdasarkan snapshot interaksi terbaru dengan [Future].
- `ElevatedButton`: widget untuk membuat elevated button untuk tombol Back.
- `AsyncSnapshot`: widget yang merupakan representasi *immutable* sebagai hasil terbaru dari event asinkronus.
- `CircularProgressIndicator`: widget untuk membuat indikator kemajuan melingkar (lingkaran berputar).
- `MaterialPageRoute`: widget untuk membuat MaterialPageRoute yang isinya ditentukan oleh [Builder].
- `ListView`: widget untuk membuat array widget linier yang scrollable dari sebuah list.

## Mekanisme Pengambilan Data dari JSON Hingga Ditampilkan pada Flutter
1. Menambahkan *dependency* `http`, *dependency* ini digunakan untuk bertukar data melalui *HTTP request*.
2. Membuat model yang sesuai dengan JSON yang akan diambil.
3. Membuat *HTTP request* menggunakan *dependency* `http`, yaitu method GET.
4. *Decode* data JSON kemudian konversi sesuai dengan model yang telah dibuat.
5. Menampilkan data yang telah dikonversi pada Flutter dengan memanfaatkan `FutureBuilder`.

## Implementasi Checklist
1. Membuat `mywatchlist_page.dart` untuk halaman *mywatchlist* yang berisikan semua *watch list*.
2. Menambahkan routing pada drawer ke halaman *mywatchlist* (`mywatchlist_page.dart`).
3. Menambahkan *dependency* `http` untuk melakukan fetch data.
4. Membuat `mywatchlist.dart` untuk model *mywatchlist*.
5. Membuat `fetch_watchlist.dart` untuk function fetch data dari Tugas 3. 
6. Menggunakan function fetch data untuk mendapatkan data *watch list*.
7. Data yang didapatkan akan di-*loop* dan ditampilkan sebagai *container* pada halaman semua *watch list*.
8. Membuat `mywatchlist_detail.dart` untuk halaman detail *watch list*.
9. Mengatur routing dari setiap judul *watch list* ke halaman detail yang bersesuaian ketika *container* dipencet.