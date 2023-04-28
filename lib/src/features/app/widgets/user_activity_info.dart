import 'package:flutter/material.dart';

Row buildUserActivity({required Map<String, String> userData}) {
    return Row(
      children: [
        // * post, followers, following, articles
        Expanded(
          child: Container(
            child:  ListTile(
              title: Center(
                  child: Text(userData["accuracy"]!,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              )),
              subtitle: const Center(child: Text("Accuracy")),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: ListTile(
              title: Center(
                  child: Text(
                userData["bestangle"]!,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              )),
              subtitle: const Center(child: Text("Best Angle")),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: ListTile(
              title: Center( 
                  child: Text(
                userData["worstangle"]!,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              )),
              subtitle: const Center(child: Text("Worst Angle")),
            ),
          ),
        ),

        // Expanded(
        //   child: Container(
        //     child: const ListTile(
        //       title: Center(
        //           child: Text(
        //         "3",
        //         style: TextStyle(
        //             color: Colors.black87, fontWeight: FontWeight.bold),
        //       )),
        //       subtitle: Center(child: Text("Articles")),
        //     ),
        //   ),
        // ),
      ],
    );
  }