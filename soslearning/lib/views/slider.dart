import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soslearning/bloc/slide_change/bloc/slide_bloc_bloc.dart';

class ImgSlider extends StatelessWidget {
  const ImgSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List li = [
      'https://i.ytimg.com/vi/i5tjmnP8w7M/maxresdefault.jpg',
      'https://i.ytimg.com/vi/bE44WW6t1QU/maxresdefault.jpg',
      'https://i.ytimg.com/vi/K2cRR3TB7Rk/maxresdefault.jpg',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: CarouselSlider.builder(
                    itemCount: li.length,
                    itemBuilder: (context, index, realindex) {
                      return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  li[index],
                                )),
                          ));
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        BlocProvider.of<SlideBlocBloc>(context)
                            .add(PageChangeEvent(page: index));
                      },
                      autoPlay: true,
                      viewportFraction: 1,
                    )),
              ),
              BlocBuilder<SlideBlocBloc, SlideBlocState>(
                builder: (context, state) {
                  if (state is PageChangeState) {
                    return Positioned(
                        top: 100,
                        left: MediaQuery.of(context).size.width / 2.5,
                        child: AnimatedSmoothIndicator(
                            effect: SwapEffect(
                                dotHeight: 12,
                                dotWidth: 12,
                                dotColor: Colors.white,
                                activeDotColor: Colors.red),
                            activeIndex: state.page_vlaue!,
                            count: li.length));
                  }
                  return Container();
                },
              ),
            ],
          )),
    );
  }
}
