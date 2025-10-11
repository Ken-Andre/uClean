import 'package:ucleankim/core/app_export.dart';
import 'package:ucleankim/data/apiClient/api_client.dart';
import 'package:ucleankim/models/gamification_point.dart';

/// Service API pour la gestion des points de gamification
class ApiGamificationService {
  final ApiClient _apiClient = ApiClient();

  /// Récupère tous les points de gamification depuis l'API
  Future<List<GamificationPoint>> getGamificationPoints() async {
    try {
      final response = await _apiClient.getGamificationPoints();
      print('📊 API Response for gamification points: ${response.length} records');

      if (response.isEmpty) {
        print('❌ Aucun point de gamification trouvé dans l\'API');
        return [];
      }

      // Check if we got a total count record (id: 0) or actual point records
      final firstPoint = response.first;
      if (firstPoint.id == 0 && response.length == 1) {
        // This is a total count record
        print('📊 Total des points depuis l\'API: ${firstPoint.points}');
        return [
          GamificationPoint(
            id: 0, // Synthetic ID for total
            createdAt: DateTime.now(),
            user: firstPoint.user ?? 0,
            points: firstPoint.points ?? 0,
            awardedAt: DateTime.now(),
          )
        ];
      }

      // Handle list of actual point records
      final points = response.map((pointResp) {
        try {
          return GamificationPoint(
            id: pointResp.id ?? 0,
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              ((pointResp.createdAt ?? 0) * 1000).round(),
            ),
            user: pointResp.user ?? 0,
            points: pointResp.points ?? 0,
            awardedAt: DateTime.tryParse(pointResp.awardedAt ?? '') ?? DateTime.now(),
          );
        } catch (mappingError) {
          print('❌ Erreur lors du mapping d\'un point: $mappingError, data: $pointResp');
          return null;
        }
      }).where((point) => point != null).cast<GamificationPoint>().toList();

      print('✅ Parsed ${points.length} gamification point(s)');
      return points;
    } catch (e) {
      print('Erreur lors de la récupération des points de gamification: $e');

      // Si erreur d'authentification (401), retourner liste vide pour permettre le fallback
      if (e.toString().contains('401') || e.toString().contains('Unauthorized')) {
        print('Erreur 401 - Token invalide détectée, utilisation du cache local');
        return [];
      }

      // Si erreur d'accès interdit (403), retourner liste vide
      if (e.toString().contains('403') || e.toString().contains('Forbidden')) {
        print('Erreur 403 - Accès interdit détectée, utilisation du cache local');
        return [];
      }

      // Pour toute autre erreur, retourner liste vide au lieu de throw
      print('Retour d\'une liste vide pour permettre le fallback local');
      return [];
    }
  }

  /// Ajoute un nouveau point de gamification via l'API
  Future<GamificationPoint?> addGamificationPoint({
    required int points,
    required DateTime awardedAt,
  }) async {
    try {
      final response = await _apiClient.postGamificationPoint(
        points: points,
        awardedAt: awardedAt,
      );

      return GamificationPoint(
        id: response.id ?? 0,
        createdAt: DateTime.now(),
        user: response.user ?? 0,
        points: response.points ?? 0,
        awardedAt: DateTime.parse(response.awardedAt ?? ''),
      );
    } catch (e) {
      Logger.log('Erreur lors de l\'ajout d\'un point de gamification: $e');

      // Si erreur d'authentification (401), retourner null pour indiquer l'échec
      if (e.toString().contains('401')) {
        Logger.log('Erreur 401 - Point non ajouté, sera stocké localement');
        return null;
      }

      // Pour toute autre erreur, retourner null au lieu de throw
      Logger.log('Erreur lors de l\'ajout, retour null pour fallback local');
      return null;
    }
  }
}
