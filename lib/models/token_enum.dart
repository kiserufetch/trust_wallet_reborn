enum Token {
  bitcoin('Bitcoin', 'BTC', 'assets/coins/placeholder.png'),
  ethereum('Ethereum', 'ETH', 'assets/coins/placeholder.png'),
  xrp('XRP', 'XRP', 'assets/coins/placeholder.png'),
  bnbSmartChain('BNB Smart Chain', 'BNB', 'assets/coins/placeholder.png'),
  solana('Solana', 'SOL', 'assets/coins/placeholder.png'),
  dogecoin('Dogecoin', 'DOGE', 'assets/coins/placeholder.png'),
  cardano('Cardano', 'CARD', 'assets/coins/placeholder.png'),
  tron('Tron', 'TRN', 'assets/coins/placeholder.png'),
  avalanche('Avalanche C-Chain', 'AVC', 'assets/coins/placeholder.png'),
  stellar('Stellar', 'STE', 'assets/coins/placeholder.png'),
  sui('Sui', 'SUI', 'assets/coins/placeholder.png'),
  ton('TON', 'TON', 'assets/coins/placeholder.png');

  final String name;
  final String short;

  final String iconPath;

  const Token(this.name, this.short, this.iconPath);
}
