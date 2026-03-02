import 'package:flutter/material.dart';

class LinkedInHomePage extends StatelessWidget {
  const LinkedInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2EF),
      body: Column(
        children: [
          const LinkedInNavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1128),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 24.0, left: 16, right: 16),
                    child: ResponsiveLayout(),
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

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          // Mobile Layout
          return const Column(
            children: [
              ProfileCard(),
              SizedBox(height: 8),
              CreatePostCard(),
              SizedBox(height: 8),
              FeedSection(),
            ],
          );
        } else {
          // Desktop Layout (3 Columns)
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Sidebar (Profile)
              const SizedBox(
                width: 225,
                child: Column(
                  children: [
                    ProfileCard(),
                    SizedBox(height: 8),
                    RecentGroupsCard(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Middle Column (Feed)
              const Expanded(
                child: Column(
                  children: [
                    CreatePostCard(),
                    SizedBox(height: 8),
                    Divider(height: 16, thickness: 0.5, color: Colors.grey),
                    FeedSection(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Right Sidebar (News)
              const SizedBox(
                width: 300,
                child: NewsCard(),
              ),
            ],
          );
        }
      },
    );
  }
}

// --- Navigation Bar ---
class LinkedInNavBar extends StatelessWidget {
  const LinkedInNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 0 : 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1128),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo & Search
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A66C2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isDesktop)
                    Container(
                      width: 280,
                      height: 34,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF3F8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[700], size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Search',
                            style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  else
                    Icon(Icons.search, color: Colors.grey[600]),
                ],
              ),

              // Nav Icons
              Row(
                children: [
                  _NavIcon(icon: Icons.home, label: 'Home', isActive: true),
                  _NavIcon(icon: Icons.people, label: 'My Network'),
                  _NavIcon(icon: Icons.work, label: 'Jobs'),
                  _NavIcon(icon: Icons.message, label: 'Messaging'),
                  _NavIcon(icon: Icons.notifications, label: 'Notifications'),
                  _NavIcon(icon: Icons.person, label: 'Me', isAvatar: true),
                  if (isDesktop) ...[
                    const VerticalDivider(indent: 12, endIndent: 12),
                    _NavIcon(icon: Icons.grid_view, label: 'For Business'),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isAvatar;

  const _NavIcon({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.isAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    if (!isDesktop && ['My Network', 'Jobs', 'For Business'].contains(label)) {
      return const SizedBox.shrink(); // Hide some icons on mobile
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isAvatar)
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
            )
          else
            Icon(
              icon,
              size: 24,
              color: isActive ? Colors.black87 : Colors.grey[600],
            ),
          if (isDesktop)
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? Colors.black87 : Colors.grey[600],
              ),
            ),
          if (isActive && isDesktop)
            Container(
              margin: const EdgeInsets.only(top: 2),
              height: 2,
              width: 40,
              color: Colors.black87,
            ),
        ],
      ),
    );
  }
}

// --- Left Sidebar Widgets ---
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFA0B4B7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 34,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Alex Developer',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            'Senior Flutter Engineer | Building Scalable Apps',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          _buildStatRow('Who viewed your profile', '142'),
          _buildStatRow('Impressions of your post', '1,234'),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.bookmark, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                const Text(
                  'My Items',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: Color(0xFF0A66C2), fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RecentGroupsCard extends StatelessWidget {
  const RecentGroupsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          _buildItem('Flutter Developers'),
          _buildItem('Dart Language'),
          _buildItem('Mobile App Design'),
          _buildItem('Tech Innovations'),
          const SizedBox(height: 16),
          const Text(
            'Groups',
            style: TextStyle(color: Color(0xFF0A66C2), fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 8),
          _buildItem('Flutter Community'),
          _buildItem('Startup Founders'),
          const SizedBox(height: 16),
          const Text(
            'Followed Hashtags',
            style: TextStyle(color: Color(0xFF0A66C2), fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 8),
          _buildItem('#flutter'),
          _buildItem('#coding'),
        ],
      ),
    );
  }

  Widget _buildItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.tag, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// --- Middle Column Widgets ---
class CreatePostCard extends StatelessWidget {
  const CreatePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Start a post',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.image, 'Media', Colors.blue),
              _buildActionButton(Icons.calendar_month, 'Event', Colors.orange),
              _buildActionButton(Icons.article, 'Write article', Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}

class FeedSection extends StatelessWidget {
  const FeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PostCard(
          authorName: 'Google Developers',
          authorHeadline: '12,345,678 followers',
          timeAgo: '2h • Edited',
          content: 'We are excited to announce the new features coming to Flutter! 🚀\n\nBuild beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
          imageUrl: 'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          likes: '12,432',
          comments: '453 comments',
        ),
        const SizedBox(height: 8),
        _PostCard(
          authorName: 'TechCrunch',
          authorHeadline: 'Technology News and Analysis',
          timeAgo: '5h',
          content: 'The future of AI is here. See how companies are integrating LLMs into their daily workflows to boost productivity.',
          imageUrl: 'https://picsum.photos/seed/tech/800/400',
          likes: '5,291',
          comments: '128 comments',
        ),
        const SizedBox(height: 8),
        _PostCard(
          authorName: 'Sarah Wilson',
          authorHeadline: 'UX Designer at Creative Agency',
          timeAgo: '1d',
          content: 'Just finished a new case study on accessibility in web design. It is crucial to build for everyone! #a11y #uxdesign #webdev',
          imageUrl: 'https://picsum.photos/seed/design/800/500',
          likes: '892',
          comments: '45 comments',
        ),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  final String authorName;
  final String authorHeadline;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final String likes;
  final String comments;

  const _PostCard({
    required this.authorName,
    required this.authorHeadline,
    required this.timeAgo,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=${authorName.replaceAll(' ', '+')}&background=random'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authorName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        authorHeadline,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            timeAgo,
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.public, size: 12, color: Colors.grey[600]),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey[600]),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(content, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 12),
          // Image
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
              ),
            ),
          // Stats
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.thumb_up_alt, size: 16, color: Color(0xFF0A66C2)),
                const SizedBox(width: 4),
                Text(likes, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const Spacer(),
                Text(comments, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const Divider(height: 1),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, 'Like'),
                _buildActionButton(Icons.comment_outlined, 'Comment'),
                _buildActionButton(Icons.repeat, 'Repost'),
                _buildActionButton(Icons.send, 'Send'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[600], size: 20),
      label: Text(
        label,
        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
      ),
    );
  }
}

// --- Right Sidebar Widgets ---
class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'LinkedIn News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Icon(Icons.info, size: 16, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 16),
          _buildNewsItem('Top startups in 2024', '1d ago • 10,934 readers'),
          _buildNewsItem('AI regulation talks heat up', '12h ago • 5,211 readers'),
          _buildNewsItem('Remote work trends', '2d ago • 8,123 readers'),
          _buildNewsItem('Tech hiring stabilizes', '4h ago • 2,456 readers'),
          _buildNewsItem('New Flutter version released', '1h ago • 15,342 readers'),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Show more', style: TextStyle(color: Colors.grey[600])),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Colors.grey[600]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
