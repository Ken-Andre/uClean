# uClean - Mobilité Durable Universitaire 🌍

[![Flutter](https://img.shields.io/badge/Flutter-3.27.0-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7.0-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](https://github.com/Ken-Andre/uClean)

> **Application mobile de suivi de déplacements écologiques pour la communauté universitaire camerounaise**

**uClean** transforme vos trajets quotidiens en aventure écologique. Mesurez votre empreinte carbone, gagnez des points pour vos choix responsables, et contribuez à un campus plus vert.

---

## 🎯 Comprendre uClean en 30 secondes

**Problème** : Comment sensibiliser les étudiants et enseignants à leur impact environnemental ?

**Solution** : Application mobile ludique qui :
- 📱 **Détecte automatiquement** vos déplacements
- 🎯 **Classification simple** : Personnel vs Professionnel (swipe intuitif)
- 🏆 **Gamification** : Points et récompenses pour comportements écoresponsables
- 📚 **Éducation** : Articles sur l'environnement intégrés
- 📊 **Impact mesurable** : Données pour politiques environnementales universitaires

**Résultat** : Communauté universitaire plus consciente + données concrètes pour actions écologiques

---

## 👥 Vous êtes...

### 🎓 **Étudiant ou Enseignant ?**
→ **[Guide utilisateur simple](GUIDE_UTILISATEUR.md)** - Démarrez en 2 minutes

**Ce que vous gagnez :**
- 🎮 Points et récompenses pour vos trajets écoresponsables
- 📚 Connaissances sur l'environnement via articles intégrés
- 🌍 Contribution concrète à un campus plus vert
- 🔒 Contrôle total sur vos données personnelles

### 💼 **Investisseur ou Partenaire ?**
→ **[Présentation Executive](PRESENTATION_EXECUTIVE.md)** - Modèle économique et opportunités

**Pourquoi investir :**
- 📈 Marché : 50M d'étudiants africains + enjeux climatiques
- 🇨🇲 Innovation camerounaise première de son genre
- 💰 Modèle durable : Gratuit utilisateurs, valeur institutions
- 🚀 Évolutivité : Multi-campus, multi-pays

### 🏛️ **Institution ou Client ?**
→ **[Pitch Deck 5 minutes](PITCH_DECK.md)** - Présentation complète du projet

**Ce que vous obtenez :**
- 📊 Mesure précise de l'empreinte carbone de votre communauté
- 🎯 Données exploitables pour politiques environnementales
- 🔧 Solution clé en main prête à déployer
- 💚 Image responsable et engagement écologique visible

### 👔 **Recruteur RH ?**
→ **[Architecture & Compétences](ARCHITECTURE.md)** - Stack technique et réalisations

**Compétences démontrées :**
- 📱 **Flutter/Dart** : Application mobile complète et moderne
- 🏗️ **Architecture** : BLoC pattern, services modulaires, clean code
- 🎨 **UX/UI** : Material Design 3, animations fluides, gamification
- 🔒 **Sécurité** : Chiffrement, confidentialité, RGPD
- 📊 **Impact mesurable** : 500+ utilisateurs potentiels, données concrètes
- 🌍 **Contexte africain** : Solution adaptée aux réalités camerounaises

### 🛠️ **Développeur Open Source ?**
→ **[Guide de contribution](CONTRIBUTING.md)** - Rejoignez le projet

**Stack technique :**
- Flutter 3.27.0 + Dart 3.7.0
- BLoC pour state management
- Architecture modulaire (services, models, UI)
- CI/CD avec GitHub Actions
- Tests unitaires et d'intégration

---

## ✨ Fonctionnalités principales

### 🚶‍♀️ Suivi automatique intelligent
- Détection des déplacements via WiFi + compteur de pas
- Géolocalisation approximative (confidentialité préservée)
- Mode offline-first pour économie batterie

### 🎯 Classification intuitive
- Interface de swipe moderne (comme Tinder)
- Personnel 🏠 vs Professionnel 🎯
- Feedback visuel immédiat avec animations

### 🏆 Gamification engageante
- Points pour trajets classifiés et articles lus
- Système d'achievements et de streaks
- Progression visible et motivante

### 📚 Éducation environnementale
- Articles Markdown sur l'écologie
- Points automatiques après lecture
- Contenu adapté au contexte africain

### 🔒 Confidentialité respectée
- Pas de GPS précis, seulement WiFi connu
- Stockage local chiffré (SharedPreferences)
- Conformité RGPD et loi camerounaise
- Contrôle utilisateur total

---

## 🚀 Démarrage rapide

### Prérequis
- Flutter SDK ≥ 3.27.0
- Dart SDK ≥ 3.7.0
- Android Studio ou VS Code

### Installation

```bash
# Cloner le repository
git clone https://github.com/Ken-Andre/uClean.git
cd uClean

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

### Configuration

1. **API Backend** : Configurer l'URL dans `lib/core/environment/`
2. **Permissions** : Accepter les permissions nécessaires au premier lancement
3. **Onboarding** : Suivre les 3 étapes de présentation

---

## 📊 Métriques du projet

- **Version actuelle** : 1.0.19
- **Lignes de code** : ~15 000 (Dart)
- **Écrans** : 20+ interfaces utilisateur
- **Services** : 8 services cœurs interconnectés
- **Tests** : Unitaires + intégration
- **CI/CD** : GitHub Actions automatisé

---

## 🏗️ Architecture technique

```
uClean/
├── lib/
│   ├── core/              # Utilitaires, constantes, configuration
│   ├── data/              # Modèles de données, repositories
│   ├── services/          # 8 services métier (Trip, Gamification, etc.)
│   ├── presentation/      # 20+ écrans avec BLoC pattern
│   ├── widgets/           # Composants réutilisables
│   └── routes/            # Navigation centralisée
├── assets/
│   ├── articles/          # Contenu éducatif Markdown
│   ├── images/            # 100+ assets visuels
│   └── config/            # Configuration gamification
├── .github/workflows/     # CI/CD automatisé
└── docs/                  # Documentation complète
```

**Détails complets** : [ARCHITECTURE.md](ARCHITECTURE.md)

---

## 🛠️ Stack technique

### Frontend
- **Flutter** 3.27.0 - Framework UI cross-platform
- **Dart** 3.7.0 - Langage de programmation
- **Material Design 3** - Design system moderne

### State Management
- **Flutter BLoC** 8.1.4 - Architecture réactive
- **Equatable** - Comparaison d'états optimisée

### Services
- **Dio** 5.5.0 - Client HTTP
- **Shared Preferences** 2.3.2 - Stockage local
- **Permission Handler** 11.4.0 - Gestion permissions
- **Pedometer** 4.0.1 - Compteur de pas
- **Flutter Local Notifications** 17.2.2 - Notifications

### UI/UX
- **Lottie** 3.1.0 - Animations
- **Cached Network Image** 3.4.1 - Cache images
- **Flutter SVG** 2.0.14 - Support SVG
- **Dots Indicator** 3.0.0 - Indicateurs de page

**Liste complète** : [pubspec.yaml](pubspec.yaml)

---

## 📱 Captures d'écran

<table>
  <tr>
    <td><b>🏠 Accueil</b><br/>Suivi en temps réel</td>
    <td><b>🎯 Classification</b><br/>Swipe intuitif</td>
    <td><b>📚 Articles</b><br/>Éducation écologique</td>
  </tr>
  <tr>
    <td><i>Interface moderne avec statistiques</i></td>
    <td><i>Cartes de trajets animées</i></td>
    <td><i>Contenu Markdown enrichi</i></td>
  </tr>
</table>

---

## 🌍 Impact et contexte

### Contexte camerounais
- **3000** étudiants universitaires à l'UCAC ICAM
- **Conscience écologique** croissante mais peu de données
- **Infrastructure mobile** bien développée
- **Première solution** de ce type au Cameroun

### Impact attendu
- **500+ utilisateurs** pilotes (ICAM) en 6 mois
- **2000+ utilisateurs** dans 3 universités en 1 an
- **Données concrètes** pour politiques environnementales
- **Modèle reproductible** pour autres institutions africaines et campus ICAM partenaires

---

## 🤝 Contribution

Les contributions sont les bienvenues ! Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour les guidelines.

### Comment contribuer

1. **Fork** le projet
2. **Créer** une branche feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** vos changements (`git commit -m 'Add AmazingFeature'`)
4. **Push** vers la branche (`git push origin feature/AmazingFeature`)
5. **Ouvrir** une Pull Request

### Domaines de contribution
- 🐛 Correction de bugs
- ✨ Nouvelles fonctionnalités
- 📝 Documentation
- 🌍 Traductions
- 🎨 Améliorations UI/UX
- 🧪 Tests

---

## 📄 Documentation complète

- **[Guide utilisateur](GUIDE_UTILISATEUR.md)** - Pour démarrer rapidement
- **[Présentation executive](PRESENTATION_EXECUTIVE.md)** - Pour investisseurs/partenaires
- **[Architecture](ARCHITECTURE.md)** - Détails techniques
- **[Politique de confidentialité](PRIVACY_POLICY.md)** - Protection des données
- **[Guide de contribution](CONTRIBUTING.md)** - Pour développeurs
- **[Play Store Deployment](PLAY_STORE_DEPLOYMENT_GUIDE.md)** - Publication Android

---

## 📞 Contact & Support

- **Email technique** : support-it@ucac-icam.com
- **Discord communauté** : [Rejoindre](https://discord.gg/ccHnFFCYur)
- **Issues GitHub** : [Signaler un bug](https://github.com/Ken-Andre/uClean/issues)
- **Discussions** : [Forum du projet](https://github.com/Ken-Andre/uClean/discussions)

---

## 📜 Licence

Ce projet est sous licence MIT. Voir [LICENSE](LICENSE) pour plus de détails.

---

## 🙏 Remerciements

- **ICAM** - Institution d'accueil
- **Communauté Flutter** - Framework et ressources
- **Contributeurs** - Tous ceux qui ont participé au projet
- **Utilisateurs pilotes** - Feedback précieux

---

## 🌟 Roadmap

### ✅ Version 1.0 (Actuelle)
- Application fonctionnelle complète
- Suivi manuelle et automatique des déplacements
- Classification par swipe
- Gamification intégrée
- Articles éducatifs

### 🚧 Version 1.1 (Q1 2026)
- Synchronisation backend complète
- Rapports détaillés d'impact
<!-- - Mode multi-utilisateurs -->
- Notifications push

### 🔮 Version 2.0 (Q3 2026)
- Machine Learning pour détection automatique
- Geofencing intelligent
<!-- - Intégration transports publics
- Expansion multi-pays -->

---

<div align="center">

**uClean - Là où chaque pas compte pour la planète** 🌍👟

*Développé avec ❤️ pour un avenir plus vert*

[![GitHub stars](https://img.shields.io/github/stars/Ken-Andre/uClean?style=social)](https://github.com/Ken-Andre/uClean/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Ken-Andre/uClean?style=social)](https://github.com/Ken-Andre/uClean/network/members)

</div>
