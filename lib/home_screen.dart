import 'package:flutter/material.dart';
// Note: You must add url_launcher to your pubspec.yaml file for this import to work.
import 'package:url_launcher/url_launcher.dart'; 

// --- HELPER FUNCTION FOR LAUNCHING URLS ---
// Central function to safely launch tel:, mailto:, or http/s links
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    // In a production app, you might show a user-friendly error message here
    debugPrint('Could not launch $url'); 
  }
}
// ------------------------------------------

// --- GLOBAL CONSTANTS & STYLES ---

// Color definitions based on the provided logo (Charcoal and Deep Red)
final Color primaryColor = const Color(0xFF2B2B2B); // Charcoal/Dark Grey for authority
final Color accentColor = const Color(0xFFA82222); // Deep Red/Maroon for impact
final Color lightBgColor = Colors.grey.shade100;

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;

  ServiceItem(
      {required this.title, required this.description, required this.icon});
}

// Expanded list of core services (for content length and feature showcase)
final List<ServiceItem> coreServices = [
  ServiceItem(
    title: "ICT Infrastructure & Data Centers",
    description:
        "High-availability servers, storage virtualization, and resilient network design for unbreakable business continuity, including Tier III compliance standards.",
    icon: Icons.storage_rounded,
  ),
  ServiceItem(
    title: "Integrated Physical Security",
    description:
        "Cutting-edge Access Control, IP Surveillance (CCTV), Perimeter Protection, and Biometric systems for total asset security and compliance.",
    icon: Icons.security_rounded,
  ),
  ServiceItem(
    title: "Strategic Cyber Defence",
    description:
        "Customized Network Security, Endpoint Detection and Response (EDR), Security Information and Event Management (SIEM), and strategic consulting services.",
    icon: Icons.shield_rounded,
  ),
  ServiceItem(
    title: "Managed IT Services Nairobi",
    description:
        "Proactive 24/7 monitoring, maintenance, helpdesk support, and IT infrastructure management ensuring optimal performance and minimal downtime.",
    icon: Icons.support_agent_rounded,
  ),
  ServiceItem(
    title: "Cloud Migration & Optimization",
    description:
        "Seamless transition to hybrid or public cloud environments (Azure/AWS) with a focus on cost efficiency, scalability, and security posture in the cloud.",
    icon: Icons.cloud_upload_rounded,
  ),
  ServiceItem(
    title: "Business Continuity & Disaster Recovery",
    description:
        "Implementing robust backup strategies and comprehensive disaster recovery plans (DRP) to ensure data integrity and business continuity during any crisis.",
    icon: Icons.restore_page_rounded,
  ),
];


class TeamMember {
  final String name;
  final String role;
  final String imageUrl;
  final String quote;
  final String phoneNumber; 

  TeamMember({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.quote,
    required this.phoneNumber,
  });
}

// NOTE: Asset paths changed from 'assets/images/...' to 'images/...' to fix 404 doubling issue on web.
final List<TeamMember> teamMembers = [
  TeamMember( 
    name: "Mr Symon Komo",
    role: "Technical Director",
    imageUrl: 'images/symon_komo.webp',
    quote: "Engineering is about building resilience, not just systems.",
    phoneNumber: "+254723787031", 
  ),
  TeamMember(
    name: "Ms Stella Mwai",
    role: "Operations Director",
    imageUrl: 'images/stella_mwai.webp',
    quote: "Flawless execution ensures client trust and lasting partnerships.",
    phoneNumber: "+254723921830", 
  ),
  TeamMember(
    name: "Mr Edwin Bosire",
    role: "System Analyst",
    imageUrl: 'images/edwin_bosire.webp',
    quote: "We analyze risks before they become business problems.",
    phoneNumber: "+254790992713", 
  ),
  TeamMember(
    name: "Ms Polly Nkatha",
    role: "Sales Executive",
    imageUrl: 'images/polly_nkatha.webp',
    quote: "Finding the perfect, cost-effective solution is always the goal.",
    phoneNumber: "+254790663204", 
  ),
];

class Testimonial {
  final String quote;
  final String name;
  final String title;
  final String company;

