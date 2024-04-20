import 'package:flutter/material.dart';
import 'package:todoapp/presentation/screens/to_do_home_screen.dart/widgets/header_section_widgets/widgets.dart';

/* Apartado arriba del home */
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 2, child: _BurgerButtonSection()),
        Expanded(flex: 3, child: _HeaderSection()),
      ],
    );
  }
}

/* Este boton hamburgueza no tiene funcionalidad va con fines de diseño de 
  la app */
class _BurgerButtonSection extends StatelessWidget {
  const _BurgerButtonSection();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    );
  }
}

// Apartado en donde estan alojados la imagen y los headers izquierdos
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: HeaderDescriptionSection()),
        Expanded(flex: 2, child: ImageSection()),
      ],
    );
  }
}
