#!/bin/bash
set -euo pipefail

BRANCH="feature/gitops-implementation"

# workflow for gitOps implementation
git checkout main
git pull --rebase origin main
git checkout -b "$BRANCH" || git checkout "$BRANCH"
git add . 
git commit -m "<message>"
git push origin "$BRANCH"
