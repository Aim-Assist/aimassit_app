import 'package:flutter/material.dart';

Container buildUserInfo({required String email, required String name, required String phone}) {
  return Container(
    child: ListTile(
      title: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      subtitle: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey.shade400,
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.grey.shade400,
                ),
                Text(
                  phone,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.person,
          //         color: Colors.grey.shade400,
          //       ),
          //       const Text(
          //         "Student",
          //         style: TextStyle(fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}
