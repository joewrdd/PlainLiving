import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class ViewDepositHistoryModal extends StatelessWidget {
  const ViewDepositHistoryModal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);

    //----- Static Data Will Be Removed When Backend Is Ready -----
    final depositHistory = [
      {
        'id': '1',
        'amount': 500,
        'date': DateTime.now().subtract(const Duration(days: 2)),
        'type': 'deposit',
      },
      {
        'id': '2',
        'amount': 1000,
        'date': DateTime.now().subtract(const Duration(days: 7)),
        'type': 'deposit',
      },
      {
        'id': '3',
        'amount': -200,
        'date': DateTime.now().subtract(const Duration(days: 10)),
        'type': 'withdrawal',
      },
      {
        'id': '4',
        'amount': 200,
        'date': DateTime.now().subtract(const Duration(days: 15)),
        'type': 'deposit',
      },
    ];

    final currentAmount = 1500;
    final targetAmount = 10000;
    final progress = 0.15;
    final progressPercent = 15;

    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.dark : ConstantColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantSizes.borderRadiusLg),
          topRight: Radius.circular(ConstantSizes.borderRadiusLg),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 6,
          left: 6,
          right: 6,
          bottom: ConstantSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color:
                          isDark ? ConstantColors.white : ConstantColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Deposit History',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: ConstantSizes.spaceBtwItems / 2),

            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: ConstantSizes.defaultSpace / 2,
              ),
              padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 2),
              decoration: BoxDecoration(
                color:
                    isDark
                        ? ConstantColors.darkContainer
                        : ConstantColors.lightContainer,
                borderRadius: BorderRadius.circular(
                  ConstantSizes.borderRadiusMd,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Financial Freedom',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$${NumberFormat("#,###").format(currentAmount)} / \$${NumberFormat("#,###").format(targetAmount)}',
                            style: TextStyle(
                              color:
                                  isDark
                                      ? ConstantColors.white
                                      : ConstantColors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.borderRadiusSm,
                          ),
                        ),
                        child: Text(
                          '$progressPercent%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwItems / 2),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor:
                          isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isDark ? Colors.white : Colors.black,
                      ),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: ConstantSizes.defaultSpace / 2,
                top: ConstantSizes.defaultSpace,
                bottom: ConstantSizes.defaultSpace / 2,
              ),
              child: Text(
                'Transaction History',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      isDark ? ConstantColors.white : ConstantColors.darkerGrey,
                ),
              ),
            ),

            Expanded(
              child:
                  depositHistory.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.clockRotateLeft,
                              size: 50,
                              color:
                                  isDark
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No Transactions Yet',
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    isDark
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Add funds to start tracking deposits',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    isDark
                                        ? Colors.grey.shade500
                                        : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                      : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ConstantSizes.defaultSpace / 2,
                        ),
                        itemCount: depositHistory.length,
                        separatorBuilder:
                            (context, index) => Divider(
                              color:
                                  isDark
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade300,
                              height: 1,
                            ),
                        itemBuilder: (context, index) {
                          final transaction = depositHistory[index];
                          final isDeposit = transaction['type'] == 'deposit';
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color:
                                            isDeposit
                                                ? Colors.green.withOpacity(0.1)
                                                : Colors.red.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          isDeposit
                                              ? Icons.arrow_downward
                                              : Icons.arrow_upward,
                                          color:
                                              isDeposit
                                                  ? Colors.green
                                                  : Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          isDeposit ? 'Deposit' : 'Withdrawal',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('MMM dd, yyyy').format(
                                            transaction['date'] as DateTime,
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ConstantColors.darkGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '${isDeposit ? '+' : '-'}\$${NumberFormat("#,###").format(transaction['amount'])}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        isDeposit ? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),

            Padding(
              padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 2),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ConstantSizes.borderRadiusMd,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Back to Goal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
