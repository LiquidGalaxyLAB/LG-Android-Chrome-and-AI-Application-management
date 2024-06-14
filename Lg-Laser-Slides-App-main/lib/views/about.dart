import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: w,
                  height:MediaQuery.of(context).size.width > 1000 ? h *0.5 : h * 0.2,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/about.jpg"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: w,
                  height: h * 0.22,
                  margin:const EdgeInsets.all(10),
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                      Color.fromARGB(255, 0, 107, 194),
                      Color.fromARGB(255, 0, 61, 110)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    )
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("ABOUT",style: TextStyle(fontSize: 25,fontFamily: 'sen',fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("LaserSlides is a very simple, dirty and quick OSC (Open Sound Control) application which lets you modify OSC messages on your phone/tablet, ready to be shown for your laser presentations. This Android application controls the BEYOND laser software by Pangolin. (or any other OSC controlled software or hardware)(C) Pangolin Laser Systems, Inc. (Pangolin.com",
                        style: TextStyle(fontFamily: 'sen',fontSize: 16,color: Colors.white),
                      ),
                      SizedBox(height: 15,),
                      Text("OSC is a protocol for networking sound synthesizers, computers and other media devices usually for show control or musical performance",
                        style: TextStyle(fontFamily: 'sen',fontSize: 16,color: Colors.white),
                      ),
                    ]
                  ),
                ),
                
                const SizedBox(height: 5,),
                SizedBox(
                  width: w,
                  height: h * 0.5,
                  child: Row(
                    children: [
                      Container(
                        width: w * 0.31,
                        height: h *0.5,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 61, 110),
                              blurRadius: 10
                            ),
                          ],
                          gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 107, 194),
                            Color.fromARGB(255, 0, 61, 110)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                          )
                        ),
                        child: const Column(
                          children: [
                            Text("On the BEYOND application, we must go to OSC settings and look for the ip shown. Once we know the ip, we must go to the 'network' button on the LaserSlides app and put the ip that we have seen at BEYOND.",
                              style: TextStyle(fontFamily: 'sen',fontSize: 17,color: Colors.white),
                            ),
                            SizedBox(height: 10,),
                            Text("Now that we are connected, if we double tap on any buttom we get to see a popup which can be used to edit the button. In the popup we can edit all the necessary fields accordingly.",
                              style: TextStyle(fontFamily: 'sen',fontSize: 17,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: w * 0.31,
                        height: h *0.5,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 61, 110),
                              blurRadius: 10
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 107, 194),
                            Color.fromARGB(255, 0, 61, 110)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                          )
                        ),
                        child: const Column(
                          children: [
                            Text("Let's edit the 'button 1'. On the label, we have to put the name we want to see at the button. On the path field, we are going to put the BEYOND PATH where the image we want to display is stored. First and foremost, we must know how BEYOND PATH works, the first cell is the 0 0, and the first row goes from 0 0, to 0 9. The second row 0 10, to 0 19 and so on. Once we know this, the command we have to use is: beyond/general/ startcue 0 0 (for the first cell) There are other default commands as blackout: beyond/master/blackout",
                              style: TextStyle(fontFamily: 'sen',fontSize: 17,color: Colors.white),
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      Container(
                        width: w * 0.31,
                        height: h *0.5,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 61, 110),
                              blurRadius: 10
                            ),
                          ],
                          gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 107, 194),
                            Color.fromARGB(255, 0, 61, 110)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                          )
                        ),
                        child: const Column(
                          children: [
                            Text("All the OSC commands references can be found at https://wiki.pangolin.com/beyond:osc _commands \n Finally we save the modifications and if we do not want to keep editing, we press again the 'edit mode'.",
                              style: TextStyle(fontFamily: 'sen',fontSize: 17,color: Colors.white),
                            ),
                            SizedBox(height: 20,),
                            Text("LaserSlides is based on QuickOSC https://github.com/ahmetkizilay/QuickOSC-as \n\nModified by Albert Merino and Artur Cullerés LiquidGalaxyLab interns",
                              style: TextStyle(fontFamily: 'sen',fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),                
              ],
            ),
          ),
        )

      ),
    );
  }
}





