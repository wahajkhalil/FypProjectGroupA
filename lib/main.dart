import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Home/bottomNavigationProvider.dart';
import 'package:fyp_project_group_a/Page/SplashScreen.dart';
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
          home: SplashScreenPage(),
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
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Choose Payment Method',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
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
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.pop(context),
                          showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors
                                                .blue, // Change the color as needed
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.image,
                                              size: 20,
                                              color: Colors
                                                  .white, // Change the icon color as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Total Amount',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey),
                                        ),

                                        const Text(
                                          '\$56,000.00',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          'CocaCola Bottle 600ml',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.blue),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.93,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors
                                                  .grey, // Gray border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors
                                                .white, // White background color
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/circled_menu.png',
                                                        color: const Color(
                                                            0xFFFF9900),
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                      const SizedBox(
                                                          width: 9.0),
                                                      const Text(
                                                        'Category',
                                                        style: TextStyle(
                                                            fontSize: 15.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Text(
                                                  'Food & Drink',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.93,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors
                                                  .grey, // Gray border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors
                                                .white, // White background color
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 30,
                                                        child: Icon(
                                                          Icons.store,
                                                          size: 20,
                                                          color:
                                                              Color(0xFFFF9900),
                                                          // Change the icon color as needed
                                                        ),
                                                      ),
                                                      SizedBox(width: 9.0),
                                                      Text(
                                                        'Store',
                                                        style: TextStyle(
                                                            fontSize: 15.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  'Hajmoto Store',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.93,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors
                                                  .grey, // Gray border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors
                                                .white, // White background color
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 30,
                                                        child: Icon(
                                                          Icons.money,
                                                          size: 20,
                                                          color:
                                                              Color(0xFFFF9900),
                                                          // Change the icon color as needed
                                                        ),
                                                      ),
                                                      SizedBox(width: 9.0),
                                                      Text(
                                                        'Your Balance',
                                                        style: TextStyle(
                                                            fontSize: 15.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '\$ 5000.00',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => {
                                                Navigator.pop(context),
                                                Navigator.pop(context)
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 65),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color(
                                                        0xFFFF9900), // Gray border color
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors
                                                      .white, // White background color
                                                ),
                                                child: const Text(
                                                  'Back',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Color(0xFFFF9900)),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => {
                                                Navigator.pop(context),
                                                showModalBottomSheet(
                                                  isDismissible: false,
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Wrap(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25.0),
                                                          child: Column(
                                                            // mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Image.asset(
                                                                'assets/images/Illustration.png',
                                                                height: 150,
                                                                width: 150,
                                                              ),

                                                              const Text(
                                                                'Payment Success',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              const Text(
                                                                'CocaCola Bottle 600ml',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                              const SizedBox(
                                                                height: 25,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.93,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Gray border color
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Colors
                                                                      .white, // White background color
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      SizedBox(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Image.asset(
                                                                              'assets/images/circled_menu.png',
                                                                              color: const Color(0xFFFF9900),
                                                                              width: 30,
                                                                              height: 30,
                                                                            ),
                                                                            const SizedBox(width: 9.0),
                                                                            const Text(
                                                                              'Category',
                                                                              style: TextStyle(fontSize: 15.0),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const Text(
                                                                        'Food & Drink',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.93,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Gray border color
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Colors
                                                                      .white, // White background color
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              12.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      SizedBox(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 30,
                                                                              child: Icon(
                                                                                Icons.calculate,
                                                                                size: 20,
                                                                                color: Color(0xFFFF9900),
                                                                                // Change the icon color as needed
                                                                              ),
                                                                            ),
                                                                            SizedBox(width: 9.0),
                                                                            Text(
                                                                              'Total Amount',
                                                                              style: TextStyle(fontSize: 15.0),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '\$ 56,000.00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),

                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.93,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Gray border color
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Colors
                                                                      .white, // White background color
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              12.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      SizedBox(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 30,
                                                                              child: Icon(
                                                                                Icons.store,
                                                                                size: 20,
                                                                                color: Color(0xFFFF9900),
                                                                                // Change the icon color as needed
                                                                              ),
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
                                                                        'Hajmoto Store',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.93,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Gray border color
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Colors
                                                                      .white, // White background color
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              12.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      SizedBox(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 30,
                                                                              child: Icon(
                                                                                Icons.money,
                                                                                size: 20,
                                                                                color: Color(0xFFFF9900),
                                                                                // Change the icon color as needed
                                                                              ),
                                                                            ),
                                                                            SizedBox(width: 9.0),
                                                                            Text(
                                                                              'Your Balance',
                                                                              style: TextStyle(fontSize: 15.0),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '\$ 5000.00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              InkWell(
                                                                onTap: () => {
                                                                  Navigator.pop(
                                                                      context),
                                                                  Navigator.pop(
                                                                      context),
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          12.0,
                                                                      horizontal: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.39),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .white, // Gray border color
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    color: const Color(
                                                                        0xFFFF9900), // White background color
                                                                  ),
                                                                  child:
                                                                      const Text(
                                                                    'Okie',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),

                                                              const SizedBox(
                                                                height: 35,
                                                              ),
                                                              // Add more list tiles or widgets as needed
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 65),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors
                                                        .white, // Gray border color
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: const Color(
                                                      0xFFFF9900), // White background color
                                                ),
                                                child: const Text(
                                                  'Pay',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.white),
                                                ),
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
                                ],
                              );
                            },
                          )
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Scan the Barcode that has been provided by the seller with your phone camera',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  // Add more list tiles or widgets as needed
                ],
              ),
            ),
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
