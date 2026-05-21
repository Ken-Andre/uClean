import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ucleankim/core/app_export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return const PrivacyPolicyScreen();
  }

  static const String privacyPolicyEn = '''
# Privacy Policy - uClean

**Last updated: May 21, 2026**

## Who We Are

uClean is a mobile application developed by the **uClean Kim Team** for the UCAC — ICAM university community, with particular attention to the needs of Cameroonian institutions.

**Publisher:** uClean Kim Team  
**Institution:** ICAM  
**Contact email:** support-it@ucac-icam.com  
**DPO:** Pere Maximilien Bossou Constant  

## Our Commitment

We are committed to protecting your privacy while contributing to a healthier environment for our academic communities.

### Core Principles
- **Full transparency** in data collection and use
- **Informed consent** required before any collection
- **Data minimization** — only data necessary for our educational purposes
- **Enhanced security** via AES-256 encryption and TLS/SSL transmission
- **Full user control** over your data

## Data We Collect

### 1. Account Data (Required)

| Data | Purpose |
|---|---|
| Full name | Account identification, personalization |
| Email address | Account creation, login, essential communications |
| User ID | Account management, backend synchronization |
| Password | Authentication (encrypted) |

### 2. Approximate Location Data
- **Type:** WiFi network names (SSID) you connect to
- **Precision:** Approximate location only (area > 3 km²)
- **We do NOT collect** your precise GPS location
- **Purpose:** Automatic trip detection for carbon footprint calculation

### 3. Physical Activity Data
- **Type:** Daily step count
- **Purpose:** Distance estimation, eco-friendly gamification

### 4. Trip Data
- Trip start and end times
- Distance traveled
- Personal/professional classification (via your direct choice)
- **Purpose:** Carbon footprint calculation, educational tracking

### 5. Educational and Gamification Data
- Articles read, points earned, achievements
- **Purpose:** Measuring educational engagement

### 6. Technical Data
- Crash logs, app diagnostics, device identifiers
- **Purpose:** App improvement, bug fixing

## Data We Do NOT Collect
- Precise GPS location
- Phone contacts
- Calls or SMS/MMS
- Financial or payment data
- Health information
- Photos, videos, or audio files
- Discriminatory information

## How We Use Your Data

| Purpose | Legal Basis |
|---|---|
| App functionality | Contract / Legitimate interest |
| Carbon footprint calculation | Legitimate interest |
| Anonymized statistical analysis | Legitimate interest |
| App improvement | Legitimate interest |
| Educational gamification | Consent |

## Data Sharing

| Recipient | Purpose |
|---|---|
| Xano Backend | Storage and synchronization |
| ICAM Educational Teams | Aggregated anonymized data |
| African Academic Partners | Anonymized statistics |

- We do **not sell** personal data
- We do **not use** data for advertising or marketing

## Data Security
- AES-256 encryption for local storage
- TLS/SSL (HTTPS) for all backend communications
- Local storage via SharedPreferences
- Optional synchronization
- Limited access to authorized teams only

## Data Retention

| Data Type | Retention |
|---|---|
| Personal data (account) | Deleted after 2 years of inactivity |
| Educational data | 3 years for academic evaluation |
| Anonymized statistics | 5 years for longitudinal studies |
| Technical logs | Deleted after 90 days |

## Your Rights (GDPR)

| Right | How to Exercise |
|---|---|
| Right of access | Via app > Profile |
| Right to rectification | Via app > Profile |
| Right to erasure | Via app > Delete account OR email support-it@ucac-icam.com |
| Right to object | Via app > Settings |
| Right to portability | Email support-it@ucac-icam.com |
| Withdrawal of consent | Via app > Settings |

Response within 30 days. Lodge complaints with CNIL at www.cnil.fr.

## Account Deletion
1. **From the app:** Settings > Your Account > Delete Account
2. **By email:** support-it@ucac-icam.com (subject: "uClean Account Deletion")

Deletion is permanent and irreversible. Confirmation within 30 days.

## Android Permissions

| Permission | Why | Essential? |
|---|---|---|
| ACCESS_FINE_LOCATION | Read WiFi name (NOT GPS) | Yes |
| ACCESS_COARSE_LOCATION | Trip context | Yes |
| ACCESS_WIFI_STATE | Connected WiFi name | Yes |
| ACTIVITY_RECOGNITION | Step counting | No (optional) |
| INTERNET | Backend communication | Yes |

## Legal Compliance
- GDPR (EU 2016/679)
- Cameroonian Law No. 2010/012
- OHADA Law
- CNIL Recommendations of July 18, 2024
- ISO 27001

## Children
Not intended for children under 16.

## Changes
We notify users of material changes via in-app notification and email.

## Contact
- **Email:** support-it@ucac-icam.com
- **DPO:** Pere Maximilien Bossou Constant
- **Website:** https://ken-andre.github.io/uClean

---
*uClean — Together for sustainable university mobility*
''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray10001,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: appTheme.black900),
            onPressed: () => NavigatorService.goBack(),
          ),
          title: Text("Privacy Policy",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              )),
        ),
        body: Markdown(
          data: privacyPolicyEn,
          selectable: true,
          styleSheet: MarkdownStyleSheet(
            h1: theme.textTheme.headlineSmall?.copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: appTheme.black900,
            ),
            h2: theme.textTheme.titleLarge?.copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E7D32),
            ),
            h3: theme.textTheme.titleMedium?.copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            p: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'Inter',
              color: appTheme.black900.withOpacity(0.7),
            ),
            listBullet: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'Inter',
            ),
            tableHead: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
            tableBody: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'Inter',
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
        ),
      ),
    );
  }
}
