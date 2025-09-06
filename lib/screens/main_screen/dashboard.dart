import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // late final InternetProvider internet;

  // @override
  // void initState() {
  //   super.initState();
  //   internet = Provider.of<InternetProvider>(context, listen: false);
  //   internet.checkinternet().then((isConnected) {
  //     if (!isConnected) {
  //       Navigator.of(
  //         context,
  //       ).push(MaterialPageRoute(builder: (ctx) => NoconnectionScreen()));
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   internet.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("FarmGuard"),
          centerTitle: false,
          leading: Icon(Icons.menu),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Handle notifications
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildClimateImpactCard(),
                const SizedBox(height: 24),
                _buildActionButtons(),
                const SizedBox(height: 24),
                const Text(
                  'Recent Activities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 12),
                _buildRecentActivitiesList(),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}

/// Builds the top card showing the total climate impact.
Widget _buildClimateImpactCard() {
  return const Center(
    child: Column(
      children: [
        Text(
          'Total Climate Impact',
          style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
        ),
        SizedBox(height: 4),
        Text(
          '12.5 tCO₂e',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF16A34A), // green-600
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Equivalent Carbon Sequestered',
          style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
        ),
      ],
    ),
  );
}

/// Builds the two main action buttons: "Log Activity" and "AI Advisor".
Widget _buildActionButtons() {
  return Row(
    children: [
      Expanded(
        child: _ActionCard(
          title: 'Log Activity',
          icon: Icons.eco_outlined, // More modern icon
          color: const Color(0xFF22C55E), // green-500
          onTap: () {},
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: _ActionCard(
          title: 'AI Advisor',
          icon: Icons.psychology_outlined, // More modern icon
          color: const Color(0xFF3B82F6), // blue-500
          onTap: () {},
        ),
      ),
    ],
  );
}

/// Builds the list of recent activities.
Widget _buildRecentActivitiesList() {
  return Column(
    children: [
      _ActivityListItem(
        title: 'Tree Planting',
        date: 'August 28, 2025',
        status: 'Verified',
        points: '+10 Points',
        icon: Icons.forest_outlined,
        statusColor: const Color(0xFF22C55E),
        iconBackgroundColor: const Color(0xFFDCFCE7),
      ),
      const SizedBox(height: 12),
      _ActivityListItem(
        title: 'Rice Water Mgt.',
        date: 'September 02, 2025',
        status: 'Pending',
        icon: Icons.water_drop_outlined,
        statusColor: const Color(0xFFF59E0B),
        iconBackgroundColor: const Color(0xFFFEF3C7),
      ),
      const SizedBox(height: 12),
      _ActivityListItem(
        title: 'Organic Manure',
        date: 'August 25, 2025',
        status: 'Rejected',
        points: 'Photo Unclear',
        icon: Icons.compost_outlined,
        statusColor: const Color(0xFFEF4444),
        iconBackgroundColor: const Color(0xFFFEE2E2),
      ),
    ],
  );
}

Widget _buildBottomNavigationBar() {
  return BottomNavigationBar(
    currentIndex: 0, // Set to 'Home'
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xFF22C55E), // green-500
    unselectedItemColor: const Color(0xFF64748B), // slate-500
    selectedFontSize: 12,
    unselectedFontSize: 12,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_turned_in_outlined),
        label: 'Certificates',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.storefront_outlined),
        label: 'Market',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety_outlined),
        label: 'Advisor',
      ),
    ],
  );
}

/// A reusable widget for the main action buttons.
class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A reusable widget for an item in the "Recent Activities" list.
class _ActivityListItem extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String? points;
  final IconData icon;
  final Color statusColor;
  final Color iconBackgroundColor;

  const _ActivityListItem({
    required this.title,
    required this.date,
    required this.status,
    this.points,
    required this.icon,
    required this.statusColor,
    required this.iconBackgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: statusColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                  fontSize: 14,
                ),
              ),
              if (points != null)
                Text(
                  points!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
