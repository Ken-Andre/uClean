# Guide de déploiement sur Google Play Store pour uClean Kim

## Préparation

### 1. Configuration du keystore
1. Générer un keystore :
   ```bash
   keytool -genkey -v -keystore android/app/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. Ajouter les informations sensibles dans `android/gradle.properties` :
   ```
   RELEASE_STORE_FILE=key.jks
   RELEASE_STORE_PASSWORD=VOTRE_STORE_PASSWORD
   RELEASE_KEY_ALIAS=upload
   RELEASE_KEY_PASSWORD=VOTRE_KEY_PASSWORD
   ```

3. Mettre à jour `android/app/build.gradle` avec la configuration de signature appropriée.

### 2. Préparation des assets
- Icônes : 512x512 px (PNG)
- Captures d'écran :
  - Téléphone : 393x851 px minimum
  - Tablette 10" : 1280x800 px minimum
- Bannière : 1024x500 px

### 3. Métadonnées du Play Store
- Titre : uClean Kim - Gestion des tâches de nettoyage scolaire
- Description courte : Application de gestion des tâches de nettoyage pour les établissements scolaires
- Description complète : [Détaillée avec fonctionnalités]
- Mots-clés : nettoyage, école, tâches, gestion, administration

## Processus de publication

1. **Build Release** :
   ```bash
   flutter build apk --release
   flutter build appbundle --release
   ```

2. **Upload sur Play Console** :
   - Se connecter à Google Play Console
   - Créer une nouvelle application
   - Upload du App Bundle (AAB)
   - Remplir les métadonnées
   - Ajouter les captures d'écran
   - Publier

## Checklist finale

- [ ] Keystore généré et configuré
- [ ] Application signée correctement
- [ ] Métadonnées complètes
- [ ] Captures d'écran ajoutées
- [ ] Politique de confidentialité définie
- [ ] Test de l'APK de release
- [ ] Version incrémentée dans pubspec.yaml

## Ressources utiles

- Documentation Flutter : https://docs.flutter.dev/deployment/android
- Guide Play Store : https://developer.android.com/distribute
- Préparation des assets : https://developer.android.com/google-play/resources/icon-design-specifications
