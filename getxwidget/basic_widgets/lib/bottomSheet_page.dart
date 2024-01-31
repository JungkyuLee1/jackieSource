import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gex Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Get.bottomSheet(SampleBottomSheet());

            Get.bottomSheet(
              Container(
                // color: Colors.white,
                child: Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Light Theme'),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Dark Theme'),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    )
                  ],
                ),
              ),
              // barrierColor: Colors.transparent,
              backgroundColor: Colors.red,
              isDismissible: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            );
          },
          child: Text('BottomSheet'),
        ),
      ),
    );
  }
}


class SampleBottomSheet extends StatelessWidget {
  const SampleBottomSheet({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('만들기'),
        IconButton(onPressed: Get.back, icon: Icon(Icons.close))
      ],
    );
  }

  Widget _itemButton(
      {required String icon,
      required double iconSize,
      required String label,
      required Function onTap}) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
          child: InkWell(onTap: () => onTap(), child: Icon(Icons.opacity)),
        ),
        SizedBox(
          width: 15,
        ),
        Text(label)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Container(
        padding: EdgeInsets.only(left: 8),
        height: 200,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10,
            ),
            _itemButton(
                icon: 'upload',
                iconSize: 20,
                label: '동영상 업로드',
                onTap: () {
                  print('동영상 업로드 기능');
                }),
            SizedBox(
              height: 10,
            ),
            _itemButton(
                icon: 'broadcast',
                iconSize: 20,
                label: '실시간 스트리밍',
                onTap: () {
                  print('실시간 스트리밍 기능');
                }),
          ],
        ),
      ),
    );
  }
}
