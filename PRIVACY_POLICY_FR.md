# Politique de Confidentialite - uClean

**uClean** — Application de suivi de mobilite pour l'evaluation environnementale universitaire de son empreinte carbone

*Derniere mise a jour : 21 mai 2026*

---

## Qui sommes-nous ?

uClean est une application mobile developpee par l'equipe **uClean Kim Team** pour la communaute universitaire UCAC — ICAM, avec une attention particuliere aux besoins des etablissements camerounais.

**Editeur :** uClean Kim Team
**Etablissement :** ICAM
**Email de contact :** support-it@icam.fr
**Delegue a la Protection des Donnees (DPO) :** Pere Maximilien Bossou Constant

---

## Notre engagement

Nous nous engageons a proteger votre vie privee tout en contribuant a un environnement plus sain pour nos communautes academiques.

### Principes fondamentaux

- **Transparence totale** dans la collecte et l'utilisation des donnees
- **Consentement eclaire** requis avant toute collecte
- **Donnees minimales** — seules les donnees necessaires a nos objectifs pedagogiques
- **Securite renforcee** via chiffrement AES-256 et transmission TLS/SSL
- **Controle utilisateur complet** sur vos donnees

---

## Donnees collectees

### 1. Donnees de compte (obligatoires)

| Donnee | Usage |
|---|---|
| Nom complet | Identification du compte, personnalisation |
| Adresse email | Creation de compte, connexion, communications essentielles |
| Identifiant utilisateur (User ID) | Gestion du compte, synchronisation backend |
| Mot de passe | Authentification (chiffre) |

### 2. Donnees de localisation approximative

