import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/VerificationCertificate_model.dart';

/// The main screen that displays a list of certificates.
class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({Key? key}) : super(key: key);

  // Mock data for the prototype. In the real app, this would come from Firebase.
  static final List<VerificationCertificate> _certificates = [
    VerificationCertificate(
      id: 'VC-FRMP-2025-A1B2C3',
      title: 'Agroforestry: 50 Trees Planted',
      date: 'Aug 28, 2025',
      impactValue: '0.25',
      impactUnit: 'tCO₂e Sequestered',
      icon: Icons.forest,
    ),
    VerificationCertificate(
      id: 'VC-FRMP-2025-D4E5F6',
      title: 'Rice: 15-Day AWD Cycle',
      date: 'Aug 15, 2025',
      impactValue: '1.20',
      impactUnit: 'tCO₂e Reduced',
      icon: Icons.water_drop,
    ),
    VerificationCertificate(
      id: 'VC-FRMP-2025-G7H8I9',
      title: 'Agroforestry: 25 Trees Planted',
      date: 'Jul 10, 2025',
      impactValue: '0.12',
      impactUnit: 'tCO₂e Sequestered',
      icon: Icons.forest,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Certificates',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _certificates.length,
        itemBuilder: (context, index) {
          return _CertificateCard(certificate: _certificates[index]);
        },
      ),
      //  bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     currentIndex: 1, // Set to 'Certificates'
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: const Color(0xFF22C55E),
  //     unselectedItemColor: const Color(0xFF64748B),
  //     selectedFontSize: 12,
  //     unselectedFontSize: 12,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //       BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in), label: 'Certificates'),
  //       BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'Market'),
  //       BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined), label: 'Advisor'),
  //     ],
  //   );
  // }
}

/// A reusable widget that displays a single certificate card.
class _CertificateCard extends StatelessWidget {
  final VerificationCertificate certificate;

  const _CertificateCard({required this.certificate, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  certificate.icon,
                  color: const Color(0xFF16A34A),
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    certificate.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF1E293B), // slate-800
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  'Quantified Impact',
                  certificate.impactValue,
                  certificate.impactUnit,
                ),
                _buildInfoColumn('Verification Date', certificate.date, null),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.verified_user_outlined, size: 18),
                label: const Text('View Evidence'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF3B82F6), // blue-500
                  side: BorderSide(color: Colors.grey[300]!),
                ),
                onPressed: () {
                  // In a real app, this would open a new screen showing the
                  // farmer's photo, the satellite image, and the AI's reasoning.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Showing evidence for ${certificate.id}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, String? unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF64748B), // slate-500
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0F172A), // slate-900
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (unit != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  unit,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
