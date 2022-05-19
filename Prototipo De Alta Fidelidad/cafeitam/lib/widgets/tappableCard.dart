import 'package:flutter/material.dart';

///A tappable card with round edges
class TappableCard extends StatelessWidget {
  final cardWidth, cardHeight;
  final Widget cardContent;
  final VoidCallback onTap;
  const TappableCard(
      {Key? key,
      required this.cardWidth,
      required this.cardHeight,
      required this.cardContent,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
            width: cardWidth,
            height: cardHeight ?? cardWidth,
            child: cardContent),
      ),
    );
  }
}

///A tapabble card with an image at the top
class TappableCardWithImage extends StatelessWidget {
  final ImageProvider image;
  final String? imgUrl;
  final Color? imageBackground;
  final double cardWidth, cardHeight, imageHeightAsPercentage;
  final VoidCallback onTap;
  final Widget below;
  const TappableCardWithImage(
      {Key? key,
      required this.cardWidth,
      required this.cardHeight,
      required this.onTap,
      required this.image,
      this.imgUrl,
      required this.imageHeightAsPercentage,
      required this.below,
      this.imageBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TappableCard(
        cardWidth: cardWidth,
        cardHeight: cardHeight,
        onTap: onTap,
        cardContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imgUrl == null
                ? Container(
                    decoration: BoxDecoration(
                        color: imageBackground ?? Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: image,
                        )),
                    width: MediaQuery.of(context).size.width,
                    height: cardHeight * imageHeightAsPercentage,
                    //child: Ink.image(fit: BoxFit.cover, image: image),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: cardHeight * imageHeightAsPercentage,
                    child: Image.network(
                      imgUrl ?? '',
                      errorBuilder: (context, error, stackTrace) => Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.error,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
            Expanded(child: below)
          ],
        ));
  }
}

///A tapabble card with an image at the top
class TappableCardWithImages extends StatelessWidget {
  final List<ImageProvider> images;
  final String? imgUrl;
  final Color? imageBackground;
  final double cardWidth, cardHeight, imageHeightAsPercentage;
  final VoidCallback onTap;
  final Widget below;
  const TappableCardWithImages(
      {Key? key,
      required this.cardWidth,
      required this.cardHeight,
      required this.onTap,
      required this.images,
      this.imgUrl,
      required this.imageHeightAsPercentage,
      required this.below,
      this.imageBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imgs = [];
    for (ImageProvider img in images)
      imgs.add(Expanded(
          child: Image(
        image: img,
        fit: BoxFit.cover,
        height: 200,
      )));
    return TappableCard(
        cardWidth: cardWidth,
        cardHeight: cardHeight,
        onTap: onTap,
        cardContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imgUrl == null
                ? Container(
                    child: Row(
                      children: imgs,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: cardHeight * imageHeightAsPercentage,
                    //child: Ink.image(fit: BoxFit.cover, image: image),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: cardHeight * imageHeightAsPercentage,
                    child: Image.network(
                      imgUrl ?? '',
                      /** 
                      loadingBuilder: (context, child, loadingProgress) =>
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ))),
                                  **/
                      errorBuilder: (context, error, stackTrace) => Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.error,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
            Expanded(child: below)
          ],
        ));
  }
}
