import 'package:flutter/material.dart';

class FilterSearchMovie extends StatelessWidget {
  const FilterSearchMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.8),
      padding: const EdgeInsets.only(top: 8),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Sort & Filter', )),
            Text('Categories'),
            SizedBox(height: 16,),
            Container(height: 72, color: Colors.red,),

            SizedBox(height: 16,),
            Text('Regions'),
            SizedBox(height: 16,),
            Container(height: 72, color: Colors.red,),

            SizedBox(height: 16,),
            Text('Genre'),
            SizedBox(height: 16,),
            Container(height: 72, color: Colors.red,),


            SizedBox(height: 16,),
            Text('Time/Periods'),
            SizedBox(height: 16,),
            Container(height: 72, color: Colors.red,),


            SizedBox(height: 16,),
            Text('Sort'),
            SizedBox(height: 16,),
            Container(height: 72, color: Colors.red,),

            SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.5),
                      minimumSize: Size((MediaQuery.sizeOf(context).width * 0.5 - 20), 46)),
                  child: const Text('Reset'),
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {

                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size((MediaQuery.sizeOf(context).width * 0.5 - 20), 46)),
                    child: Text(
                      'Apply',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                    )),
                const SizedBox(
                  width: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
