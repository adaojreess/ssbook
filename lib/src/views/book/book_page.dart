import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/components/placeholder_image_network/placeholder_image_network.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://m.media-amazon.com/images/I/51jmxTnOv6L.jpg',
            errorWidget: (_, __, ___) => const ErrorImageNetwork(),
            placeholder: (_, __) => const PlaceholderImageNetwork(),
            imageBuilder: (_, image) => Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: image,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: _bookDetailsWidget(context),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .05,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionIconWidget(context, icon: Icons.arrow_back,
                      onPressed: () {
                    Navigator.pop(context);
                  }),
                  _actionIconWidget(context, icon: Icons.more_vert),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  IconButton _actionIconWidget(BuildContext context,
      {required IconData icon, VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
    );
  }

  SizedBox _bookDetailsWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
          ),
        ),
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
              ).copyWith(
                top: MediaQuery.of(context).size.height / 20,
              ),
              child: Column(
                children: [
                  _bookTitleWidget(context),
                  _bookDescriptionWidget(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _bookDescriptionWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .05,
      ),
      child: Text(
        """
Simon Basset, o irresistível duque de Hastings, acaba de retornar a Londres depois de seis anos viajando pelo mundo. Rico, bonito e solteiro, ele é um prato cheio para as mães da alta sociedade, que só pensam em arrumar um bom partido para suas filhas. Simon, porém, tem o firme propósito de nunca se casar. Assim, para se livrar das garras dessas mulheres, precisa de um plano infalível. É quando entra em cena Daphne Bridgerton, a irmã mais nova de seu melhor amigo. Apesar de espirituosa e dona de uma personalidade marcante, todos os homens que se interessam por ela são velhos demais, pouco inteligentes ou destituídos de qualquer tipo de charme. E os que têm potencial para ser bons maridos só a veem como uma boa amiga. ""
                          A ideia de Simon é fingir que a corteja. Dessa forma, de uma tacada só, ele conseguirá afastar as jovens obcecadas por um marido e atrairá vários pretendentes para Daphne. Afinal, se um duque está interessado nela, a jovem deve ter mais atrativos do que aparenta.""",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.accentColor.withOpacity(1),
        ),
      ),
    );
  }

  Container _bookTitleWidget(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'O duque e eu (Os Bridgertons Livro 1)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .01,
                bottom: MediaQuery.of(context).size.height * .05,
              ),
              child: Text(
                'Julia Quinn',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.accentColor.withOpacity(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
