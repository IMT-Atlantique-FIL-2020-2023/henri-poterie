sealed class Offer {
  double apply(double total) => throw UnimplementedError();
}

/// La première offre identifiée par un type percentage est une réduction
/// s’appliquant sur le prix de l’ensemble des livres.
/// Le montant de la réduction est dans value ;
class Percentage implements Offer {
  final double value;

  Percentage({required this.value});

  @override
  apply(double total) => total * (1 - value / 100);
}

/// La deuxième offre identifiée par un type minus est une
/// déduction directement applicable en caisse d’un montant de value
class Minus implements Offer {
  final double value;

  Minus({required this.value});

  @override
  apply(double total) => total - value;
}

/// a troisième offre identifiée par un type slice est un remboursement
/// par tranche d’achat. Dans cet exemple, on rembourse 12€
/// par tranche de 100€ d’achat.
class Slice implements Offer {
  final double value;
  final double sliceValue;

  Slice({required this.value, required this.sliceValue});

  @override
  apply(double total) => total - (total / sliceValue).floor() * value;
}
