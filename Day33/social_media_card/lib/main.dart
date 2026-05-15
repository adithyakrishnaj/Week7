import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Responsive Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // MOBILE VIEW

          if (constraints.maxWidth < 700) {
            return Column(
              children: [

                // TOP CARDS

                Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [

                      Expanded(
                        child: dashboardCard(
                          title: "Sales",
                          value: "₹24K",
                          icon: Icons.attach_money,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: dashboardCard(
                          title: "Orders",
                          value: "320",
                          icon: Icons.shopping_cart,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                // MAIN CONTENT

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    child: ListView(
                      children: [

                        mainContentCard(
                          "Recent Activity",
                          "New orders and customer activities are displayed here.",
                        ),

                        const SizedBox(height: 16),

                        mainContentCard(
                          "Statistics",
                          "Daily revenue, orders, and performance reports.",
                        ),

                        const SizedBox(height: 16),

                        mainContentCard(
                          "Notifications",
                          "Manage updates and alerts from the dashboard.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          // TABLET / LARGE SCREEN VIEW

          return Row(
            children: [

              // SIDEBAR

              Expanded(
                flex: 2,

                child: Container(
                  color: const Color(0xFF111827),

                  child: Column(
                    children: [

                      const SizedBox(height: 40),

                      const CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "Admin Panel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 40),

                      sidebarTile(Icons.dashboard, "Dashboard"),
                      sidebarTile(Icons.analytics, "Analytics"),
                      sidebarTile(Icons.shopping_cart, "Orders"),
                      sidebarTile(Icons.settings, "Settings"),
                    ],
                  ),
                ),
              ),

              // MAIN CONTENT AREA

              Expanded(
                flex: 5,

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        screenWidth > 1000
                            ? "Welcome back, Administrator"
                            : "Dashboard Overview",

                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // TOP DASHBOARD CARDS

                      Row(
                        children: [

                          Expanded(
                            child: dashboardCard(
                              title: "Revenue",
                              value: "₹54,000",
                              icon: Icons.bar_chart,
                              color: Colors.blue,
                            ),
                          ),

                          const SizedBox(width: 18),

                          Expanded(
                            child: dashboardCard(
                              title: "Customers",
                              value: "1,240",
                              icon: Icons.people,
                              color: Colors.orange,
                            ),
                          ),

                          const SizedBox(width: 18),

                          Expanded(
                            child: dashboardCard(
                              title: "Orders",
                              value: "875",
                              icon: Icons.shopping_bag,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // CONTENT AREA

                      Expanded(
                        child: Row(
                          children: [

                            Expanded(
                              flex: 3,
                              child: mainContentCard(
                                "Analytics",
                                "Track user growth, revenue, and performance with detailed analytics charts.",
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              flex: 2,
                              child: mainContentCard(
                                "Recent Updates",
                                "New notifications and system updates appear here.",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // SIDEBAR TILE

  Widget sidebarTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: Colors.white,
            ),

            const SizedBox(width: 16),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DASHBOARD CARD

  Widget dashboardCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // MAIN CONTENT CARD

  Widget mainContentCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}