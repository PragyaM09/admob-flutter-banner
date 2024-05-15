import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomBannerAd extends StatefulWidget {
  const CustomBannerAd({Key? key}) : super(key: key);

  @override
  State<CustomBannerAd> createState() => _CustomBannerAdState();
}

class _CustomBannerAdState extends State<CustomBannerAd> {
  BannerAd? bannerAd;
  bool isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111", // Test ad unit ID
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          print("Failed to load banner ad: $error");
          setState(() {
            isBannerAdLoaded = false;
          });
        },
        onAdLoaded: (ad) {
          print("Banner ad loaded successfully");
          setState(() {
            isBannerAdLoaded = true;
          });
        },
      ),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isBannerAdLoaded
        ? SizedBox(
      width: double.infinity,
      height: 50,
      child: AdWidget(
        ad: bannerAd!,
      ),
    )
        : SizedBox();
  }
}