  Testimonial({required this.quote, required this.name, required this.title, required this.company});
}

// Expanded list of testimonials
final List<Testimonial> testimonials = [
  Testimonial(
    quote: "Diva Engineering delivered a seamless Data Center migration on schedule and under budget. Their expertise is unmatched in Nairobi.",
    name: "Jane Doe",
    title: "CTO",
    company: "East Africa Bank",
  ),
  Testimonial(
    quote: "The strategic security audit provided immediate, actionable insights that significantly strengthened our cyber posture. Highly recommend their consulting services.",
    name: "Mark Omondi",
    title: "Head of IT",
    company: "Regional Logistics PLC",
  ),
  Testimonial(
    quote: "From access control installation to system maintenance, Diva's professionalism and 24/7 support have kept our facility secure and operational.",
    name: "Aisha Kariuki",
    title: "Facilities Manager",
    company: "Kempinski Hotel Nairobi",
  ),
  Testimonial(
    quote: "Their network solutions are robust and scalable. They took the time to understand our future growth, not just our current needs. True partners.",
    name: "David Kimani",
    title: "COO",
    company: "Trans-Continental Group",
  ),
  Testimonial(
    quote: "We outsourced our entire IT management to Diva, and our systems have never been more stable. The peace of mind is invaluable.",
    name: "Fatuma Ali",
    title: "Finance Director",
    company: "Kenya Energy Solutions",
  ),
  Testimonial(
    quote: "Excellent service on our CCTV and surveillance upgrade. The system integrates perfectly with our existing infrastructure.",
    name: "Paul Ndiritu",
    title: "Security Head",
    company: "Luxury Retail Group",
  ),
];


// --- MAIN APP ENTRY POINT (Requires main.dart to run) ---
// Note: Assuming the application is run via a main.dart that calls DivaApp

class DivaApp extends StatelessWidget {
  const DivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diva Engineering Limited - ICT & Security',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: primaryColor,
        colorScheme: ColorScheme.light(primary: primaryColor, secondary: accentColor),
      ),
      home: const HomePage(),
    );
  }
}

// --- LOGO TITLE WITH ANIMATION WIDGET (NEW) ---
class LogoTitleWithAnimation extends StatefulWidget {
  final double fontSize;

  const LogoTitleWithAnimation({required this.fontSize, super.key});

  @override
  State<LogoTitleWithAnimation> createState() => _LogoTitleWithAnimationState();
}

class _LogoTitleWithAnimationState extends State<LogoTitleWithAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Animation runs for 2 seconds and repeats indefinitely
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Widget to build the Shimmering "Diva" Text
  Widget _buildAnimatedDiva() {
    final double gradientWidth = 0.5; // Controls the size of the "cloud" highlight

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate the moving position (from -2.0 to 3.0 to ensure the gradient sweeps entirely across)
        final double offset = -2.0 + (5.0 * _controller.value);

        return ShaderMask(
          // Apply the linear gradient shader that moves over the text
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // The colors: Maroon -> White Highlight -> Black Shade -> Maroon (Maroon dominant)
              colors: [
                accentColor, // Dominant background color (Maroon)
                Colors.white, // White highlight
                primaryColor, // Black/Charcoal shade
                accentColor, // Dominant background color (Maroon)
              ],
              // The stops define where each color starts/ends in the gradient sweep
              stops: [
                offset - gradientWidth, // Maroon start
                offset, // White start
                offset + 0.1, // Black start (quick transition after white)
                offset + gradientWidth * 2, // Maroon end
              ],
              tileMode: TileMode.clamp,
            ).createShader(bounds);
          },
          child: Text(
            'Diva',
            style: TextStyle(
              fontSize: widget.fontSize * 1.2,
              fontWeight: FontWeight.w900,
              // ShaderMask overwrites this, but we use a non-transparent color for safety
              color: Colors.white, 
              height: 0.9, 
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAnimatedDiva(), // Animated Diva
        // --- MODIFICATION START: Changed color from accentColor (Maroon) to primaryColor (Black) ---
        Text(
          'Engineering',
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w600,
            color: primaryColor, // Changed to Black/Charcoal Color
            height: 0.9, 
          ),
        ),
        // --- MODIFICATION END ---
      ],
    );
  }
}
// --- END LOGO TITLE WITH ANIMATION WIDGET ---

