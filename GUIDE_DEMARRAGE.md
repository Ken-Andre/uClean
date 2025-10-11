# 🚀 Guide de Démarrage Rapide - uClean

## Installation & Configuration

### 1. Prérequis
- Flutter SDK >= 3.0.0
- Android/iOS device avec capteurs (accéléromètre, WiFi)
- Connexion internet pour articles

### 2. Installation
```bash
cd uClean
flutter pub get
flutter run
```

### 3. Permissions
L'app demandera automatiquement :
- **Activité physique** (comptage de pas)
- **Localisation approximative** (WiFi uniquement)
- **Notifications** (rappels)

## 🎯 Utilisation Quotidienne

### Accueil (Home)
1. **Activez le Live Tracking** (bouton central)
2. **Ajoutez des déplacements manuels** (bouton "Add Manual")
3. **Classez les déplacements** par swipe :
   - **Droite** → Professionnel
   - **Gauche** → Personnel

### Articles (Learn)
1. **Lisez les articles** pour gagner des points
2. **Articles récents** = points bonus
3. **Tracking automatique** après 5 secondes de lecture

### Paramètres (Settings)
- Configurez les périodes de reporting
- Gérez votre compte
- Consultez l'aide

## 📊 Système de Points

### Comment Gagner des Points
- **📝 Déplacements enregistrés** : 2 points chacun
- **🏷️ Déplacements classifiés** : 3 points chacun
- **📰 Articles lus** : 5 points chacun
- **📚 Cohérence hebdomadaire** : 10 points bonus

### Achievements
- **First 50** : 50 points totaux
- **Reader** : 25 points de lecture
- **Week Warrior** : 7 jours d'activité consécutifs

## 🔧 Fonctionnalités Avancées

### Tracking Automatique
- **WiFi Tracking** : Détection automatique des lieux
- **Step Counter** : Comptage de pas en arrière-plan
- **Smart Detection** : Création automatique des déplacements

### Géolocalisation
- **Confidentialité** : WiFi uniquement, pas de GPS
- **Lieux connus** : Mapping personnalisé des réseaux
- **Économie batterie** : Intervalles optimisés (5-10 min)

## 🚨 Dépannage

### Problèmes Courants

**Tracking ne démarre pas**
- Vérifiez les permissions système
- Redémarrez l'application
- Vérifiez la connexion WiFi

**Pas détectés**
- Activez les permissions d'activité physique
- Assurez-vous que l'appareil supporte le podomètre
- Testez avec des pas prononcés

**Articles ne se chargent pas**
- Vérifiez la connexion internet
- Les articles sont stockés localement après premier chargement

### Support
- Centre d'aide dans les paramètres
- Logs détaillés dans la console développeur
- Documentation complète dans `ARCHITECTURE.md`

## 📱 Conseils Utilisation

### Optimisation Batterie
- Désactivez le tracking automatique si pas nécessaire
- Préférez le mode manuel pour économie maximale
- WiFi tracking uniquement (pas de GPS)

### Confidentialité
- Aucun stockage de géolocalisation précise
- WiFi anonymisé et mappé localement
- Données locales uniquement (SharedPreferences)

### Performance
- Articles mis en cache après premier chargement
- Tracking optimisé avec intervalles adaptatifs
- Notifications locales uniquement

## 🎉 Premiers Pas

1. **Explorez l'interface** : Découvrez les différentes sections
2. **Lisez un article** : Gagnez vos premiers points
3. **Enregistrez un déplacement manuel** : Testez le formulaire
4. **Classez quelques déplacements** : Découvrez le système de swipe
5. **Activez le tracking automatique** : Laissez l'app travailler pour vous !

**Bonne utilisation de uClean ! 🌱**
