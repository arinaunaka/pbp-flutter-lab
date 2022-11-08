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