// --- HOME PAGE LAYOUT ---

// Reverting to StatefulWidget for proper ScrollController management
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Navigation Logic Setup
  final ScrollController _scrollController = ScrollController();
  // Ensure all sections are mapped to keys for navigation
  final Map<String, GlobalKey> _keys = {
    'Home': GlobalKey(),
    'Solutions': GlobalKey(),
    'Expertise': GlobalKey(),
    'Company': GlobalKey(),
    'Team': GlobalKey(),
    'Testimonials': GlobalKey(), 
    'Careers': GlobalKey(),      
    'Contact': GlobalKey(),
  };

  bool _showBackToTopButton = false;
  // Define the height of the desktop navbar to correctly offset the scrollable content
  final double _desktopNavbarHeight = 80.0; 

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _showBackToTopButton = _scrollController.offset >= 400; // Show after 400 pixels
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSection(String keyName) {
    final key = _keys[keyName];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        // Calculate the alignment offset to stop scrolling *below* the sticky navbar
        alignment: _desktopNavbarHeight / MediaQuery.of(context).size.height,
      );
    }
  }

  // NOTE: The previous _buildStackedLogoText method has been replaced 
  // by the stateful LogoTitleWithAnimation widget.

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      // Mobile AppBar/Drawer
      appBar: isDesktop
          ? null 
          : AppBar(
              // *** MODIFICATION START: Logo and Stacked Text in Mobile AppBar ***
              title: Row(
                children: [
                  // Logo Image
                  SizedBox(
                    height: 50, // Logo height
                    child: Image.asset('images/logo.webp', height: 50, fit: BoxFit.contain), 
                  ),
                  const SizedBox(width: 10),
                  // Stacked Text (Now Animated)
                  const LogoTitleWithAnimation(fontSize: 14.0), // Smaller font for mobile
                ],
              ),
              // *** MODIFICATION END ***
              iconTheme: IconThemeData(color: primaryColor),
            ),
      drawer: isDesktop
          ? null
          : MobileDrawer(onTap: (name) {
              _scrollToSection(name);
              Navigator.pop(context);
            }),
      
      // STICKY NAVBAR FIX: Use Stack to layer the Navbar over the scrollable content
      body: Stack(
        children: [
          // Scrollable Content (Pushed down by the Navbar height)
          Padding(
            // Only add top padding on desktop where the sticky navbar exists
            padding: EdgeInsets.only(top: isDesktop ? _desktopNavbarHeight : 0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // --- Content Sections ---
                  HeroSection(key: _keys['Home']),
                  const StatsBar(),
                  PartnershipSection(), // Partnership Logos
                  WhyChooseUsSection(key: _keys['Expertise']), 
                  ServicesSection(key: _keys['Solutions']),
                  CoreCapabilitiesSection(), 
                  AboutUsSection(key: _keys['Company']),
                  TeamSection(key: _keys['Team']), // Restored Team Section
                  TestimonialCarousel(key: _keys['Testimonials']), // Restored Carousel
                  CareerSection(key: _keys['Careers']), // Restored Careers Section
                  const CallToActionBanner(), 
                  ContactSection(key: _keys['Contact']),
                  const Footer(),
                ],
              ),
            ),
          ),

          // Sticky Desktop Navbar (Only visible on desktop)
          if (isDesktop) 
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: DesktopNavbar(onTap: _scrollToSection), // Removed buildLogoText argument
            ),
          
          // Back to Top Button
          if (_showBackToTopButton)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: accentColor,
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}


// ------------------------------------
// --- WIDGETS & SECTIONS (CONTENT) ---
// ------------------------------------

