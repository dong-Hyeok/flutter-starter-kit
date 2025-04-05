import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timf_match/design_system/widget/drag_handle.dart';
import 'package:timf_match/screens/commons/common_widget/text_button_widget.dart';

class YearMonthPickerView extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime selectedDate) onApply;

  YearMonthPickerView({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onApply,
  });

  final Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    // 초기값 설정
    selectedDate.value = startDate;

    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: bottomSheetDragHandle(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              '월 선택',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.22),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.monthYear, // 년 월 만 나오게 지정
                  dateOrder: DatePickerDateOrder.ymd, // 년 월 일 순서로 지정
                  initialDateTime: selectedDate.value,
                  minimumDate: startDate,
                  maximumDate: endDate,

                  onDateTimeChanged: (DateTime newDate) {
                    if (newDate.isBefore(startDate)) {
                      selectedDate.value = startDate;
                    } else if (newDate.isAfter(endDate)) {
                      selectedDate.value = endDate;
                    } else {
                      selectedDate.value = DateTime(newDate.year, newDate.month);
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 33.0),
            child: TextButtonWidget(
              text: '적용',
              isEnable: true,
              onClick: () {
                onApply(selectedDate.value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
