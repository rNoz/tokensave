#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

list="$(just --list)"
for recipe in build test fmt-check lint release install reclaim clean; do
  grep -Eq "^[[:space:]]+$recipe([[:space:]]|$)" <<<"$list"
done

install="$(just --dry-run install 2>&1)"
grep -F -- "--profile release" <<<"$install"
grep -F -- "--locked" <<<"$install"
! grep -F -- "target/debug" <<<"$install"

echo "build lifecycle interface: PASS"