- **Type :** Nom des reseaux WiFi (SSID) auxquels vous vous connectez
- **Precision :** Localisation approximative uniquement (zone > 3 km²)
- **Nous ne collectons PAS** votre position GPS precise
- **Permission Android :** `ACCESS_FINE_LOCATION` (requise par Android pour lire le nom WiFi, mais nous n'utilisons pas le GPS)
- **Permission Android :** `ACCESS_COARSE_LOCATION`
- **Usage :** Detection automatique de vos deplacements pour le calcul de l'empreinte carbone

### 3. Donnees d'activite physique

- **Type :** Nombre de pas quotidiens
- **Permission Android :** `ACTIVITY_RECOGNITION`
- **Usage :** Estimation des distances parcourues, gamification ecologique

### 4. Donnees de deplacements

- Horaires de debut et fin de deplacement
- Distance parcourue (calculee automatiquement)
- Classification personnel/professionnel (via votre choix direct)
- Moyen de transport estime
- **Usage :** Calcul de l'empreinte carbone, suivi pedagogique

### 5. Donnees pedagogiques et de gamification

- Articles educatifs consultes
- Progression de lecture
- Points de gamification acquis
- Realisations et succes
- **Usage :** Mesure de l'engagement educatif, encouragement eco-responsable

### 6. Donnees techniques et de performance

- Logs de crash (crash logs)
- Diagnostics de l'application (performances, latence)
- Identifiants d'appareil (Device ID)
- **Usage :** Amelioration de l'application, correction de bugs

### 7. Interactions avec l'application

- Pages visitees, fonctionnalites utilisees
- **Usage :** Analyses anonymisees pour ameliorer l'experience utilisateur

---

## Donnees que nous ne collectons PAS

- Votre position GPS precise
- Vos contacts telephoniques
- Vos appels ou SMS/MMS
- Vos donnees bancaires ou de paiement
- Vos informations de sante
- Vos photos, videos ou fichiers audio
- Votre agenda/calendrier
- La liste des applications installees sur votre appareil
- Toute information discriminatoire (race, religion, orientation sexuelle, opinions politiques)
- Des donnees sans lien avec notre objectif environnemental

---

## Comment nous utilisons vos donnees

| Finalite | Base legale | Donnees concernees |
|---|---|---|
| Fonctionnement de l'application | Execution du contrat / Interet legitime | Toutes les donnees de compte et deplacement |
| Calcul de l'empreinte carbone | Interet legitime (mission environnementale) | Deplacements, pas, WiFi |
| Analyses statistiques anonymisees | Interet legitime (recherche academique) | Toutes (anonymisees) |
| Amelioration de l'application | Interet legitime | Donnees techniques, interactions |
| Communications essentielles | Execution du contrat | Email |
| Gamification pedagogique | Consentement | Articles lus, points |

---

## Partage des donnees

### Avec qui partageons-nous vos donnees ?

| Destinataire | Donnees partagees | Finalite |
|---|---|---|
| **Backend Xano** (`x8ki-letl-twmt.n7.xano.io`) | Compte, deplacements, gamification | Stockage et synchronisation |
| **Equipes pedagogiques ICAM** | Donnees anonymisees agregees | Encadrement, recherche |
| **Partenaires academiques africains** | Statistiques anonymisees uniquement | Projets de recherche communs |

### Ce que nous ne faisons PAS

- Nous ne **vendons** aucune donnee personnelle a des tiers
- Nous n'utilisons **pas vos donnees a des fins publicitaires ou marketing**
- Nous ne cedons **pas vos donnees personnelles** a des entreprises commerciales

### Transfert de donnees

Vos donnees sont hebergees sur des serveurs situes dans l'Espace Economique Europeen (EEE) via la plateforme Xano. Des garanties appropriees (clauses contractuelles types) encadrent tout transfert eventuel hors EEE.

---

## Securite des donnees

- **Chiffrement AES-256** pour toutes les donnees sensibles stockees localement
- **Transmission TLS/SSL (HTTPS)** pour toutes les communications avec le backend
- **Stockage local** sur votre appareil via SharedPreferences
- **Synchronisation optionnelle** — vous gardez le controle
- **Acces limite** aux seules equipes autorisees
- **Audit de securite regulier**

---

## Duree de conservation

| Type de donnees | Duree de conservation |
|---|---|
| Donnees personnelles (compte) | Supprimees apres **2 ans d'inactivite** |
| Donnees pedagogiques | Conservees **3 ans** pour evaluation academique |
| Statistiques anonymisees | Conservees **5 ans** pour etudes longitudinales |
| Logs techniques et crashs | Supprimes apres **90 jours** |

Des prolongations peuvent etre justifiees pour des recherches academiques en cours, dans le respect des obligations legales.

---

## Vos droits

Conformement au Reglement General sur la Protection des Donnees (RGPD) et a la loi camerounaise n°2010/012, vous disposez des droits suivants :

| Droit | Description | Comment l'exercer |
|---|---|---|
| **Droit d'acces** | Consulter toutes vos donnees | Via l'application > Profil |
| **Droit de rectification** | Corriger les donnees inexactes | Via l'application > Profil |
| **Droit a l'effacement** | Supprimer toutes vos donnees | Via l'application > Supprimer le compte OU email a support-it@icam.fr |
| **Droit d'opposition** | Arreter tout traitement de vos donnees | Via l'application > Parametres |
| **Droit a la portabilite** | Exporter vos donnees (JSON/CSV) | Sur demande a support-it@icam.fr |
| **Retrait du consentement** | Retirer votre consentement a tout moment | Via l'application > Parametres |

Pour exercer vos droits, contactez-nous a **support-it@icam.fr**. Nous repondrons dans un delai maximal de **30 jours**.

Si vous estimez que vos droits ne sont pas respectes, vous pouvez introduire une reclamation aupres de la **CNIL** (www.cnil.fr) ou de l'autorite de protection des donnees de votre pays.

---

## Suppression du compte

Conformement aux exigences de Google Play, vous pouvez supprimer votre compte et toutes les donnees associees :

1. **Depuis l'application :** Accedez a Parametres > Votre compte > Supprimer le compte
2. **Par email :** Envoyez une demande a support-it@icam.fr avec l'objet "Suppression de compte uClean"
3. **En ligne :** Rendez-vous sur https://ken-andre.github.io/uClean/data-deletion

La suppression est definitive et irreversible. Aucune conservation temporaire ou "gel" du compte n'est pratique. Nous confirmons la suppression dans un delai de 30 jours.

---

## Autorisations Android

Nous utilisons les permissions Android suivantes, exclusivement pour les raisons indiquees :

| Permission | Pourquoi ? | Essentielle ? |
|---|---|---|
| `ACCESS_FINE_LOCATION` | Requise par Android pour lire le nom du reseau WiFi. Nous n'utilisons PAS le GPS. | Oui, pour la detection de deplacements |
| `ACCESS_COARSE_LOCATION` | Localisation approximative pour le contexte de deplacement | Oui |
| `ACCESS_WIFI_STATE` | Lire le nom du reseau WiFi connecte | Oui |
| `CHANGE_WIFI_STATE` | Acces aux informations reseau | Oui |
| `ACCESS_NETWORK_STATE` | Verifier la connectivite Internet | Oui |
| `INTERNET` | Communication avec le backend | Oui |
| `ACTIVITY_RECOGNITION` | Comptage de pas via le podometre | Non (fonctionnalite optionnelle) |
| `WAKE_LOCK` | Maintien du service de suivi en arriere-plan | Oui |

---

## Conformite legale

Cette politique respecte les reglementations suivantes :

- **Reglement General sur la Protection des Donnees (RGPD)** — UE 2016/679
- **Loi camerounaise n°2010/012** du 21 decembre 2010 relative a la cybersecurite et a la cybercriminalite
- **Loi OHADA** sur le traitement informatique des donnees personnelles
- **Recommandations CNIL du 18 juillet 2024** relatives aux applications mobiles (Deliberation n°2024-061)
- **Normes ISO 27001** pour la securite de l'information
- **Charte informatique** de l'etablissement universitaire

---

## Mineurs

L'application uClean est destinee aux etudiants et personnels universitaires. Elle n'est **pas destinee aux enfants de moins de 16 ans**. Nous ne collectons pas sciemment les donnees de mineurs de moins de 16 ans. Si vous pensez que nous avons collecte par inadvertance des donnees d'un mineur, contactez-nous immediatement.

---

## Modifications de cette politique

Nous pouvons mettre a jour cette politique de confidentialite periodiquement. Nous vous informerons de tout changement important :

- Par notification dans l'application
- Par email (pour les modifications substantielles)
- En mettant a jour la date de "Derniere mise a jour" en haut de ce document

Nous vous encourageons a consulter regulierement cette politique. L'utilisation continue de l'application apres modification constitue votre acceptation des changements.

---

## Nous contacter

Pour toute question concernant cette politique de confidentialite ou vos donnees :

- **Email :** support-it@icam.fr
- **DPO :** Pere Maximilien Bossou Constant
- **Adresse postale :** ICAM, Cameroon
- **Site web :** https://ken-andre.github.io/uClean

---

**uClean — Ensemble pour une mobilite universitaire durable**
