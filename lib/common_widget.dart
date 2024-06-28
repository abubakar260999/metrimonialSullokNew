import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Global/constant.dart';

typedef BuildContextCallback = void Function(BuildContext context);

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final bool? resizeBottomInset;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final double appBarHeight;
  final String? appBarTitle;
  final bool showAppBar;
  final bool appBarCenterTitle;
  final Widget? leadingAppBar;
  final bool showBackButton;
  final List<Widget>? appBarAction;
  final bool bottomSafeArea;
  final double? leadingWidthAppBar;
  final bool showAppBarBackButton;
  final PreferredSizeWidget? bottom;
  final Function(BuildContext context)? onPressedBack;
  const BaseScaffold({
    super.key,
    required this.child,
    this.bottomSafeArea = true,
    this.showAppBarBackButton = true,
    this.appBarTitle,
    this.appBarCenterTitle = true,
    this.appBarAction,
    this.leadingAppBar,
    this.showBackButton = true,
    this.leadingWidthAppBar,
    this.bottom,
    this.appBarHeight = 56,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.showAppBar = true,
    this.resizeBottomInset = false,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: resizeBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        appBar: showAppBar
            ? ScrapyAppBar(
                bottom: bottom,
                appBarHeight: appBarHeight,
                showBackButton: showAppBarBackButton,
                title: appBarTitle,
                leadingWidth: leadingWidthAppBar,
                leadingWidget: leadingAppBar,
                centerTitle: appBarCenterTitle,
                actions: appBarAction,
                onPressedBack:
                    onPressedBack != null ? onPressedBack!(context) : null,
              )
            : null,
        // body: HideKeyboardOnBackgroundClick(
        //   child: SafeArea(
        //     bottom: bottomSafeArea,
        //     child: Consumer<ConnectivityProvider>(builder:
        //         (BuildContext context, ConnectivityProvider value,
        //         Widget? childer) {
        //       if (value.status == ConnectivityStatus.Disconnected) {
        //         return child;
        //       } else {
        //         value.showNoInternetSnackbar(context);
        //         return Container(
        //           color: AppColor.adsColor,
        //         );
        //       }
        //     }),
        //   ),
        // ),
      );
}

class ScrapyTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChangedCallBack;
  final TextEditingController? controller;
  final Widget? prefix;
  final bool isObSecure;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool enable;
  final bool filled;
  final bool showCursor;
  final VoidCallback? onSearchPressed;
  final Function(String)? onFieldSubmitted;

  const ScrapyTextFormField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.validator,
    this.hintStyle,
    this.controller,
    this.keyboardType,
    this.onChangedCallBack,
    this.isObSecure = false,
    this.maxLines,
    this.errorText,
    this.onSearchPressed,
    this.enable = true,
    this.filled = true,
    this.showCursor = true,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      showCursor: showCursor,
      enabled: enable,
      onTap: onSearchPressed,
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      onChanged: onChangedCallBack,
      obscureText: isObSecure,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefix,
        contentPadding: const EdgeInsets.all(16).r,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
        filled: filled,
        fillColor: Colors.white,
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
      ),
      validator: validator,
    );
  }
}

class ScrapyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final double appBarHeight;
  final double? leadingWidth;
  final bool centerTitle;
  final bool navigate;
  final PreferredSizeWidget? bottom;
  final double? titleSpacing;
  final bool showBackButton;
  final List<Widget>? actions;
  final Function(BuildContext context)? onPressedBack;

  const ScrapyAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leadingWidget,
    this.titleStyle,
    this.appBarHeight = 56.0,
    this.leadingWidth,
    this.titleSpacing,
    this.centerTitle = true,
    this.showBackButton = true,
    this.navigate = true,
    this.titleWidget,
    this.actions,
    this.bottom,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      bottom: bottom,
      leading: leadingWidget ??
          (showBackButton
              ? ScrapyBackButton(
                  onPressedBack:
                      onPressedBack != null ? onPressedBack!(context) : null,
                )
              : SizedBox()),
      title: titleWidget ??
          Text(
            title ?? '',
            style: titleStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.5),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class ScrapyBackButton extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  final double? iconSize;
  final VisualDensity? visualDensity;
  final Function(BuildContext context)? onPressedBack;
  const ScrapyBackButton(
      {super.key,
      this.color,
      this.padding,
      this.visualDensity,
      this.iconSize,
      this.onPressedBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      visualDensity: visualDensity,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: color,
        size: iconSize,
      ),
    );
  }

// _pressedBack(BuildContext context) {
//   if (onPressedBack == null) {
//     Navigator.of(context).pop();
//   } else {
//     onPressedBack!(context);
//   }
// }

