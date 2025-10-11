# 🎨 uClean Design System - Documentation

## Vue d'ensemble

Ce design system moderne a été créé pour l'application uClean avec une approche **senior UI/UX**. Il offre une identité visuelle cohérente, moderne et professionnelle basée sur les gradients du splash screen original.

---

## 🎯 Principes de Design

### 1. Cohérence Visuelle
- Tous les écrans utilisent le même système de couleurs, typographie et spacing
- Les composants sont réutilisables et suivent les mêmes patterns

### 2. Hiérarchie Claire
- Typographie structurée (Display → Headline → Title → Body → Label)
- Espacement systématique (2xs → 3xl)
- Couleurs sémantiques pour les états

### 3. Accessibilité
- Contraste optimal pour la lisibilité
- Tailles de texte adaptées
- States visuels clairs (hover, pressed, disabled)

### 4. Material Design 3
- Composants modernes
- Animations fluides
- Navigation intuitive

---

## 🎨 Palette de Couleurs

### Couleurs Primaires (du splash screen)
```dart
primaryBlue:   #1D858A  // Cyan-blue principal
primaryPink:   #FF7968  // Coral-pink secondaire
primaryYellow: #FBE468  // Jaune chaleureux
```

### Gradients
**Primary Gradient** (Bleu)
- Start: `#003366`
- End: `#63ACD4`
- Usage: Boutons principaux, headers

**Accent Gradient** (Rose)
- Start: `#CD7A91`
- End: `#FF7968`
- Usage: Accents, highlights

**Warm Gradient** (Jaune)
- Start: `#FFBE7E`
- End: `#FBE468`
- Usage: Success, positif

### Couleurs Neutres
```dart
neutralBlack:  #1C1B1F  // Texte principal
neutral900:    #2D2D2D
neutral700:    #5F5F5F  // Texte secondaire
neutral500:    #9E9E9E  // Placeholder
neutral300:    #D1D1D1  // Bordures
neutral100:    #F5F5F5  // Backgrounds
neutralWhite:  #FFFFFF  // Surfaces
```

### Couleurs Sémantiques
```dart
success:  #38FF93  // Vert (actions réussies)
warning:  #FF860B  // Orange (avertissements)
error:    #FF7968  // Rouge coral (erreurs)
info:     #63ACD4  // Bleu clair (informations)
```

---

## ✍️ Typographie

### Police Principale: **Poppins**
- Utilisée pour: Titres, headlines, labels
- Caractère: Moderne, géométrique, friendly

### Police Secondaire: **Inter**
- Utilisée pour: Body text, paragraphes
- Caractère: Lisible, neutre, professionnelle

### Échelle Typographique

#### Display (Titres principaux)
- **Display Large**: 32px, Bold (700)
- **Display Medium**: 28px, Bold (700)
- **Display Small**: 24px, SemiBold (600)

#### Headline (Sous-titres)
- **Headline Large**: 22px, SemiBold (600)
- **Headline Medium**: 20px, SemiBold (600)
- **Headline Small**: 18px, SemiBold (600)

#### Title (Titres de section)
- **Title Large**: 16px, SemiBold (600)
- **Title Medium**: 14px, SemiBold (600)
- **Title Small**: 12px, SemiBold (600)

#### Body (Texte courant)
- **Body Large**: 16px, Regular (400) - Inter
- **Body Medium**: 14px, Regular (400) - Inter
- **Body Small**: 12px, Regular (400) - Inter

#### Label (Étiquettes)
- **Label Large**: 14px, Medium (500)
- **Label Medium**: 12px, Medium (500)
- **Label Small**: 10px, Medium (500)

---

## 📐 Spacing System

```dart
space2xs: 4px   // Micro spacing
spaceXs:  8px   // Très petit
spaceSm:  12px  // Petit
spaceMd:  16px  // Moyen (par défaut)
spaceLg:  24px  // Large
spaceXl:  32px  // Très large
space2xl: 48px  // Extra large
space3xl: 64px  // Mega large
```

**Utilisation recommandée:**
- Entre éléments: `spaceMd` (16px)
- Entre sections: `spaceLg` (24px)
- Marges de page: `spaceLg` (24px)
- Padding de cards: `spaceMd` (16px)

---

## 🔲 Border Radius

```dart
radiusXs:   4px   // Micro radius
radiusSm:   8px   // Small radius
radiusMd:   12px  // Medium radius (par défaut)
radiusLg:   16px  // Large radius
radiusXl:   24px  // Extra large radius
radiusFull: 999px // Complètement arrondi
```

---

## 💫 Shadows

### Shadow Small
```dart
BoxShadow(
  color: black @ 8% opacity,
  blurRadius: 4,
  offset: (0, 2)
)
```
Usage: Chips, small cards

### Shadow Medium
```dart
BoxShadow(
  color: black @ 12% opacity,
  blurRadius: 8,
  offset: (0, 4)
)
```
Usage: Cards, modals

### Shadow Large
```dart
BoxShadow(
  color: black @ 16% opacity,
  blurRadius: 16,
  offset: (0, 8)
)
```
Usage: Floating action buttons

### Shadow XL
```dart
BoxShadow(
  color: black @ 20% opacity,
  blurRadius: 24,
  offset: (0, 12)
)
```
Usage: Dialogs, bottom sheets

