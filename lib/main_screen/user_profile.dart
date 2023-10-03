import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      /// the customscrollview is used to divide the screen
      ///Todo the problem here is the collapsing
      body: Stack(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.brown],
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: constraints.biggest.height <= 120 ? 1 : 0,
                      //opacity: 1,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Text(
                          'Account',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.brown],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/inapp/guest.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'guest'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Cart',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'WishList',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: Image(
                              image: AssetImage('images/inapp/logo.jpg'),
                            ),
                          ),
                          const ProfileHeaderLabel(
                            HeaderLabel: ' Account Info ',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Column(
                                children: [
                                  RepeatedListTile(
                                    icon: Icons.email,
                                    title: 'Email Address',
                                    subTitle: 'example@gmail.com',
                                  ),
                                  YellowDivider(),
                                  RepeatedListTile(
                                    icon: Icons.phone,
                                    title: 'Phone No.',
                                    subTitle: '+2348143050757',
                                  ),
                                  YellowDivider(),
                                  RepeatedListTile(
                                    icon: Icons.location_pin,
                                    title: 'Address',
                                    subTitle:
                                        'examples: 140 Street Asabi Taiwo Lagos',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const ProfileHeaderLabel(
                            HeaderLabel: ' Account Settings ',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  RepeatedListTile(
                                    icon: Icons.edit,
                                    //todo come back to set this function
                                    onPressed: () {},
                                    title: 'Edit Profile',
                                    subTitle: '',
                                  ),
                                  const YellowDivider(),
                                  RepeatedListTile(
                                    icon: Icons.lock,
                                    //todo come back to set this function
                                    onPressed: () {},
                                    title: 'Change Password',
                                  ),
                                  const YellowDivider(),
                                  RepeatedListTile(
                                    icon: Icons.logout,
                                    //todo come back to set this function
                                    onPressed: () {},
                                    title: 'Log Out',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final String title;
  final String subTitle;
  const RepeatedListTile({
    super.key,
    required this.icon,
    this.onPressed,
    this.subTitle = '',
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String HeaderLabel;
  const ProfileHeaderLabel({
    super.key,
    required this.HeaderLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            HeaderLabel,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