// 1. Desktop Navigation Bar
class DesktopNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onTap;

  // Removed buildLogoText from constructor
  const DesktopNavbar({super.key, required this.onTap}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white, // Color is now only set inside BoxDecoration
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // *** MODIFICATION START: Logo and Stacked Text in Desktop Navbar ***
          Row(
            children: [
              // Logo Image
              SizedBox(
                height: 70, // Logo height
                child: Image.asset('images/logo.webp', height: 70, fit: BoxFit.contain),
              ),
              const SizedBox(width: 15),
              // Stacked Text (Now Animated)
              const LogoTitleWithAnimation(fontSize: 18.0), // Larger font for desktop
            ],
          ),
          // *** MODIFICATION END ***
          Row(
            children: [
              _NavButton(title: 'Home', onTap: () => onTap('Home')),
              _NavButton(title: 'Solutions', onTap: () => onTap('Solutions')),
              _NavButton(title: 'Expertise', onTap: () => onTap('Expertise')),
              _NavButton(title: 'Company', onTap: () => onTap('Company')),
              _NavButton(title: 'Team', onTap: () => onTap('Team')),
              _NavButton(title: 'Testimonials', onTap: () => onTap('Testimonials')),
              _NavButton(title: 'Careers', onTap: () => onTap('Careers')),
              _NavButton(title: 'Contact', onTap: () => onTap('Contact')),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => onTap('Contact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  elevation: 5, 
                ),
                child: const Text('GET STARTED', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

// Nav Button with subtle hover effect
class _NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const _NavButton({required this.title, required this.onTap});

  @override
  State<_NavButton> createState() => __NavButtonState();
}

class __NavButtonState extends State<_NavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _isHovering ? accentColor : Colors.black87,
                ),
              ),
              // Subtle underline animation
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovering ? 20 : 0,
                color: accentColor,
                margin: const EdgeInsets.only(top: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. Mobile Drawer
class MobileDrawer extends StatelessWidget {
  final Function(String) onTap;
  const MobileDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: const Text('Diva Engineering', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(title: const Text('Home'), onTap: () => onTap('Home')),
          ListTile(title: const Text('Solutions'), onTap: () => onTap('Solutions')),
          ListTile(title: const Text('Expertise'), onTap: () => onTap('Expertise')),
          ListTile(title: const Text('Company'), onTap: () => onTap('Company')),
          ListTile(title: const Text('Team'), onTap: () => onTap('Team')),
          ListTile(title: const Text('Testimonials'), onTap: () => onTap('Testimonials')),
          ListTile(title: const Text('Careers'), onTap: () => onTap('Careers')),
          ListTile(title: const Text('Contact'), onTap: () => onTap('Contact')),
        ],
      ),
    );
  }
}