---

## 🧩 Composants

### ModernButton
**Variantes:**
- `primary`: Fond bleu solide
- `secondary`: Fond rose solide
- `outline`: Transparent avec bordure
- `ghost`: Transparent sans bordure
- `gradient`: Dégradé bleu

**Tailles:**
- `small`: 36px hauteur
- `medium`: 48px hauteur (par défaut)
- `large`: 56px hauteur

**Usage:**
```dart
ModernButton(
  text: "Sign In",
  onPressed: () {},
  variant: ModernButtonVariant.gradient,
  size: ModernButtonSize.large,
  isFullWidth: true,
)
```

### ModernInput
**Caractéristiques:**
- Label optionnel
- Prefix/suffix icons
- Validation intégrée
- States: normal, focused, error
- Fond gris clair avec bordure au focus

**Usage:**
```dart
ModernInput(
  label: "Email",
  hint: "Enter your email",
  controller: controller,
  keyboardType: TextInputType.emailAddress,
  prefix: Icon(Icons.email_outlined),
  validator: (value) => ...,
)
```

### ModernCard
**Variantes:**
- `elevated`: Avec ombre (par défaut)
- `filled`: Fond gris
- `outlined`: Avec bordure

**Usage:**
```dart
ModernCard(
  padding: EdgeInsets.all(16),
  variant: ModernCardVariant.elevated,
  onTap: () {},
  child: ...,
)
```

### ModernAppBar
**Caractéristiques:**
- Bouton retour moderne avec fond gris
- Titre centré ou aligné à gauche
- Actions personnalisables
- Élévation 0 par défaut

**Usage:**
```dart
ModernAppBar(
  title: "Profile",
  centerTitle: true,
  actions: [IconButton(...)],
)
```

### ModernChip
**Tailles:**
- `small`, `medium`, `large`

**Usage:**
```dart
ModernChip(
  label: "Travel",
  icon: Icon(Icons.flight),
  isSelected: true,
  onTap: () {},
)
```

---

## 🎭 États et Interactions

### États de Boutons
- **Default**: Couleur pleine
- **Hover**: Légèrement plus foncé (10%)
- **Pressed**: Plus foncé (20%)
- **Disabled**: Opacity 50%
- **Loading**: Spinner blanc

### États d'Input
- **Default**: Fond gris clair
- **Focused**: Bordure bleue 2px
- **Error**: Bordure rouge 2px
- **Disabled**: Opacity 50%

---

## 📱 Écrans Refondus

### ✅ Splash Screen
- Gradients superposés (rose, bleu, jaune)
- Logo centré
- Animation d'entrée fluide

### ✅ Onboarding
- 3 pages avec illustrations
- Indicateur de page moderne
- Bouton gradient pleine largeur
- Espacement généreux

### ✅ Login Screen
- Gradients subtils en arrière-plan
- Logo en haut
- Texte de bienvenue
- Inputs modernes avec icons
- Lien "Forgot password"
- Lien vers inscription

### 🔄 Create Account (en cours)
### 🔄 Home Screen (en cours)

---

## 🚀 Implémentation

### Import du Design System
```dart
import 'package:ucleankim/theme/modern_theme.dart';
import 'package:ucleankim/widgets/modern_button.dart';
import 'package:ucleankim/widgets/modern_input.dart';
import 'package:ucleankim/widgets/modern_card.dart';
```

### Utilisation des Couleurs
```dart
Container(
  color: ModernTheme.primaryBlue,
  child: Text(
    'Hello',
    style: ModernTypography.headlineMedium,
  ),
)
```

### Utilisation du Spacing
```dart
Padding(
  padding: EdgeInsets.all(ModernTheme.spaceMd),
  child: Column(
    spacing: ModernTheme.spaceSm,
    children: [...],
  ),
)
```

---

## 📋 Checklist de Qualité

Avant de valider un écran, vérifier:
- [ ] Utilise `ModernTheme.lightTheme`
- [ ] Typographie cohérente (`ModernTypography`)
- [ ] Spacing systématique (`ModernTheme.space*`)
- [ ] Couleurs du design system
- [ ] Composants modernes (`Modern*`)
- [ ] Border radius cohérent
- [ ] Shadows appropriées
- [ ] Responsive (utilise `.h` et `.v`)
- [ ] Accessibility (contraste, tailles)
- [ ] États visuels clairs

---

## 🎯 Bonnes Pratiques

### DO ✅
- Utiliser les composants `Modern*`
- Respecter la hiérarchie typographique
- Utiliser les gradients pour les CTAs importants
- Espacer généreusement
- Tester sur différentes tailles d'écran

### DON'T ❌
- Créer de nouvelles couleurs arbitraires
- Mélanger différentes polices
- Utiliser des spacings personnalisés
- Ignorer les states (hover, pressed, etc.)
- Surcharger visuellement

---

## 📞 Support

Pour toute question sur le design system:
- Consulter ce document
- Regarder les exemples dans `/lib/presentation/*_screen/`
- Vérifier les composants dans `/lib/widgets/modern_*.dart`

---

**Version:** 1.0
**Dernière mise à jour:** 2025-10-02
**Créé par:** Assistant IA - Refonte UI/UX Senior Level
