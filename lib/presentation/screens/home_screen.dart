import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/music_services_provider.dart';
import '../widgets/service_card.dart';
import '../widgets/hero_section.dart';
import '../widgets/bottom_nav_bar.dart';
import 'service_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MusicServicesProvider>().fetchMusicServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar Area
            Container(
              height: 24,
              color: const Color(0xFF8B1538),
            ),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Hero Section with Search and Demo
                    const HeroSection(),
                    
                    // Services Section
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF1A1A1A),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Hire hand-picked Pros for popular music services',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<MusicServicesProvider>(
                            builder: (context, provider, child) {
                              if (provider.isLoading) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(40.0),
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF8B1538),
                                    ),
                                  ),
                                );
                              }

                              if (provider.errorMessage.isNotEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.error_outline,
                                          size: 48,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Error loading services',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        ElevatedButton(
                                          onPressed: () => provider.fetchMusicServices(),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF8B1538),
                                          ),
                                          child: const Text('Retry'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              return Column(
                                children: provider.services
                                    .map((service) => Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: ServiceCard(
                                            service: service,
                                            onTap: () => _navigateToServiceDetails(service),
                                          ),
                                        ))
                                    .toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 100), // Space for bottom nav
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void _navigateToServiceDetails(service) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailsScreen(service: service),
      ),
    );
  }
}