// 3. Hero Section
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final height = isMobile ? 450.0 : 650.0; 

    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the HeroSection widget itself.
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          // FIX: Asset path adjusted to fix 404 error
          image: const AssetImage('images/hero_bg.webp'), 
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(primaryColor.withOpacity(0.8), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ENGINEERING CERTAINTY. SCALABLE SOLUTIONS.',
                style: TextStyle(
                  fontSize: isMobile ? 40 : 80, 
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1,
                  shadows: const [Shadow(blurRadius: 10.0, color: Colors.black54, offset: Offset(2, 2))],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: isMobile ? double.infinity : 700,
                child: Text(
                  'Future-proof your business in East Africa. Your trusted partner for resilient Enterprise ICT Infrastructure, Advanced Security Systems, and Strategic Cyber Defence.',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 26,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon( 
                onPressed: () {}, 
                icon: const Icon(Icons.flash_on_rounded, color: Colors.white),
                label: const Text('REQUEST FREE CONSULTATION', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 4. Stats/Authority Section
class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: lightBgColor,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 20 : 100),
      child: Center(
        child: Wrap(
          spacing: isMobile ? 30 : 80,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _StatItem(value: '400+', label: 'Successful Projects'),
            _StatItem(value: '10+', label: 'Years of Experience'),
            _StatItem(value: '120+', label: 'Satisfied Clients'),
            _StatItem(value: 'Tier 1', label: 'International Partners'),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: accentColor, 
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}

// 5. Partnership Logos (Trust/Authority)
class PartnershipSection extends StatelessWidget {
  // Placeholder assets for top tech partners
  // FIX: Asset paths adjusted to fix 404 error
  final List<String> partnerLogos = [
    'images/logo_cisco.webp',
    'images/logo_microsoft.webp',
    'images/logo_hp.webp',
    'images/logo_dell.webp',
    'images/logo_hikvision.webp',
    'images/logo_vmware.webp',
  ];

  PartnershipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: isMobile ? 20 : 100),
      color: Colors.white,
      child: Column(
        children: [
          Text('TRUSTED PARTNERSHIPS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 30),
          Wrap(
            spacing: isMobile ? 20 : 60,
            runSpacing: isMobile ? 20 : 30,
            alignment: WrapAlignment.center,
            children: partnerLogos.map((logoPath) {
              return Opacity(
                opacity: 0.7, 
                child: SizedBox(
                  // --- START MODIFICATION: Increased image size ---
                  height: isMobile ? 55 : 75, // Increased height for larger logos
                  width: isMobile ? 120 : 180, // Increased width for larger logos
                  // --- END MODIFICATION ---
                  child: Image.asset(
                    logoPath,
                    fit: BoxFit.contain,
                    color: primaryColor, 
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: lightBgColor,
                      child: Center(child: Text(logoPath.split('/').last.split('.').first, style: const TextStyle(fontSize: 10, color: Colors.black54))),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


// 6. Why Choose Us / Expertise
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the WhyChooseUsSection widget itself.
      color: lightBgColor,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OUR DIFFERENCE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor)),
                const SizedBox(height: 10),
                Text('Why Leading Enterprises Choose Diva.',
                    style: TextStyle(fontSize: isMobile ? 32 : 44, fontWeight: FontWeight.bold, color: primaryColor)),
                const SizedBox(height: 20),
                const Text(
                  'We combine deep local knowledge of the Kenyan market with internationally recognized best practices and certifications, guaranteeing compliant and resilient solutions.',
                  style: TextStyle(fontSize: 18, color: Colors.grey, height: 1.5),
                ),
                if (isMobile) const SizedBox(height: 40),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            flex: 1,
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                _FeaturePill(icon: Icons.verified_user_rounded, title: 'Certified Engineers', subtitle: 'Global Vendor Accreditations.'),
                _FeaturePill(icon: Icons.support_rounded, title: '24/7 Local Support', subtitle: 'Rapid response SLA\'s.'),
                _FeaturePill(icon: Icons.insights_rounded, title: 'Risk-Based Approach', subtitle: 'Strategy driven by business needs.'),
                _FeaturePill(icon: Icons.handshake_rounded, title: 'Top-Tier Partners', subtitle: 'Authorized reseller of global brands.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ... (FeaturePill remains unchanged)
class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeaturePill({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), 
            blurRadius: 10, 
            offset: const Offset(0, 5)
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 36, color: accentColor),
          const SizedBox(width: 15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                const SizedBox(height: 5),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// 7. Services Section (The core offerings)
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the ServicesSection widget itself.
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      color: Colors.white, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SOLUTIONS: Your Critical Areas of Certainty',
            style: TextStyle(fontSize: isMobile ? 30 : 48, fontWeight: FontWeight.bold, color: primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          const Text(
            'We don\'t sell products; we engineer ecosystems for maximum efficiency and security.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          // Responsive Wrap for Services
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1400 ? 3 : constraints.maxWidth > 800 ? 2 : 1;
              double cardWidth = constraints.maxWidth / crossAxisCount - (crossAxisCount > 1 ? 40 : 40);

              return Wrap(
                spacing: 30.0,
                runSpacing: 30.0,
                alignment: WrapAlignment.center,
                children: coreServices.map((item) {
                  return SizedBox(
                    width: cardWidth.clamp(280.0, 450.0), // Enforce min/max width for cards
                    child: _ServiceCard(item: item),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
// ... (_ServiceCard remains unchanged)
class _ServiceCard extends StatefulWidget {
  final ServiceItem item;
  const _ServiceCard({required this.item});

  @override
  State<_ServiceCard> createState() => __ServiceCardState();
}

class __ServiceCardState extends State<_ServiceCard> {
  bool _isHovering = false;
  // SAME-SIZED CARD FIX: Define a fixed height for all cards.
  static const double fixedCardHeight = 350.0; 

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        // Enforce the fixed height here
        height: fixedCardHeight, 
        decoration: BoxDecoration(
          color: lightBgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _isHovering ? accentColor : Colors.grey.shade200, width: _isHovering ? 2 : 1),
          boxShadow: [
            BoxShadow(
              color: _isHovering ? accentColor.withOpacity(0.4) : Colors.black12,
              blurRadius: _isHovering ? 15 : 5,
              offset: Offset(0, _isHovering ? 5 : 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {}, // Link to service details page
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // SAME-SIZED CARD FIX: Use SpaceBetween to ensure the 'EXPLORE' link is always at the bottom
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(widget.item.icon, size: 48, color: accentColor),
                    const SizedBox(height: 20),
                    Text(
                      widget.item.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                    const SizedBox(height: 10),
                    // Constrain the description text height/lines
                    SizedBox(
                      height: 70, // Set max height for description text
                      child: Text(
                        widget.item.description,
                        style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.4),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0), 
                  child: Row(
                    children: [
                      Text('EXPLORE', style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16, color: accentColor),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// 8. Core Capabilities / Technologies
class CoreCapabilitiesSection extends StatelessWidget {
  const CoreCapabilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    // Placeholder data for technical focus areas
    final List<Map<String, dynamic>> capabilities = [
      {'icon': Icons.security_sharp, 'title': 'Zero Trust Architecture'},
      {'icon': Icons.cloud_queue, 'title': 'Multi-Cloud Integration'},
      {'icon': Icons.network_check, 'title': 'Software Defined Networking (SDN)'},
      {'icon': Icons.bug_report, 'title': 'Vulnerability Management'},
      {'icon': Icons.verified, 'title': 'ISO 27001 Compliance'},
      {'icon': Icons.storage_rounded, 'title': 'Data Center Design (Tiers)'},
    ];

    return Container(
      color: primaryColor, // Dark background
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CORE CAPABILITIES',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'The Technology We Master.',
            style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: capabilities.map((cap) => _CapabilityCard(
              icon: cap['icon'] as IconData,
              title: cap['title'] as String,
            )).toList(),
          ),
        ],
      ),
    );
  }
}
// ... (_CapabilityCard remains unchanged)
class _CapabilityCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CapabilityCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150, // Fixed height for uniformity
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: accentColor), 
          const SizedBox(height: 15),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
        ],
      ),
    );
  }
}


// 9. About Us Section
class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the AboutUsSection widget itself.
      color: lightBgColor, 
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OUR COMPANY',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
                ),
                const SizedBox(height: 10),
                Text(
                  'Local Expertise, Global Standards. We Engineer Resilience.',
                  style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Diva Engineering was established in Nairobi, Kenya, to fill the critical need for locally-based, high-quality Enterprise Security Systems and resilient ICT Solutions. We translate complex technological requirements into simple, cost-effective, and powerful solutions tailored for the dynamic East African business landscape.',
                  style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
                ),
                const SizedBox(height: 40),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download_rounded, color: primaryColor),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('VIEW COMPANY PROFILE', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    side: BorderSide(color: primaryColor, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile) const Spacer(flex: 1),
          if (!isMobile) 
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 400, 
                  margin: const EdgeInsets.only(left: 40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      // FIX: Asset path adjusted to fix 404 error
                      'images/about_us_image.webp',
                      height: 400,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 400,
                        color: primaryColor.withOpacity(0.1),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image_not_supported, size: 40, color: primaryColor),
                                const Text("Load 'about_us_image.webp'", style: TextStyle(color: Colors.black54)),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// 10. Team Section (Restored)
class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the TeamSection widget itself.
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'THE EXPERTS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Meet The Certified Engineers.',
            style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: teamMembers.map((member) => _TeamMemberCard(member: member)).toList(),
          ),
        ],
      ),
    );
  }
}

// ... (_TeamMemberCard remains unchanged)
class _TeamMemberCard extends StatelessWidget {
  final TeamMember member;
  const _TeamMemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    // Clean the number once for the tel: URI
    final cleanedPhoneNumber = member.phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    return SizedBox(
      width: 250,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              member.imageUrl, // Path is now 'images/...'
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(color: lightBgColor, shape: BoxShape.circle, border: Border.all(color: accentColor, width: 3)),
                child: Icon(Icons.person, size: 70, color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(member.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor)),
          Text(member.role, style: TextStyle(fontSize: 16, color: accentColor)),
          const SizedBox(height: 5), // Added a small gap
          // --- NEW PHONE NUMBER DISPLAY (CLICKABLE) ---
          InkWell(
            onTap: () => _launchUrl(Uri.parse('tel:$cleanedPhoneNumber')),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_rounded, size: 16, color: primaryColor),
                  const SizedBox(width: 5),
                  Text(
                    member.phoneNumber, 
                    style: TextStyle(
                      fontSize: 15, 
                      color: primaryColor, 
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline, // Add underline for clickability cue
                      decorationColor: primaryColor
                    ),
                  ),
                ],
              ),
            ),
          ),
          // --- END NEW PHONE NUMBER DISPLAY ---
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('"${member.quote}"', textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}


// 11. Testimonial Carousel (Restored)
class TestimonialCarousel extends StatefulWidget {
  const TestimonialCarousel({super.key});

  @override
  State<TestimonialCarousel> createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  // Viewport fraction adjusted for better mobile view
  final PageController _pageController = PageController(viewportFraction: 0.85, initialPage: 0); 
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    
    return Container(
      // key: widget.key, // REMOVED: GlobalKey is already applied to the TestimonialCarousel widget itself.
      color: primaryColor, // Dark background for contrast
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 50, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'TRUST & VALIDATION',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'What Our Clients Say',
            style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          // Testimonial Carousel
          SizedBox(
            height: 350, // Fixed height for carousel
            child: PageView.builder(
              controller: _pageController,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final bool isCurrentPage = (_currentPage == index);
                final scale = isCurrentPage ? 1.0 : 0.85;

                return TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  tween: Tween(begin: scale, end: scale),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 15.0 : 15.0),
                    child: _TestimonialCard(testimonial: testimonials[index]),
                  ),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // Dots Indicator (Interactive)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(testimonials.length, (index) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 10.0,
                  width: _currentPage == index ? 25.0 : 10.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? accentColor : Colors.white54,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ... (_TestimonialCard remains unchanged)
class _TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: accentColor, width: 5)),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote_rounded, size: 40, color: accentColor),
          const SizedBox(height: 15),
          Expanded(
            child: Text(
              testimonial.quote,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black87, height: 1.5),
              maxLines: 4, 
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 20),
          Text(testimonial.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
          Text('${testimonial.title}, ${testimonial.company}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}


// 12. Careers/Culture (Restored)
class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the CareerSection widget itself.
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  'JOIN OUR TEAM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 10),
                Text(
                  'Engineer The Future With Us.',
                  style: TextStyle(fontSize: isMobile ? 32 : 44, fontWeight: FontWeight.bold, color: primaryColor),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 20),
                Text( 
                  'At Diva Engineering, we believe our people are our most valuable asset. Join a team dedicated to innovation, professionalism, and building Africa\'s most resilient technological infrastructure.',
                  style: const TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.work_history_rounded, color: Colors.white),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    child: Text('VIEW OPEN POSITIONS', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 80),
          if (!isMobile)
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 350,
                  color: lightBgColor,
                  child: Center(
                    child: Icon(Icons.people_alt_rounded, size: 100, color: primaryColor.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


// 13. Call to Action Banner
class CallToActionBanner extends StatelessWidget {
  const CallToActionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 60),
      decoration: BoxDecoration(
        color: lightBgColor,
        border: Border(top: BorderSide(color: accentColor.withOpacity(0.1), width: 10)), 
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'READY TO BUILD A MORE SECURE, EFFICIENT FUTURE?',
              style: TextStyle(
                fontSize: isMobile ? 24 : 36,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          if (isMobile) const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.schedule_rounded, color: Colors.white),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Text(
                'SCHEDULE FREE AUDIT',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              elevation: 5,
              minimumSize: const Size(250, 60),
            ),
          ),
        ],
      ),
    );
  }
}

// 14. Contact Section
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      // key: key, // REMOVED: GlobalKey is already applied to the ContactSection widget itself.
      color: primaryColor, // Use primary color for deep contrast on contact section
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Center(
        child: Column(
          children: [
            Text('GET IN TOUCH', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor)),
            const SizedBox(height: 10),
            Text('Start Engineering Your Certainty Today.', style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
            const SizedBox(height: 40),
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contact Info
                Container(
                  width: isMobile ? double.infinity : 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Non-clickable info
                      _ContactDetail(icon: Icons.location_on, label: '4th Floor, Room NO. 7, Lotus Plaza, Nairobi, Kenya'),
                      // Clickable email
                      _ContactDetail(icon: Icons.email, label: 'info@divaengineering.co.ke', url: 'mailto:info@divaengineering.co.ke'),
                      // Split the two main phone numbers and make them clickable
                      _ContactDetail(icon: Icons.phone, label: '+254-723 921 830 (Operations)', url: 'tel:+254723921830'), 
                      _ContactDetail(icon: Icons.phone, label: '+254-723 787 031 (Technical)', url: 'tel:+254723787031'),
                    ],
                  ),
                ),
                if (!isMobile) const SizedBox(width: 40),
                if (isMobile) const SizedBox(height: 40),

                // Contact Form (Intuitive and Interactive)
                Container(
                  width: isMobile ? double.infinity : 600,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)],
                  ),
                  child: const ContactForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ... (_ContactDetail, ContactForm, _ContactFormState, and Footer remain unchanged)
class _ContactDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? url; // New optional field for tel/mailto URI

  const _ContactDetail({required this.icon, required this.label, this.url});

  @override
  Widget build(BuildContext context) {
    // Determine if text should be underlined (clickable)
    final textWidget = Flexible(
        child: Text(label,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
                decoration: url != null ? TextDecoration.underline : TextDecoration.none, // Underline if clickable
                decorationColor: Colors.white70,
            )
        )
    );
    
    // Base content structure
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: accentColor, size: 24),
        const SizedBox(width: 15),
        textWidget,
      ],
    );

    // If a URL scheme is provided, wrap in InkWell
    if (url != null) {
      return InkWell(
        onTap: () => _launchUrl(Uri.parse(url!)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: content,
        ),
      );
    }
    
    // Original padding/structure for non-clickable items
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: content,
    );
  }
}


