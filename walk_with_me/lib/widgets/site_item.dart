import 'package:flutter/material.dart';
import 'package:walk_with_me/models/site.dart';

class SiteItem extends StatelessWidget {
  const SiteItem({
    Key? key,
    required this.site,
  }) : super(key: key);

  final Site site;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        width: 150.0,
        height: 200.0,
        child: Stack(
          children: [
            Hero(
              tag: 'site_' + site.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  child: Image(
                    height: double.infinity,
                    width: double.infinity,
                    image: NetworkImage(site.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: SizedBox(
                width: 150,
                child: Text(
                  site.name,
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
