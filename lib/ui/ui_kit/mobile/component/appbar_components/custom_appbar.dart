import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_header_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackPress;
  final String? rightIcon;
  final VoidCallback? onRightIconPressed;
  final bool isBackground;

  const CustomAppbar({
    required this.title,
    this.isBackPress = true,
    this.rightIcon,
    this.onRightIconPressed,
    this.isBackground = true,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  CustomAppbarStyles get _appBarStyle => CustomAppbarStyles.from(isBackground);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 12.0, // title 좌우 패딩 설정
      automaticallyImplyLeading: false, // 자동 leading 적용 비활성화
      toolbarHeight: preferredSize.height,
      systemOverlayStyle: _appBarStyle.systemOverlayStyle, // 상단 시스템 뷰 스타일
      backgroundColor: _appBarStyle.backgroundColor, // AppBar 배경색
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _backPressWidget(),
          const SizedBox(width: 4.0),
          _titleWidget(),
          const Spacer(),
          _rightIconWidget(),
        ],
      ),
    );
  }

  Widget _backPressWidget() {
    return isBackPress
        ? InkWell(
          onTap: () => Get.back(),
          child: SvgPicture.asset(IconPath.iconBack, colorFilter: _appBarStyle.iconColor),
        )
        : const SizedBox.shrink();
  }

  Text _titleWidget() {
    return Text(title, style: TextStyles.Title.copyWith(color: _appBarStyle.textColor));
  }

  /// 배경 상태 상관 없이 아이콘은 호출부에서 컨트롤 하는 것으로 결정....
  /// 다크/라이트 모드 선택시 아이콘 색상 변경의 경우는 추후 고려하기로 결정...
  Widget _rightIconWidget() {
    return rightIcon != null
        ? InkWell(
          onTap: onRightIconPressed ?? () {},
          child: SvgPicture.asset(rightIcon!, colorFilter: _appBarStyle.iconColor),
        )
        : const SizedBox.shrink();
  }
}
