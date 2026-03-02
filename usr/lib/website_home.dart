import 'package:flutter/material.dart';

class WebsiteHomePage extends StatelessWidget {
  const WebsiteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Responsive App Bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: const ResponsiveNavBar(),
      ),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            FeaturesSection(),
            TestimonialsSection(),
            CallToActionSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// --- Navigation Bar ---
class ResponsiveNavBar extends StatelessWidget {
  const ResponsiveNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Icon(Icons.auto_awesome, color: Theme.of(context).primaryColor, size: 32),
              const SizedBox(width: 8),
              Text(
                'BrandName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
          
          // Desktop Menu
          if (isDesktop)
            Row(
              children: [
                _NavButton(title: 'Home'),
                _NavButton(title: 'Features'),
                _NavButton(title: 'Pricing'),
                _NavButton(title: 'About'),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ],
            )
          else
            // Mobile Menu Icon (opens drawer)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  const _NavButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 48),
                SizedBox(height: 16),
                Text(
                  'BrandName',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('Home'), onTap: () {}),
          ListTile(leading: const Icon(Icons.star), title: const Text('Features'), onTap: () {}),
          ListTile(leading: const Icon(Icons.attach_money), title: const Text('Pricing'), onTap: () {}),
          ListTile(leading: const Icon(Icons.info), title: const Text('About'), onTap: () {}),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Hero Section ---
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.grey[50],
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(child: _buildContent(context)),
                    const SizedBox(width: 48),
                    Expanded(child: _buildImagePlaceholder()),
                  ],
                )
              : Column(
                  children: [
                    _buildContent(context),
                    const SizedBox(height: 48),
                    _buildImagePlaceholder(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'NEW FEATURE AVAILABLE',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Build beautiful websites with Flutter',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 1.1,
            color: Colors.grey[900],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Create stunning, responsive web applications that work seamlessly across all devices. One codebase, everywhere.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Start Building'),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text('Learn More →'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.web_asset,
          size: 100,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}

// --- Features Section ---
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Everything you need',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Powerful Features',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Our platform provides all the tools you need to succeed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 64),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 800;
                  return Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: [
                      _FeatureCard(
                        icon: Icons.speed,
                        title: 'Lightning Fast',
                        description: 'Optimized for speed and performance across all devices.',
                        width: isDesktop ? 350 : constraints.maxWidth,
                      ),
                      _FeatureCard(
                        icon: Icons.security,
                        title: 'Secure by Default',
                        description: 'Enterprise-grade security built into every component.',
                        width: isDesktop ? 350 : constraints.maxWidth,
                      ),
                      _FeatureCard(
                        icon: Icons.devices,
                        title: 'Fully Responsive',
                        description: 'Looks amazing on mobile, tablet, and desktop screens.',
                        width: isDesktop ? 350 : constraints.maxWidth,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Testimonials Section ---
class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Icon(Icons.format_quote, size: 64, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                '"This platform completely transformed how we build web applications. The development speed is incredible and the result is flawless."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 24,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sarah Johnson',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(
                        'CTO at TechCorp',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Call To Action Section ---
class CallToActionSection extends StatelessWidget {
  const CallToActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          children: [
            const Text(
              'Ready to get started?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Join thousands of developers building the future today.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Start Your Free Trial'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Footer ---
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.auto_awesome, color: Colors.white, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'BrandName',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Making web development accessible, fast, and beautiful for everyone.',
                          style: TextStyle(color: Colors.grey[400], height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                  // Simple Footer Links
                  if (MediaQuery.of(context).size.width > 600) ...[
                    _FooterColumn(
                      title: 'Product',
                      links: const ['Features', 'Pricing', 'Integrations', 'FAQ'],
                    ),
                    const SizedBox(width: 32),
                    _FooterColumn(
                      title: 'Company',
                      links: const ['About', 'Careers', 'Blog', 'Contact'],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 64),
              Divider(color: Colors.grey[800]),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2024 BrandName Inc. All rights reserved.',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.grey[500], size: 20),
                      const SizedBox(width: 16),
                      Icon(Icons.camera_alt, color: Colors.grey[500], size: 20), // Instagram placeholder
                      const SizedBox(width: 16),
                      Icon(Icons.alternate_email, color: Colors.grey[500], size: 20), // Twitter placeholder
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                link,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            )),
      ],
    );
  }
}
