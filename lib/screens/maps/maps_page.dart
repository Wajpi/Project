import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF111827)),
        child: Stack(
          children: [
            // Background Map Image
            Positioned.fill(
              child: Image.network(
                "https://via.placeholder.com/1788x908",
                fit: BoxFit.cover,
              ),
            ),

            // Status Bar
            _buildStatusBar(),

            // Bottom Navigation Sheet
            Positioned(
              bottom: 0,
              child: _buildBottomSheet(context),
            ),

            // Interactive Buttons
            Positioned(
              top: screenHeight * 0.06,
              left: 16,
              right: 16,
              child: _buildInteractiveButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '9:41',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                _buildSignalIndicator(),
                const SizedBox(width: 5),
                _buildWifiIndicator(),
                const SizedBox(width: 5),
                _buildBatteryIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x2D000000),
            blurRadius: 50,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDepartureHeader(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildRiderCard(
                  name: 'Shruthi Sradi',
                  location: 'Ahmedabad Junction, Gujarat',
                  time: '08:05 AM',
                  distance: '3 km away-07 min ride',
                ),
                _buildDivider(),
                _buildRiderCard(
                  name: 'Neha Karam',
                  location: 'Ahmedabad Junction, Gujarat',
                  time: '08:10 AM',
                  distance: '7 km away-10 min ride',
                ),
                _buildDivider(),
                _buildRiderCard(
                  name: 'Ahmedabad Junction',
                  location: 'Gujarat',
                  time: '09:00 AM',
                  distance: '14 km away-25 min ride',
                ),
              ],
            ),
          ),
          _buildStartRideButton(),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildInteractiveButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(Icons.menu),
        _buildInstantRideButton(),
        _buildIconButton(Icons.settings),
      ],
    );
  }

  // Reusable Components
  Widget _buildSignalIndicator() {
    return Container(
      width: 18,
      height: 10,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://via.placeholder.com/18x10"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildWifiIndicator() {
    return Container(
      width: 15.27,
      height: 10.97,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://via.placeholder.com/15x11"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildBatteryIndicator() {
    return Container(
      width: 26.98,
      height: 13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildRiderCard({
    required String name,
    required String location,
    required String time,
    required String distance,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 15,
        backgroundImage: NetworkImage("https://via.placeholder.com/30x30"),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(location),
          Text(
            distance,
            style: TextStyle(
              color: const Color(0xFF667084).withOpacity(0.8),
              fontSize: 10,
            ),
          ),
        ],
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFEAECF0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: const TextStyle(
            color: Color(0xFF667084),
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Divider(color: Color(0xFFCFD4DC), height: 1),
    );
  }

  Widget _buildStartRideButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4BBDD8),
              minimumSize: const Size(double.infinity, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Start Ride',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'As soon ride starts your location will be shared with the passengers.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF98A1B2),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, size: 24),
    );
  }

  Widget _buildInstantRideButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.directions_car, color: Color(0xFF4BBDD8)),
          const SizedBox(width: 10),
          Text(
            'Instant Ride',
            style: TextStyle(
              color: const Color(0xFF4BBDD8),
              fontSize: 16 * MediaQuery.textScaleFactorOf(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

