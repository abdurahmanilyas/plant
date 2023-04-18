part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;

  const CustomTabBar({
    required this.titles,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 1,
            color: const Color(0xfff2f2f2),
          ),
          Row(
            children: titles
                .map((e) => Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onTap != null ? () => onTap!(titles.indexOf(e)) : null,
                    child: Text(
                      e,
                      style: titles.indexOf(e) == selectedIndex
                          ? const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )
                          : const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    margin: const EdgeInsets.only(top: 13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.5),
                      color: titles.indexOf(e) == selectedIndex
                          ? const Color(0xff020202)
                          : Colors.transparent,
                    ),
                  )
                ],
              ),
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}