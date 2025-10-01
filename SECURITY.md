# Security Policy

## Repository Access
- This repository is **public**.
- Anyone can view and propose changes via Pull Requests.

## Contribution & Review
- Pull Requests from external contributors are allowed.
- All changes must be reviewed before merging (Code Review required).
- Direct pushes to the `main` branch are **not allowed**.  
  Please use Pull Requests for all changes.

## Branch Protection
- The `main` branch is protected:
  - Require pull request before merging.
  - Require code review by at least one project member.

## Commit Signatures
- Standard commit signatures are accepted.  
  (GPG signing is optional but recommended for sensitive projects.)

## GitHub Actions & Workflows
- GitHub Actions workflows from forks are allowed.
- Security best practices for workflows should be followed (no secrets in PRs).

## Sensitive Files
- Sensitive files such as `.env`, secret keys, and credentials must **not** be committed or pushed to the repository.
- Add such files to `.gitignore`.

## Authentication
- All project members should enable Two-Factor Authentication (2FA) for their GitHub accounts.
- External contributors are encouraged to use 2FA.

## Security Alerts
- Enable GitHub's Dependabot and security alerts for automatic vulnerability detection.

## General Best Practices
- Do not share production secrets or credentials in issues, PRs, or the repository.
- Regularly update dependencies to patch security vulnerabilities.

## Reporting Vulnerabilities

If you discover a security issue or vulnerability, please open an issue or contact the maintainers directly.

---

**Note:**  
This project is a student project with little prior experience.  
We appreciate any help, feedback, or guidance to improve our security practices!
