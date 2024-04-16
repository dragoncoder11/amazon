import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/home/presentation/views/widgets/check_box_view.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
      child: SafeArea(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      CheckBoxView(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0125,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .125,
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                imageUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWeDn1kVQPsmF2ea3nLT8-DM_D8ZGObjxfQNFmQDF66X7D-EY3Dcc8XZk8Yg&s'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'bjsbvjdsvjdvfdnkmkfm bkmfbk',
                            style: Styles.style16Black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('jjjbjb  :  fthgghv '),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .26,
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(20)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                     CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.width * .045,
                                     child: const Center(child:Icon(Icons.remove)),),
                                     const Text('1',style: Styles.style16Black,),
                                     CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.width * .045,
                                     child: const Center(child:Icon(Icons.add)),),
                                    ],),
                              ),
                              const Text(
                                r'$ 76',
                                style: Styles.style20B0ld,
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                  const Divider(height: 40,thickness: .5,)
                ],
              );
            }),
      ),
    );
  }
}
