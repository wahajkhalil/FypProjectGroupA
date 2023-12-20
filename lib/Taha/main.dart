import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/bottomNavigation.dart';
import 'package:fyp/bottomNavigationProvider.dart';
import 'package:fyp/notification_screen.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> _cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: SafeArea(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BottomNavBarScreen(),
        ),
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // showModalBottomSheet(
      //   isScrollControlled: true,
      //   enableDrag: false,
      //   context: context,
      //   builder: (BuildContext context) {
      //     return Container(
      //       child: Padding(
      //         padding: const EdgeInsets.all(25.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             const Text(
      //               'Choose Payment Method',
      //               style:
      //                   TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      //             ),
      //             const SizedBox(
      //               height: 25,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   padding: const EdgeInsets.symmetric(
      //                       vertical: 12.0, horizontal: 23),
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                       color: Colors.grey, // Gray border color
      //                     ),
      //                     borderRadius: BorderRadius.circular(15.0),
      //                     color: Colors.white, // White background color
      //                   ),
      //                   child: const Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: <Widget>[
      //                       Icon(Icons.barcode_reader, color: Colors.grey),
      //                       SizedBox(width: 4.0),
      //                       Text(
      //                         'Scan Barcode',
      //                         style:
      //                             TextStyle(fontSize: 13.0, color: Colors.grey),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.symmetric(
      //                       vertical: 12.0, horizontal: 30),
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                       color: Colors.grey, // Gray border color
      //                     ),
      //                     borderRadius: BorderRadius.circular(15.0),
      //                     color: Colors.white, // White background color
      //                   ),
      //                   child: const Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: <Widget>[
      //                       Icon(Icons.qr_code_2, color: Colors.grey),
      //                       SizedBox(width: 4.0),
      //                       Text(
      //                         'My Barcode',
      //                         style:
      //                             TextStyle(fontSize: 13.0, color: Colors.grey),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(
      //               height: 25,
      //             ),
      //             const Text(
      //               'Scan the Barcode that has been provided by the seller with your phone camera',
      //               style: TextStyle(fontSize: 14.0, color: Colors.grey),
      //             ),
      //             const SizedBox(
      //               height: 35,
      //             ),
      //             // Add more list tiles or widgets as needed
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );
      showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue, // Change the color as needed
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 20,
                            color:
                                Colors.white, // Change the icon color as needed
                          ),
                        ),
                      ),
                      const Text(
                        'Total Amount',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),

                      const Text(
                        '\$56,000.00',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'CocaCola Bottle 600ml',
                        style: TextStyle(fontSize: 14.0, color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.93,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Gray border color
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white, // White background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/circled_menu.png',
                                      color: const Color(0xFFFF9900),
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 9.0),
                                    Text(
                                      'Category',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Food & Drink',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.93,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Gray border color
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white, // White background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/circled_menu.png',
                                      color: const Color(0xFFFF9900),
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 9.0),
                                    Text(
                                      'Store',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Your Balance',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.93,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Gray border color
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white, // White background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/circled_menu.png',
                                      color: const Color(0xFFFF9900),
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 9.0),
                                    Text(
                                      'Category',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Food & Drink',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.93,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Gray border color
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white, // White background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/circled_menu.png',
                                      color: const Color(0xFFFF9900),
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 9.0),
                                    Text(
                                      'Category',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Food & Drink',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 23),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Gray border color
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white, // White background color
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.barcode_reader, color: Colors.grey),
                                SizedBox(width: 4.0),
                                Text(
                                  'Scan Barcode',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 30),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Gray border color
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white, // White background color
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.qr_code_2, color: Colors.grey),
                                SizedBox(width: 4.0),
                                Text(
                                  'My Barcode',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 35,
                      ),
                      // Add more list tiles or widgets as needed
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CameraPreview(controller),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool obscureText = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xFF1F6CFF),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 37),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Saldo Balance',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                obscureText
                                    ? const Text(
                                        '\$5,000.00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24.0),
                                      )
                                    : const Text(
                                        '• • • • • • • ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24.0),
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white54,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationScreen()), // Replace NotificationScreen() with your actual notification screen widget
                            );
                          },
                          child: Container(
                            width:
                                50, // Adjust the size of the circle as needed
                            height:
                                50, // Adjust the size of the circle as needed
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white24,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size:
                                    30, // Adjust the size of the icon as needed
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27.0, top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey[
                                        300]!, // Adjust the border color as needed
                                    width:
                                        1, // Adjust the border width as needed
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/phonelink_ring.png',
                                      color: const Color(0xFFFF9900),
                                      width: 30,
                                      height: 30,
                                    ),
                                    // SvgPicture.asset(
                                    //   'assets/savg/phonelink_ring.svg', //\/ Set color if needed
                                    //   width: 30, // Set width if needed
                                    //   height: 30, // Set height if needed
                                    // ),
                                    const Text('Internet'),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey[
                                        300]!, // Adjust the border color as needed
                                    width:
                                        1, // Adjust the border width as needed
                                  ),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/treasure_chest.png',
                                        color: const Color(0xFFFF9900),
                                        width: 30,
                                        height: 30,
                                      ),
                                      const Text('Gold')
                                    ]),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey[
                                        300]!, // Adjust the border color as needed
                                    width:
                                        1, // Adjust the border width as needed
                                  ),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/conflict.png',
                                        color: const Color(0xFFFF9900),
                                        width: 30,
                                        height: 30,
                                      ),
                                      const Text('Electrcity')
                                    ]),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey[
                                        300]!, // Adjust the border color as needed
                                    width:
                                        1, // Adjust the border width as needed
                                  ),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/circled_menu.png',
                                        color: const Color(0xFFFF9900),
                                        width: 30,
                                        height: 30,
                                      ),
                                      const Text('Others')
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Promo For You',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 30,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: 250,
                                  height: 45,
                                  margin: const EdgeInsets.only(
                                      right: 16, top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F6CFF),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lorem ipsum dolor',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              'Lorem ipsum dolor',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                      Icon(
                                        Icons.image,
                                        color: Colors.white,
                                        size:
                                            25, // Adjust the size of the icon for visibility
                                      ),
                                    ],
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Financial Articles',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 30,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 190,
                                      height: 100,
                                      margin: const EdgeInsets.only(
                                          right: 16, top: 8, bottom: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.grey[500],
                                        size:
                                            40, // Adjust the size of the icon for visibility
                                      ),
                                    ),
                                    const Text(
                                      'Lorem ipsum dolor',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const Text(
                                      'Lorem ipsum dolor sendulur',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 13.0),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF9900),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Container(
                                width:
                                    20, // Adjust the size of the inner container to fit the icon
                                height:
                                    20, // Adjust the size of the inner container to fit the icon
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFFFF9900),
                                    size:
                                        19, // Adjust the size of the icon for visibility
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Top Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          )
                        ],
                      ),
                      const SizedBox(
                          width: 8), // Adjust the spacing between boxes
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8674F5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Container(
                                width:
                                    20, // Adjust the size of the inner container to fit the icon
                                height:
                                    20, // Adjust the size of the inner container to fit the icon
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Color(0xFF8674F5),
                                    size:
                                        19, // Adjust the size of the icon for visibility
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Send',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          )
                        ],
                      ),
                      const SizedBox(
                          width: 8), // Adjust the spacing between boxes
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6854),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Container(
                                width:
                                    20, // Adjust the size of the inner container to fit the icon
                                height:
                                    20, // Adjust the size of the inner container to fit the icon
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Color(0xFFFF6854),
                                    size:
                                        20, // Adjust the size of the icon for visibility
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Request',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
