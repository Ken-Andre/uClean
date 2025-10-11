import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../models/article.dart';
import '../../services/article_service.dart';
import '../../services/gamification_service.dart';

class ArticleViewerScreen extends StatefulWidget {
  final Article article;

  const ArticleViewerScreen({
    super.key,
    required this.article,
  });

  @override
  State<ArticleViewerScreen> createState() => _ArticleViewerScreenState();
}

class _ArticleViewerScreenState extends State<ArticleViewerScreen> {
  final ArticleService _articleService = ArticleService();
  final GamificationService _gamificationService = GamificationService();
  String? _markdownContent;
  bool _isLoading = true;
  bool _hasMarkedAsRead = false;

  @override
  void initState() {
    super.initState();
    _loadArticleContent();
  }

  Future<void> _loadArticleContent() async {
    setState(() => _isLoading = true);

    try {
      final content =
          await _articleService.getArticleContent(widget.article.contentPath);

      if (mounted) {
        setState(() {
          _markdownContent = content;
          _isLoading = false;
        });

        // Marquer comme lu après un délai pour éviter les lectures accidentelles
        if (!_hasMarkedAsRead && !widget.article.isRead) {
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted && !_hasMarkedAsRead) {
              _markAsRead();
            }
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors du chargement: $e')),
        );
      }
    }
  }

  Future<void> _markAsRead() async {
    try {
      // Marquer l'article comme lu dans le service des articles
      await _articleService.markArticleAsRead(widget.article.id);

      // Attribuer les points via le service de gamification
      final pointsEarned = await _gamificationService.addPointsWithAPISync(
          GamificationService.eventArticleRead,
          metadata: {
            'article_id': widget.article.id,
            'article_title': widget.article.title,
            'points_value': widget.article.getEffectivePoints(),
          });

      setState(() {
        _hasMarkedAsRead = true;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('🎉 +$pointsEarned points gagnés !')),
        );
      }
    } catch (e) {
      print('Erreur lors du marquage: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Erreur lors du marquage de l\'article comme lu')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.article.category,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: widget.article.isRead
                  ? Colors.green.shade100
                  : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${widget.article.getEffectivePoints()} pts',
              style: TextStyle(
                color: widget.article.isRead
                    ? Colors.green.shade700
                    : Colors.blue.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _markdownContent == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        'Erreur lors du chargement',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _loadArticleContent,
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.article.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 4),
                          Text(
                            widget.article.readingTime,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.calendar_today,
                              size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.article.date.day}/${widget.article.date.month}/${widget.article.date.year}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Article Content
                      MarkdownBody(
                        data: _markdownContent!,
                        styleSheet: MarkdownStyleSheet(
                          h1: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                          h2: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                          p: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black87,
                                height: 1.6,
                              ),
                          strong:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                          blockquote:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                          code: TextStyle(
                            backgroundColor: Colors.grey.shade100,
                            color: Colors.black,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Action Button
                      if (!widget.article.isRead && !_hasMarkedAsRead)
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: _markAsRead,
                            icon: const Icon(Icons.check_circle_outline),
                            label: Text(
                                'Marquer comme lu (+${widget.article.getEffectivePoints()} pts)'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),

                      if (widget.article.isRead || _hasMarkedAsRead)
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.green),
                                const SizedBox(width: 8),
                                Text(
                                  'Lu (+${widget.article.getEffectivePoints()} pts)',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
    );
  }
}
