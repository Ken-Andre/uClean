import 'package:flutter/material.dart';
import '../../models/trip.dart';
import '../../services/trip_service.dart' hide Trip, TripType;
import '../../services/gamification_service.dart';

class TripCard extends StatefulWidget {
  final Trip trip;
  final VoidCallback onClassified;

  const TripCard({
    super.key,
    required this.trip,
    required this.onClassified,
  });

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  double _dragPosition = 0.0;
  TripType? _swipeDirection;
  bool _isAnimating = false;

  static const double _swipeThreshold = 0.3; // 30% de la largeur de l'écran
  static const double _velocityThreshold =
      300; // Vitesse minimum pour déclencher

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.3,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_isAnimating) return;

    final delta = details.delta.dx;

    setState(() {
      _dragPosition += delta;

      // Déterminer la direction du swipe
      if (_dragPosition > 50) {
        _swipeDirection = TripType.professional;
      } else if (_dragPosition < -50) {
        _swipeDirection = TripType.personal;
      } else {
        _swipeDirection = null;
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) async {
    if (_isAnimating) return;

    final screenWidth = MediaQuery.of(context).size.width;
    final velocity = details.velocity.pixelsPerSecond.dx;

    // Logique de déclenchement améliorée
    bool shouldTrigger = false;

    if (_dragPosition.abs() > screenWidth * _swipeThreshold) {
      shouldTrigger = true;
    } else if (velocity.abs() > _velocityThreshold) {
      shouldTrigger = true;
    }

    if (shouldTrigger && _swipeDirection != null) {
      await _animateSwipeOut();
    } else {
      await _animateBack();
    }
  }

  Future<void> _animateSwipeOut() async {
    if (_isAnimating) return;

    _isAnimating = true;

    try {
      // Animation de sortie
      await _animationController.forward();

      // Petite pause pour laisser voir l'animation
      await Future.delayed(const Duration(milliseconds: 100));

      // Classer le déplacement
      await TripService().classifyTrip(widget.trip.id, _swipeDirection!);

      // Ajouter des points
      final gamificationService = GamificationService();
      await gamificationService.addPoints(
        GamificationService.eventTripClassified,
      );

      if (mounted) {
        widget.onClassified();

        // Afficher le feedback
        _showClassificationSnackBar();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la classification'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      _isAnimating = false;
    }
  }

  Future<void> _animateBack() async {
    if (_isAnimating) return;

    _isAnimating = true;

    setState(() {
      _swipeDirection = null;
      _dragPosition = 0.0;
    });

    await _animationController.reverse();
    _isAnimating = false;
  }

  void _showClassificationSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _swipeDirection == TripType.professional
                  ? Icons.business
                  : Icons.home,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              _swipeDirection == TripType.professional
                  ? 'Classé comme professionnel ! 🎯'
                  : 'Classé comme personnel ! 🏠',
            ),
          ],
        ),
        backgroundColor: _swipeDirection == TripType.professional
            ? Colors.blue
            : Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final normalizedPosition = _dragPosition / screenWidth;

        return Transform.translate(
          offset:
              Offset(_slideAnimation.value.dx * screenWidth + _dragPosition, 0),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value * normalizedPosition,
              child: GestureDetector(
                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getCardColor(),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: _getShadowColor(),
                        blurRadius: 12,
                        offset: Offset(0, 6 + normalizedPosition.abs() * 4),
                        spreadRadius: normalizedPosition.abs() * 2,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Contenu principal
                      _buildCardContent(),

                      // Overlay pour le feedback visuel
                      if (_swipeDirection != null) _buildSwipeOverlay(),

                      // Indicateurs de direction (toujours visibles mais subtils)
                      _buildDirectionIndicators(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header avec distance et date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.trip.distanceKm.toStringAsFixed(1)} km',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.trip.startTime.day}/${widget.trip.startTime.month}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Informations détaillées
          Row(
            children: [
              // Icône et horaires
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.access_time,
                            color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.trip.startTime.hour}:${widget.trip.startTime.minute.toString().padLeft(2, '0')}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.flag,
                            color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.trip.endTime.hour}:${widget.trip.endTime.minute.toString().padLeft(2, '0')}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 20),

              // Icône direction et lieux
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.white70, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.trip.startLocation ?? 'Lieu de départ',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.white70, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.trip.endLocation ?? 'Lieu d\'arrivée',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          if ((widget.trip.steps ?? 0) > 0) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.directions_walk,
                    color: Colors.white70, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${widget.trip.steps} pas',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSwipeOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: _getOverlayColor().withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _getOverlayColor(),
            width: 4,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: _getOverlayColor(),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              _getTypeLabel(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDirectionIndicators() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.green.withValues(alpha: 0.8),
            width: 4,
          ),
          right: BorderSide(
            color: Colors.blue.withValues(alpha: 0.8),
            width: 4,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Personnel',
                  style: TextStyle(
                    color: Colors.green.shade600.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Pro',
                  style: TextStyle(
                    color: Colors.blue.shade600.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCardColor() {
    if (_swipeDirection != null) {
      return _getOverlayColor().withOpacity(0.9);
    }
    return Colors.grey.shade800;
  }

  Color _getShadowColor() {
    if (_swipeDirection == TripType.personal) {
      return Colors.green.withOpacity(0.4);
    } else if (_swipeDirection == TripType.professional) {
      return Colors.blue.withOpacity(0.4);
    }
    return Colors.black.withOpacity(0.2);
  }

  Color _getOverlayColor() {
    return _swipeDirection == TripType.personal ? Colors.green : Colors.blue;
  }

  String _getTypeLabel() {
    return _swipeDirection == TripType.personal ? 'Personnel' : 'Professionnel';
  }
}
