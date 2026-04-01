# Architecture — Linux-PERFORMANCE

## 🧱 Overview
Linux-PERFORMANCE is structured as a modular automation framework.

## 📂 Directory Structure
- scripts/ — main automation modules
- docs/ — scientific and technical documentation
- config/ — configuration files
- .github/ — GitHub templates and workflows
- logs/ — execution logs (ignored)
- tmp/ — temporary workspace (ignored)

## 🧩 Module Architecture
Each script is a module:
- install
- tools
- setup
- performance
- security
- desktop

Each module:
- is autonomous
- is idempotent
- uses consistent UI/logging
- follows a deterministic order

## 🔧 Core Components
- apply() — controlled command execution
- logging system
- dry-run mode
- debug mode
- modular loading

## 🔄 Execution Flow
1. System preparation
2. Tools installation
3. System setup
4. Performance optimization
5. Security hardening
6. Desktop optimization
