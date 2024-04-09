import 'package:auth_ease/src/utils/constants/strings/text_strings.dart.dart';
import 'package:auth_ease/src/widgets/custom_widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class FormFieldsWidget extends StatelessWidget {
  final ValueNotifier<bool> passwordNotifier,
  confirmPasswordNotifier;

  const FormFieldsWidget({
    super.key,
    required this.passwordNotifier,
    required this.confirmPasswordNotifier
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextFormField(
          hintText: userNameString,
          validator: (value){},
          leadingWidget: const Icon(Iconsax.user),
        ),
        const Gap(15),
        GenericTextFormField(
          hintText: emailString,
          validator: (value){},
          leadingWidget: const Icon(Icons.email_outlined),
        ),
        const Gap(15),
        GenericTextFormField(
          hintText: phoneNumberString,
          validator: (value){},
          leadingWidget: const Icon(Icons.phone_outlined),
        ),
        const Gap(15),
        GenericTextFormField(
          hintText: addressString,
          validator: (value){},
          leadingWidget: const Icon(Iconsax.home),
        ),
        const Gap(15),
        ValueListenableBuilder(
          valueListenable: passwordNotifier,
          builder: (_, value, __){
            return GenericTextFormField(
              hintText: passwordString,
              validator: (value){},
              leadingWidget: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: () => passwordNotifier.value = !passwordNotifier.value,
                icon: Visibility(
                  visible: value,
                  replacement: const Icon(Icons.visibility_rounded),
                  child: const Icon(Icons.visibility_off_rounded),
                ),
              ),
              obscureText: value ? false : true,
            );
          },
        ),
        const Gap(15),
        ValueListenableBuilder(
          valueListenable: confirmPasswordNotifier,
          builder: (_, value, __){
            return GenericTextFormField(
              hintText: confirmPasswordString,
              validator: (value){},
              leadingWidget: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: () => confirmPasswordNotifier.value = !confirmPasswordNotifier.value,
                icon: Visibility(
                  visible: value,
                  replacement: const Icon(Icons.visibility_rounded),
                  child: const Icon(Icons.visibility_off_rounded),
                ),
              ),
              obscureText: value ? false : true,
            );
          },
        ),
      ],
    );
  }
}