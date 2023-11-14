
import 'package:bematched/config.dart';



class AppColors{
  static const Color themeColor = Color(0xFFEB4887);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const LOCATION_COLOR = Color(0xff7900FD);
  static const WHITE = Color(0xffFFFFFF);
  static const SILICON_VELLEY = Color(0xffB984F4);
  static const BLACK = Color(0xff162534);
  static const DARK_BLUE = Color(0xff162534);
  static const GREY = Color(0xff8F8F8F);

}


class AppLanguage extends Translations{
  static const appName = 'BeMatch';
  static const welcomeTo = 'Welcome to';
  static const welcomeToDescription = 'Connecting Mongolians, One Swipe at a Time!';
  static const start = 'Start';
  static const LOGIN = 'Login';


  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      appName: appName,

    },
  };

}

class AppFonts {
  static const INTER_BLACK = 'Inter-Black';
  static const INTER_BOLD = 'Inter-Bold';
  static const INTER_EXTRABOLD = 'Inter-ExtraBold';
  static const INTER_EXTRALIGHT = 'Inter-ExtraLight';
  static const INTER_LIGHT = 'Inter-Light';
  static const INTER_MEDIUM = 'Inter-Medium';
  static const INTER_REGULAR = 'Inter-Regular';
  static const INTER_SEMIBOLD = 'Inter-SemiBold';
  static const INTER_THIN = 'Inter-Thin';
}






const List<Map<String, dynamic>> interests = <Map<String, dynamic>>[
  <String, dynamic>{
    'icon': Icons.photo_camera_outlined,
    'text': 'Photography',
  },
  <String, dynamic>{
    'icon': Icons.shopping_bag_outlined,
    'text': 'Shopping',
  },
  <String, dynamic>{
    'icon': Icons.mic_none_outlined,
    'text': 'Karaoke',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Yoga',
  },
  <String, dynamic>{
    'icon': Icons.cookie,
    'text': 'Cooking',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Tennis',
  },
  <String, dynamic>{
    'icon': Icons.run_circle,
    'text': 'Run',
  },
  <String, dynamic>{
    'icon': Icons.waves,
    'text': 'Swimming',
  },
  <String, dynamic>{
    'icon': Icons.art_track,
    'text': 'Art',
  },
  <String, dynamic>{
    'icon': Icons.travel_explore,
    'text': 'Travelling',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Extreme',
  },
  <String, dynamic>{
    'icon': Icons.queue_music,
    'text': 'Music',
  },
  <String, dynamic>{
    'icon': Icons.wine_bar_outlined,
    'text': 'Drink',
  },
  <String, dynamic>{
    'icon': Icons.videogame_asset,
    'text': 'Video games',
  },
];

class ImageAssets {
  static const logo = 'assets/images/logo.png';
  static const homeBG = 'assets/images/home_bg.png';
  static const GIRL_IMAGE = 'assets/images/girl_image.png';
  static const MATCH_IMAGE = 'assets/images/match.png';
  static const KEEP_DATING = 'assets/images/keep_dating.png';
  static const DUMY_IMAGE = 'assets/images/dumy_image.png';
  static const DUMY_IMAGE1 = 'assets/images/dumy_image1.png';

}
class SvgAssets {
  static const FACEBOOK_ICON = 'assets/svgs/facebook_icon.svg';
  static const GOOGLE_ICON = 'assets/svgs/google_icon.svg';
  static const SEARCH_ICON = 'assets/svgs/search_icon.svg';
  static const BELL_ICON = 'assets/svgs/bell_icon.svg';
  static const LIKE_ICON = 'assets/svgs/like_icon.svg';
  static const COMMENT_ICON = 'assets/svgs/comment_icon.svg';
  static const LIST_ICON = 'assets/svgs/list_icon.svg';
  static const FILTER_ICON = 'assets/svgs/filter_icon.svg';
  static const DATE_LIKE_ICON = 'assets/svgs/date_like_icon.svg';
  static const HOME_ICON = 'assets/svgs/home_icon.svg';
  static const HEART_ICON = 'assets/svgs/heart_icon.svg';
  static const ADD_ICON = 'assets/svgs/add_icon.svg';
  static const CHAT_ICON = 'assets/svgs/chat_icon.svg';
  static const PROFILE_ICON = 'assets/svgs/profile_icon.svg';
  static const VIDEO_CALL_ICON = 'assets/svgs/video_icon.svg';
  static const AUDIO_CALL_ICON = 'assets/svgs/audio_call_icon.svg';
  static const CHAT_LIST_ICON = 'assets/svgs/chat_list_icon.svg';
  static const EMOJI_ICON = 'assets/svgs/emoji_icon.svg';
  static const SEND_ICON = 'assets/svgs/send_icon.svg';
  static const CAMERA_ICON = 'assets/svgs/camera_icon.svg';
  static const CLOSE_ICON = 'assets/svgs/close_icon.svg';
  static const STAR_ICON = 'assets/svgs/star_icon.svg';
  static const MESSAGE_ICON = 'assets/svgs/message_icon.svg';
  static const DOWN_ARROW_ICON = 'assets/svgs/down_arrow_icon.svg';
  static const CALENDER_ICON = 'assets/svgs/calender_icon.svg';
  static const SETTING_ICON = 'assets/svgs/setting_icon.svg';



}
