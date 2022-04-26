import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget{
  const SectionLabel({Key? key, this.label = 'none', this.viewMorePress}) : super(key: key);

  final String label;
  final VoidCallback? viewMorePress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //language_change
        Text(
          label,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
        ),
        if(viewMorePress != null)
          GestureDetector(
            onTap: viewMorePress,
            //language_change
            child: const Text(
              'View All >',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
              ),
            ),
          ),
      ],
    );
  }
}