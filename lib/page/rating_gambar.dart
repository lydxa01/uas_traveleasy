class Lokasi1 {
  final String image;
  final double rating;
  final String nama;
  final String lokasi;
  Lokasi1({
    required this.image,
    required this.rating,
    required this.nama,
    required this.lokasi,
  });
}

List<Lokasi1> alam1 = [
  Lokasi1(
    lokasi: "Maluku, Indonesia",
    image: "assets/neira.png",
    rating: 5.0,
    nama: "Banda Neira",
  ),
  Lokasi1(
    lokasi: "Papua, Indonesia",
    image: "assets/ja4.jpg",
    rating: 4.9,
    nama: "Raja Ampat",
  ),
  Lokasi1(
    lokasi: "Jawa Tengah, Indonesia",
    image: "assets/merbabu.png",
    rating: 4.9,
    nama: "Gunung Merbabu",
  ),
  Lokasi1(
    lokasi: "Bali, Indonesia",
    image: "assets/bali.jpg",
    rating: 4.8,
    nama: "Danau Beratan",
  ),
];


class Lokasi2 {
  final String id;
  final String image;
  final double rating;
  final String nama;
  final String lokasi;
  final String deskripsi; // Allow deskripsi to be null

  Lokasi2({
    this.id = "",
    required this.image,
    required this.rating,
    required this.nama,
    required this.lokasi,
    this.deskripsi = "", // No default value
  });
}

List<Lokasi2> alam2 = [
  Lokasi2(
    id: "1",
    lokasi: "Bali, Indonesia",
    image: "assets/bali.jpg",
    rating: 4.8,
    nama: "Danau Beratan",
    deskripsi: "Tersedia pula wisata lainnya seperti Danau Suci dan Danau Kecamatan tertentu",
  ),
  Lokasi2(
    id: "2",
    lokasi: "Gunung Sumbing",
    image: "assets/sumbing.png",
    rating: 4.8,
    nama: " Indonesia",
    deskripsi: "Ada Gunung"

  ),
  Lokasi2(
    id: "3",
    lokasi: "Papua, Indonesia",
    image: "assets/ja4.jpg",
    rating: 4.9,
    nama: "Raja Ampat",
    deskripsi: "Tersedia pula wisata lainnya seperti Danau Suci dan Danau Kecamatan tertentu"
  ),
  Lokasi2(
    id: "4",
    lokasi: "Jawa Tengah, Indonesia",
    image: "assets/merbabu.png",
    rating: 4.9,
    nama: "Gunung Merbabu",
    deskripsi: "Tersedia pula wisata lainnya seperti Danau Suci dan Danau Kecamatan tertentu"
  ),
];