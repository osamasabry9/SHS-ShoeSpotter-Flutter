import 'package:flutter/material.dart';

import '../../../../features/shop/domain/entities/product_entity.dart';
import '../../../utils/constants/enums.dart';
import '../../texts/product_price_text_widget.dart';
import '../cart/product_card_add_to_cart_button.dart';

class PriceAndAddToCartWidget extends StatelessWidget {
  const PriceAndAddToCartWidget({
    super.key,
    required this.price,
    required this.product,
  });

  final String price;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Price
        Flexible(
            child: Column(
          children: [
            if ( product.productType == ProductType.single.toString() && product.salePrice > 0)
             Text(product.price.toString(), style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough)),
            ProductPriceTextWidget(price: price),
          ],
        )),

        /// Add to cart button
        ProductCardAddToCartButton(product: product),
      ],
    );
  }
}
