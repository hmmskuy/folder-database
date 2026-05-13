
## Note_app

A new Flutter project.

note_app_sqlite adalah aplikasi catatan sederhana berbasis Flutter yang terinspirasi dari Google Keep. Aplikasi ini memungkinkan pengguna untuk:

Menambahkan catatan Menyimpan data secara lokal menggunakan SQLite Mengedit catatan Menghapus catatan Menggunakan mode terang dan gelap (Light/Dark Mode)

Aplikasi dibuat menggunakan Flutter dan database lokal SQLite melalui package sqflite.

Tampilan Aplikasi
Halaman Home (Light Mode)
Pada halaman utama: Menampilkan daftar catatan Tombol tambah catatan (FloatingActionButton) Tombol ganti tema Card catatan seperti Google Keep 

<img width="409" height="852" alt="Screenshot 2026-05-13 091344" src="https://github.com/user-attachments/assets/f6293506-c9ec-432c-8859-0ad6add351bb" />
## 
Halaman Home (Dark Mode)
Fitur: Background hitam Card biru Tema otomatis berubah sesuai tombol mode Halaman Tambah Catatan

<img width="422" height="854" alt="Screenshot 2026-05-13 085236" src="https://github.com/user-attachments/assets/f7225a94-7e3a-49bd-91fd-084969439c7f" />

## Halaman Home (Light Mode)
Pada halaman utama: Menampilkan daftar catatan Tombol tambah catatan (FloatingActionButton) Tombol ganti tema Card catatan seperti Google Keep

<img width="416" height="854" alt="Screenshot 2026-05-13 085857" src="https://github.com/user-attachments/assets/224420e5-9dea-4005-bfcc-0beddb154255" />




## Halaman Ini di gunakan Untuk : 

Menulis judul catatan Menulis isi catatan Menyimpan data ke SQLite Tujuan Project

## Tujuan di buat Aplikasi ini : 
| Teknologi | Fungsi |
|------------|------------------------------|
| Flutter | Framework aplikasi |
| Dart | Bahasa pemrograman |
| SQLite | Database lokal |
| sqflite | Package SQLite Flutter |
| path | Mengatur lokasi database |
| path_provider | Mengambil folder penyimpanan |



## Penjelasan struktur kode :

## Folder models : 
Berisi model/data object aplikasi.

note_model.dart Digunakan untuk membuat struktur data catatan.

Contoh data: id title content author

## Folder pages :
Berisi halaman utama aplikasi.

home_page.dart Halaman utama untuk menampilkan semua catatan.

note_page.dart Halaman untuk menambah atau mengedit catatan.

## Folder services :
Berisi logic backend atau service aplikasi. database_helper.dart

Digunakan untuk: membuat database SQLite insert data update data delete data mengambil data

## Folder theme :
Berisi pengaturan tema aplikasi. app_theme.dart

Digunakan untuk: Light Mode Dark Mode warna aplikasi style text

## Folder widgets :
Berisi komponen widget yang digunakan ulang.

confirm_dialog.dart Dialog konfirmasi hapus data.

note_card.dart Widget card untuk menampilkan catatan seperti Google Keep.

## File main.dart
File utama aplikasi Flutter.

## Fungsi: 
menjalankan aplikasi memanggil halaman pertama mengatur theme aplikasi
