class CardModel {
  String image;
  String name;
  String value;
  int cardBackground;

  CardModel(this.image, this.name, this.value, this.cardBackground);
}

List<CardModel> cards = cardData.map(
    (item) => CardModel(
        item['image'].toString(),
        item['name'].toString(),
        item['value'].toString(),
        int.parse(item['cardBackground'].toString()),
    )
).toList();

var cardData = [
  {
    "image": "assets/images/bitcoin.png",
    "name": "Bitcoin",
    "value": "\$50789.87",
    "cardBackground": 0xFFBA68C8,
  },
  {
    "image": "assets/images/ethereum.png",
    "name": "Ethereum",
    "value": "\$3923.45",
    "cardBackground": 0xFFFFA000,
  },
  {
    "image": "assets/images/litecoin.png",
    "name": "Litecoin",
    "value": "\$156.87",
    "cardBackground": 0xFF81D4FA,
  },
  {
    "image": "assets/images/ripple.png",
    "name": "Ripple",
    "value": "\$1.25",
    "cardBackground": 0xFFA18875,
  }
];
