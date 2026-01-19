import SwiftUI

// 1. Model Data
struct ItemWisata: Identifiable {
    let id = UUID()
    let nama: String
    let deskripsi: String
    let lokasi: String
    let gambar: String // Nama file di Assets
}

// 2. Data (Minimal 10 Item)
let daftarWisata = [
    ItemWisata(nama: "Candi Borobudur", deskripsi: "Candi Buddha terbesar di dunia yang terletak di Magelang.", lokasi: "Jawa Tengah", gambar: "borobudur"),
    ItemWisata(nama: "Pulau Komodo", deskripsi: "Habitat asli hewan purba Komodo yang dilindungi.", lokasi: "NTT", gambar: "komodo"),
    ItemWisata(nama: "Raja Ampat", deskripsi: "Surga bawah laut dengan keanekaragaman hayati tertinggi.", lokasi: "Papua Barat", gambar: "raja_ampat"),
    ItemWisata(nama: "Gunung Bromo", deskripsi: "Gunung berapi aktif dengan pemandangan matahari terbit yang ikonik.", lokasi: "Jawa Timur", gambar: "bromo"),
    ItemWisata(nama: "Tanah Lot", deskripsi: "Pura di atas batu karang besar yang menghadap samudra.", lokasi: "Bali", gambar: "tanah_lot"),
    ItemWisata(nama: "Danau Toba", deskripsi: "Danau vulkanik terbesar di dunia dengan pulau di tengahnya.", lokasi: "Sumatera Utara", gambar: "toba"),
    ItemWisata(nama: "Wakatobi", deskripsi: "Taman nasional dengan keindahan terumbu karang yang luar biasa.", lokasi: "Sulawesi Tenggara", gambar: "wakatobi"),
    ItemWisata(nama: "Kawah Ijen", deskripsi: "Terkenal dengan fenomena api biru (blue fire) yang langka.", lokasi: "Jawa Timur", gambar: "ijen"),
    ItemWisata(nama: "Tana Toraja", deskripsi: "Wisata budaya dengan tradisi pemakaman yang unik.", lokasi: "Sulawesi Selatan", gambar: "toraja"),
    ItemWisata(nama: "Ngarai Sianok", deskripsi: "Lembah curam dengan pemandangan alam yang hijau dan indah.", lokasi: "Sumatera Barat", gambar: "sianok")
]

// 3. Tampilan Utama
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(daftarWisata) { item in
                NavigationLink(destination: DetailPage(wisata: item)) {
                    HStack {
                        // Thumbnail
                        Image(systemName: "map.fill") // Placeholder
                            .frame(width: 50, height: 50)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text(item.nama).font(.headline)
                            Text(item.lokasi).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Wisata Indonesia")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AboutPage()) {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

// 4. Halaman Detail
struct DetailPage: View {
    let wisata: ItemWisata
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                // Gambar Utama (Layout Anchor/Auto Layout otomatis di SwiftUI)
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 250)
                    .overlay(Text("Foto \(wisata.nama)"))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(wisata.nama).font(.largeTitle).bold()
                    Text(wisata.lokasi).font(.title3).foregroundColor(.blue)
                    Divider()
                    Text("Deskripsi").font(.headline)
                    Text(wisata.deskripsi).font(.body)
                }
                .padding()
            }
        }
        .navigationTitle(wisata.nama)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 5. Halaman About (Profil)
struct AboutPage: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(jas.png)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 50)
            
            Text("Ahmad Reyhan Yusufa") 
                .font(.title).bold()
            Text("harey355@gmail.com")
                .font(.body)
            
            Spacer()
        }
        .navigationTitle("Profil Saya")
    }
}