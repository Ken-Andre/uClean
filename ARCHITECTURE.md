# uClean - Architecture & Fonctionnalités

## 🎯 Vue d'ensemble

**uClean** est une application Flutter de collecte de données de déplacements pour l'évaluation du bilan carbone des institutions/organisations.

## 🏗️ Architecture

### Services Cœur
- `ArticleService` : Gestion des articles Markdown avec système de points
- `TripService` : Gestion des déplacements avec classification swipe
- `GamificationService` : Système de points et achievements
- `WifiTrackingService` : Géolocalisation approximative (confidentialité)
- `StepCounterService` : Comptage de pas en arrière-plan
- `PermissionService` : Gestion des autorisations système
- `NotificationService` : Notifications locales et planifiées
- `TrackingController` : Contrôleur central du système de tracking

### Modèles de Données
- `Article` : Structure des articles avec métadonnées
- `Trip` : Modèle des déplacements avec états et classification
- Services utilisent SharedPreferences pour persistance locale

## 🎮 Fonctionnalités Principales

### 1. Collecte de Déplacements
- **Manuel** : Formulaire détaillé (priorité actuelle)
- **Automatique** : Tracking WiFi + comptage de pas
- **Classification** : Swipe cards (Personnel ↔ Professionnel)

### 2. Système de Gamification
- **Points** : Lecture articles + enregistrement déplacements
- **Achievements** : Basés sur activité et cohérence
- **Streaks** : Récompenses pour activité régulière

### 3. Géolocalisation Approximative
- **WiFi Tracking** : Détection réseaux connus
- **Confidentialité** : Pas de GPS, approximation uniquement
- **Économie Batterie** : Intervalles optimisés

### 4. Articles Éducatifs
- **Format Markdown** : Facile pour rédacteurs
- **Structure JSON** : Index des articles avec métadonnées
- **Tracking Lecture** : Points automatiques après délai

## 📱 Interfaces Utilisateur

### Home Page
- Contrôle Live Tracking (ON/OFF)
- Cards de déplacements non classifiés (swipe)
- Points de gamification visibles

### Learn Page (Articles)
- Liste des articles avec métadonnées
- Badge de statut (Lu/Non lu + points)
- Navigation vers lecteur Markdown

### Report Page
- Historique complet des déplacements
- Filtres par période
- Statistiques détaillées

### Settings Page
- Configuration du tracking
- Gestion des permissions
- Centre d'aide

## 🔧 Configuration

### Permissions Requises
- `ACTIVITY_RECOGNITION` : Comptage de pas
- `LOCATION` : Géolocalisation approximative
- `NOTIFICATIONS` : Rappels et statut

### Assets
```
assets/
├── articles/
│   ├── articles.json          # Index des articles
│   ├── article-1.md          # Contenu Markdown
│   └── article-2.md
├── images/                   # Images des articles
└── fonts/                   # Polices (Poppins, Inter)
```

## 🚀 Utilisation

### Démarrage du Tracking
```dart
// Vérifier permissions
final hasPermissions = await permissionService.checkTrackingPermissions();

// Démarrer tracking automatique
await trackingController.startTracking(TrackingType.automatic);

// Écouter les événements
trackingController.onStepsUpdated = (steps) {
  print('Pas aujourd\'hui: $steps');
};

trackingController.onLocationUpdated = (location) {
  print('Lieu approximatif: $location');
};
```

### Ajout d'Articles
```dart
// Créer nouvel article
final article = Article(
  id: '3',
  title: 'Nouveau Article',
  imagePath: 'assets/images/article-3.jpg',
  date: DateTime.now(),
  category: 'Environnement',
  points: 5,
  contentPath: 'assets/articles/article-3.md',
  readingTime: '4 min',
);

// Ajouter au service
await articleService.addArticle(article);
```

### Classification Déplacements
```dart
// Classer un déplacement
await tripService.classifyTrip(tripId, TripType.professional);

// Ajouter points automatiquement
await gamificationService.addPoints(GamificationService.eventTripClassified);
```

## 🔄 Flux de Données

1. **User active tracking** → Vérification permissions
2. **App tracke en arrière-plan** → WiFi + pas
3. **Déplacements détectés** → Création cards non classifiées
4. **User swipe pour classer** → Personnel/Professionnel
5. **Données synchronisées** → API externe
6. **Points attribués** → Gamification mise à jour

## 📊 Métriques & Analytics

- **Points de gamification** : Source et évolution
- **Taux de classification** : Délais et cohérence
- **Engagement articles** : Temps de lecture et préférences
- **Précision géolocalisation** : Couverture WiFi
- **Performance batterie** : Impact du tracking continu

## 🔒 Sécurité & Confidentialité

- **Pas de géolocalisation GPS** précise
- **WiFi anonymisé** : Seulement réseaux connus mappés
- **Données locales** : SharedPreferences uniquement
- **Permissions granulaires** : Demande explicite utilisateur

## 🚀 Évolutions Futures

- **API Backend** : Synchronisation serveur
- **Geofencing** : Zones d'intérêt automatiques
- **Machine Learning** : Détection automatique des modes de transport
- **Rapports avancés** : Analyses détaillées bilan carbone
- **Mode hors-ligne** : Fonctionnement complet sans connexion

## 📝 Notes Développement

- **Architecture modulaire** : Services indépendants
- **Gestion d'état** : BLoC pattern pour UI complexe
- **Persistance locale** : SharedPreferences pour données utilisateur
- **Notifications natives** : Flutter Local Notifications
- **Gestion permissions** : Permission Handler package
