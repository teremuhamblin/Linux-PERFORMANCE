# Reproducibility Guide — Linux-PERFORMANCE

## 🎯 Objective
This document ensures that any researcher or engineer can reproduce the exact
system configuration produced by Linux-PERFORMANCE.

## 🧱 System Requirements
- Linux Mint (recommended: latest LTS)
- Bash 5+
- sudo privileges
- Internet access for package installation

## 🔁 Reproducible Pipeline
The pipeline is deterministic and executed in this order:

1. 1_mint-install.sh
2. 2_mint-tools.sh
3. 3_mint-setup.sh
4. 4_mint-perf.sh
5. 5_mint-sec.sh
6. 6_mint-desktop.sh

Each script:
- is idempotent
- logs its actions
- documents system changes

## 📦 Dependencies
All dependencies are installed explicitly in the scripts.
No hidden dependencies.

## 🧪 Verification
To verify reproducibility:
- compare logs
- compare sysctl outputs
- compare installed packages
- compare performance benchmarks

## 📚 Notes
Reproducibility may vary slightly depending on:
- kernel version
- hardware differences
- package repository state
