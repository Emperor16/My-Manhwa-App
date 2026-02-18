import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _autoDownload = false;
  bool _verticalScroll = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Customize your reading experience",
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const SizedBox(height: 24),

          // Reading Settings
          _buildSectionHeader("Reading"),
          _buildSwitchTile(
            Icons.swipe_vertical,
            "Vertical Scroll",
            "Swipe vertically to read",
            _verticalScroll,
            (v) => setState(() => _verticalScroll = v),
          ),
          const SizedBox(height: 24),

          // Notifications
          _buildSectionHeader("Notifications"),
          _buildSwitchTile(
            Icons.notifications_active,
            "Push Notifications",
            "Get notified for new chapters",
            _notifications,
            (v) => setState(() => _notifications = v),
          ),
          _buildNavTile(
            Icons.library_books,
            "Library Updates",
            "Manage which manhwa to follow",
          ),
          const SizedBox(height: 24),

          // Downloads
          _buildSectionHeader("Downloads"),
          _buildSwitchTile(
            Icons.download,
            "Auto-Download",
            "Download new chapters automatically",
            _autoDownload,
            (v) => setState(() => _autoDownload = v),
          ),
          _buildNavTile(Icons.storage, "Storage Location", "Internal storage"),
          _buildNavTile(
            Icons.cleaning_services,
            "Clear Cache",
            "Free up space (245 MB)",
          ),
          const SizedBox(height: 24),

          // Account
          _buildSectionHeader("Account"),
          _buildNavTile(Icons.person, "Edit Profile", "Change your username"),
          _buildNavTile(Icons.lock, "Privacy", "Manage your privacy settings"),
          _buildNavTile(Icons.sync, "Sync & Backup", "Sync reading progress"),
          const SizedBox(height: 24),

          // About
          _buildSectionHeader("About"),
          _buildNavTile(Icons.info, "App Version", "v1.0.0"),
          _buildNavTile(
            Icons.description,
            "Terms of Service",
            "Read our terms",
          ),
          _buildNavTile(
            Icons.privacy_tip,
            "Privacy Policy",
            "How we handle your data",
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade400,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF16213E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade400.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.orange.shade400),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.orange.shade400,
        ),
      ),
    );
  }

  Widget _buildNavTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF16213E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade400.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.orange.shade400),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 14,
        ),
      ),
    );
  }
}
