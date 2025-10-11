# Contributing to uClean Kim

We love your input! We want to make contributing to uClean Kim as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code lints
6. Issue that pull request!

## Pull Request Process

1. **Create an Issue**: Before starting work on a feature or bug fix, please create an issue to discuss the proposed changes.

2. **Fork and Branch**: Fork the repository and create a branch from `main` with a descriptive name (e.g., `feature/new-cleaning-task-type` or `fix/login-validation`).

3. **Development**: Make your changes following these guidelines:
   - Follow the existing code style
   - Add tests for new functionality
   - Update documentation as needed
   - Ensure all tests pass
   - Run `flutter analyze` to check for issues

4. **Testing**: Test your changes thoroughly:
   ```bash
   flutter test
   flutter analyze
   flutter format --set-exit-if-changed .
   ```

5. **Commit**: Use clear commit messages following conventional commits format:
   ```
   feat: add new cleaning task export feature
   fix: resolve login validation issue
   docs: update deployment guide
   ```

6. **Pull Request**: Create a pull request with:
   - Clear title and description
   - Reference to the related issue
   - Screenshots for UI changes
   - Testing instructions if needed

## Code Style Guidelines

### Dart/Flutter
- Use `flutter format` to format your code
- Follow effective Dart guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

### Architecture
- Follow BLoC pattern for state management
- Use dependency injection appropriately
- Keep UI components stateless when possible
- Separate business logic from UI code

### Testing
- Write unit tests for business logic
- Write widget tests for UI components
- Maintain high test coverage (>80%)
- Use meaningful test descriptions

## Reporting Bugs

Report bugs using GitHub's [issue tracker](https://github.com/Ken-Andre/uClean/issues).

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
   - Be specific!
   - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Feature Requests

Feature requests are welcome! Please provide:

- **Use case**: Describe the problem you're trying to solve
- **Proposed solution**: How you think it should work
- **Alternatives considered**: Other solutions you've considered
- **Additional context**: Screenshots, mockups, or examples

## License

By contributing, you agree that your contributions will be licensed under the same license as the original project.

## Getting Help

- Check the [README](README.md) for setup instructions
- Look at existing issues and discussions
- Join our [Discord server](https://discord.gg/ccHnFFCYur) for questions
- Email the maintainers for private inquiries

---

Thank you for contributing to uClean Kim! 🎉