// void _pressedBack(BuildContext context) {
//   print(onPressedBack);
//   if (onPressedBack == null) {
//     // Navigator.of(context).pop();
//   } else {
//     onPressedBack!(context);
//   }
// }
}

class MyOutlineButton extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final BuildContextCallback onPressed;
  final Size? fixedSize;
  final Color? borderColor;
  const MyOutlineButton(
      {super.key,
      this.title,
      required this.onPressed,
      this.fixedSize,
      this.borderColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: fixedSize ?? Size(1.sw, 50.h),
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(color: borderColor ?? AppColor.black, width: 0.5)),
      onPressed: () => onPressed!(context),
      child: Text(
        title ?? "nothing",
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class MyIconTextButton extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const MyIconTextButton({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon ?? Icons.add,
          size: 18.0,
        ),
        const HorizontalSpacing(of: 8),
        Text(
          text ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }
}

class CaptionTextField extends StatelessWidget {
  final String caption;
  final String captionBelowHint;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChangedCallBack;
  final String? Function(String?)? validator;

  const CaptionTextField(
      {super.key,
      this.caption = 'Add Name',
      this.captionBelowHint = '',
      this.controller,
      this.keyboardType = TextInputType.text,
      this.hintText = 'User name',
      this.onChangedCallBack,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        captionBelowHint.isNotEmpty
            ? Text(
                captionBelowHint,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12.0,
                    ),
              )
            : const SizedBox(),
        const VerticalSpacing(of: 4),
        ScrapyTextFormField(
          validator: validator,
          onChangedCallBack: onChangedCallBack,
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

class ScrapyDropDown<T> extends StatelessWidget {
  final List<T> dropdownList;
  final String hintText;
  final Widget? prefixIcon;
  final T? value;
  final bool? borderEnabled;
  final Color? fillColor;
  final Color? iconColor;
  final VisualDensity? visualDensity;
  final bool isDense;
  final bool? isExpanded;
  final void Function(T?)? onChanged;
  const ScrapyDropDown(
      {super.key,
      required this.dropdownList,
      this.onChanged,
      this.borderEnabled = true,
      this.fillColor,
      this.hintText = 'Please Select Option',
      this.isDense = true,
      this.iconColor,
      this.value,
      this.visualDensity,
      this.isExpanded,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: EdgeInsets.zero,
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      iconEnabledColor: iconColor ?? AppColor.purple,
      decoration: InputDecoration(
        iconColor: iconColor ?? AppColor.purple,
        fillColor: fillColor,
        filled: fillColor != null ? true : false,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: borderEnabled == true
                ? BorderSide(color: AppColor.black.withOpacity(0.1))
                : BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: borderEnabled == true
                ? BorderSide(color: AppColor.black.withOpacity(0.1))
                : BorderSide(color: AppColor.black.withOpacity(0.1))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: borderEnabled == true
              ? BorderSide(color: AppColor.black.withOpacity(0.1))
              : BorderSide(color: AppColor.black.withOpacity(0.1)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        prefixIconConstraints: const BoxConstraints(minHeight: 20),
      ),
      hint: Text(
        hintText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
      ),
      value: value,
      isExpanded: isExpanded ?? false,
      isDense: isDense ?? true,
      items: dropdownList.map(
        (val) {
          return DropdownMenuItem<T>(
            value: val,
            child: Text(val.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    )),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );
  }
}

class ScrapyTextFormFieldWithSuffix extends StatelessWidget {
  final String hintText;
  final Function(String)? onChangedCallBack;
  final TextEditingController? controller;
  final Widget? prefix;
  final bool isObSecure;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixTap;

  const ScrapyTextFormFieldWithSuffix({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.validator,
    this.hintStyle,
    this.controller,
    this.keyboardType,
    this.onChangedCallBack,
    this.isObSecure = false,
    this.maxLines,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          onChanged: onChangedCallBack,
          obscureText: isObSecure,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            prefixIcon: prefix,
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffix,
            hintText: hintText,
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
            filled: true,
            fillColor: Colors.white,
            border: border ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
          ),
          validator: validator,
        ),
        if (suffix != null && onSuffixTap != null)
          Positioned.fill(
            child: GestureDetector(
              onTap: onSuffixTap,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
      ],
    );
  }
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({super.key, this.of = 20});
  final double of;
  @override
  Widget build(BuildContext context) => SizedBox(height: of.h);
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({super.key, this.of = 20});
  final double of;
  @override
  Widget build(BuildContext context) => SizedBox(width: of.w);
}

class HideKeyboardOnBackgroundClick extends StatelessWidget {
  final Widget child;
  const HideKeyboardOnBackgroundClick({super.key, required this.child});

  @override
  Widget build(BuildContext context) => GestureDetector(
      child: child, onTap: () => FocusManager.instance.primaryFocus?.unfocus());
}
