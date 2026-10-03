import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'action_item.dart';

class ActionGrid extends ViewModelWidget<GenerateBillViewModel> {
  const ActionGrid();

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    return Row(
      children: [
        Expanded(child: ActionItem(icon: Icons.share, label: 'Share', onTap: viewModel.shareBill)),
        UIHelper.horizontalSpaceSmall,
        Expanded(
          child: ActionItem(icon: Icons.download, label: 'PDF', onTap: viewModel.downloadPDF),
        ),
        UIHelper.horizontalSpaceSmall,
        Expanded(
          child: ActionItem(icon: Icons.chat, label: 'WhatsApp', onTap: viewModel.shareBill),
        ),
      ],
    );
  }
}
