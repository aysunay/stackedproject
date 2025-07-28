import 'package:flutter/material.dart';
import 'package:stackedproject/ui/views/shared/shared_view.dart';
import '../../common/app_colors.dart';
import 'my_profile_viewmodel.dart';

class MyProfileView extends SharedView<MyProfileViewModel> {
  const MyProfileView({super.key});

  @override
  String? get title => 'Jenny Wilson';

  @override
  List<Widget> get leftIcons => [
        const BackButton(color: black),
      ];

  @override
  List<Widget> buildActions(BuildContext context, MyProfileViewModel viewModel) {
    return [];
  }

  @override
  MyProfileViewModel viewModelBuilder(BuildContext context) => MyProfileViewModel();

  @override
  Widget buildBody(BuildContext context, MyProfileViewModel viewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/1.jpg'),
          ),
          const SizedBox(height: 16),
          const Text('Jenny Wilson', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Female · 78 Years', style: TextStyle(fontSize: 16, color: gray)),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Vitals'),
              Text('Care Plan'),
              Text('Medications'),
              Text('Care Team'),
            ],
          ),
          const SizedBox(height: 16),
          _infoCard(
            icon: Icons.calendar_today,
            title: 'Next Visit Scheduled On',
            subtitle: 'Wednesday, 14th Aug 2024\n09:30 AM - 7:30 PM',
          ),
          _infoCard(
            icon: Icons.cake,
            title: '16th Aug, 1981',
          ),
          _infoCard(
            icon: Icons.language,
            title: 'English, Spanish',
          ),
          _infoCard(
            icon: Icons.location_on,
            title: '3891 Ranchview Dr. Richardson, California',
          ),
          _infoCard(
            icon: Icons.phone,
            title: '+1 123 456 7890',
          ),
          _infoCard(
            icon: Icons.contacts,
            title: 'Emergency Contacts',
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _infoCard({required IconData icon, required String title, String? subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