// New Contact Form Widget (Interactive)
class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _statusMessage = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _statusMessage = 'Message Sent! We will contact you shortly.';
      });
      // In a real application, this is where you'd handle form submission (e.g., API call).
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SEND US A MESSAGE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
            validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Work Email', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
            validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Subject of Inquiry', border: OutlineInputBorder(), prefixIcon: Icon(Icons.subject)),
            validator: (value) => value == null || value.isEmpty ? 'Please enter a subject' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(labelText: 'Your Message / Project Details', border: OutlineInputBorder()),
            validator: (value) => value == null || value.isEmpty ? 'Please enter your message' : null,
          ),
          const SizedBox(height: 30),
          if (_statusMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(_statusMessage, style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
            ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.send, color: Colors.white),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text('SUBMIT INQUIRY', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              elevation: 5,
              minimumSize: const Size(double.infinity, 60),
            ),
          ),
        ],
      ),
    );
  }
}


// 15. Footer
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A1A), // Near Black for footer
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: const Icon(Icons.public_rounded, color: Colors.white54), onPressed: () {}), 
                IconButton(icon: const Icon(Icons.facebook_outlined, color: Colors.white54), onPressed: () {}), 
                IconButton(icon: const Icon(Icons.share, color: Colors.white54), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              '© 2025 Diva Engineering Limited. ICT Solutions Nairobi | All Rights Reserved. Built with Flutter Web.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}