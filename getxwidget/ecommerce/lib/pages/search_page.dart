import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  _buildSearchKeywordResult(String title, IconData leadingIcon, IconData trailingIcon){
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.black),),
      leading:Icon(leadingIcon) ,
      trailing:Icon(trailingIcon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        suffixIcon: Icon(Icons.close),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintText: 'Search Tutorial',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.close)),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text('Recent Search', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              _buildSearchKeywordResult('GetX by Jackie', Icons.search, Icons.close),
              _buildSearchKeywordResult('RiverPod by Jackie', Icons.search, Icons.close),
              _buildSearchKeywordResult('GoRouter by Jackie', Icons.search, Icons.close),
            ],
          ),
        ),
      ),
    );
  }
}
