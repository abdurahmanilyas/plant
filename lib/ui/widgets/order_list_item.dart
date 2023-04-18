part of 'widgets.dart';


class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  const OrderListItem({required this.transaction, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(transaction.food.picturePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth - 182, // (60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '${transaction.quantity} item(s) • ${NumberFormat.currency(
                  symbol: 'IDR ',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(transaction.total)}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(transaction.dateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              if (transaction.status == TransactionStatus.cancelled)
                Text(
                  'Cancelled',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffD9435E),
                    fontSize: 10,
                  ),
                )
              else if (transaction.status == TransactionStatus.pending)
                Text(
                  'Pending',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffD9435E),
                    fontSize: 10,
                  ),
                )
              else if (transaction.status == TransactionStatus.on_delivery)
                  Text(
                    'On Delivery',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff1ABC9C),
                      fontSize: 10,
                    ),
                  )
                else
                  const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    final month = DateFormat.MMM().format(dateTime);
    final day = dateTime.day.toString();
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');

    return '$month $day, $hour:$minute';
  }
}