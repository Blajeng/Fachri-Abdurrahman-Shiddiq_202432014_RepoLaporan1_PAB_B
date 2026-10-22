import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class HotelStay {
  final String hotelName;
  final String roomType;
  final String cityLocation;
  final String guestName;
  final String guestNim;
  final String notes;
  final double pricePerNight;
  final double rating;
  final int maxGuests;
  final int stayDurationNights;
  final bool hasFreeBreakfast;
  final bool isInstantConfirmation;

  const HotelStay({
    required this.hotelName,
    required this.roomType,
    required this.cityLocation,
    required this.guestName,
    required this.guestNim,
    required this.notes,
    required this.pricePerNight,
    required this.rating,
    required this.maxGuests,
    required this.stayDurationNights,
    required this.hasFreeBreakfast,
    required this.isInstantConfirmation,
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staycation Booking Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal.shade700,
          secondary: Colors.amber.shade700,
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F7F7),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,
          elevation: 3,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 3,
          shadowColor: const Color(0x33000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const LayarUtama(),
    );
  }
}


class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});


  static const List<HotelStay> hotelList = [

    HotelStay(
      hotelName: 'The Grand Luxury Heritage Suite',
      roomType: 'Presidential Suite King',
      cityLocation: 'Jakarta Pusat, DKI Jakarta',
      guestName: 'Fachri Abdurrahman Shiddiq',
      guestNim: '202432014',
      notes:
          'Termasuk akses VIP lounge, sarapan prasmanan internasional, dan panorama spektakuler cakrawala kota.',
      pricePerNight: 1850000.0,
      rating: 4.95,
      maxGuests: 2,
      stayDurationNights: 2,
      hasFreeBreakfast: true,
      isInstantConfirmation: true,
    ),

    HotelStay(
      hotelName: 'Padma Mountain Resort',
      roomType: 'Premier Hill View Family',
      cityLocation: 'Ciumbuleuit, Bandung',
      guestName: 'Fachri Abdurrahman Shiddiq',
      guestNim: '202432014',
      notes:
          'Dikelilingi lembah hijau nan asri dengan fasilitas kolam renang air hangat dan kebun kelinci ramah anak.',
      pricePerNight: 1450000.0,
      rating: 4.90,
      maxGuests: 4,
      stayDurationNights: 3,
      hasFreeBreakfast: true,
      isInstantConfirmation: true,
    ),

    HotelStay(
      hotelName: 'Ubud Rainforest Villa',
      roomType: 'Private Pool Jungle Villa',
      cityLocation: 'Gianyar, Bali',
      guestName: 'Fachri Abdurrahman Shiddiq',
      guestNim: '202432014',
      notes:
          'Suasana tropis hening dengan kolam renang pribadi menghadap rimbunnya hutan lembah Sungai Ayung.',
      pricePerNight: 2100000.0,
      rating: 4.85,
      maxGuests: 2,
      stayDurationNights: 2,
      hasFreeBreakfast: true,
      isInstantConfirmation: true,
    ),

    HotelStay(
      hotelName: 'Royal Malioboro Heritage',
      roomType: 'Classic Javanese Deluxe',
      cityLocation: 'Malioboro, Yogyakarta',
      guestName: 'Fachri Abdurrahman Shiddiq',
      guestNim: '202432014',
      notes:
          'Dekat Stasiun Tugu dan sentra kuliner gudeg legendaris, kental dengan nuansa arsitektur keraton tempo dulu.',
      pricePerNight: 850000.0,
      rating: 4.75,
      maxGuests: 3,
      stayDurationNights: 1,
      hasFreeBreakfast: false,
      isInstantConfirmation: true,
    ),

    HotelStay(
      hotelName: 'Pine Forest Sky Glamping',
      roomType: 'Luxury Safari Dome Tent',
      cityLocation: 'Cisarua, Puncak Bogor',
      guestName: 'Fachri Abdurrahman Shiddiq',
      guestNim: '202432014',
      notes:
          'Sensasi berkemah mewah di tengah hutan pinus sejuk lengkap dengan fasilitas api unggun malam hari.',
      pricePerNight: 980000.0,
      rating: 4.80,
      maxGuests: 4,
      stayDurationNights: 2,
      hasFreeBreakfast: true,
      isInstantConfirmation: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hotel, color: Colors.white),
            SizedBox(width: 8),
            Flexible(
              child: Text('Staycation Booking Hub', overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
      
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        itemCount: hotelList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: HotelReservationCard(booking: hotelList[index]),
            ),
          );
        },
      ),
    );
  }
}


class HotelReservationCard extends StatelessWidget {
  final HotelStay booking;

  const HotelReservationCard({
    super.key,
    required this.booking,
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.teal.shade100,
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 14,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.teal.shade200,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.hotel,
                size: 42,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 12),

            // 2. Nama Hotel
            Text(
              booking.hotelName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 15,
                  color: Colors.teal.shade600,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    booking.cityLocation,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.teal.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),
                const Text('•', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 6),
                const Icon(Icons.star, size: 15, color: Colors.amber),
                const SizedBox(width: 3),
                Text(
                  booking.rating.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Tipe Kamar
            Text(
              booking.roomType,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),

            
            Row(
              children: [
                
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.teal.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          size: 15,
                          color: Colors.teal.shade700,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${booking.maxGuests} Tamu',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal.shade900,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: booking.hasFreeBreakfast
                          ? Colors.amber.shade50
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: booking.hasFreeBreakfast
                            ? Colors.amber.shade300
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.free_breakfast,
                          size: 15,
                          color: booking.hasFreeBreakfast
                              ? Colors.amber.shade800
                              : Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            booking.hasFreeBreakfast ? 'Breakfast' : 'No Meal',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: booking.hasFreeBreakfast
                                  ? Colors.brown.shade800
                                  : Colors.grey.shade800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

               
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueGrey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Colors.blueGrey.shade700,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${booking.stayDurationNights} Malam',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey.shade900,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 5. Catatan / Deskripsi Fasilitas
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Text(
                '"${booking.notes}"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade800,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 12),

            
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    size: 16,
                    color: Colors.teal.shade700,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      'Tamu: ${booking.guestName} (${booking.guestNim})',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal.shade900,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Harga Reservasi per Malam
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Rp ${booking.pricePerNight.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '/ malam',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // 7. Tombol Aksi (ElevatedButton) Interaktif dengan Feedback SnackBar Dinamis
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Reservasi di ${booking.hotelName} berhasil dikonfirmasi untuk tamu ${booking.guestName}!',
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.teal.shade800,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                icon: const Icon(Icons.bookmark_added, size: 18),
                label: const Text(
                  'Konfirmasi Reservasi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
