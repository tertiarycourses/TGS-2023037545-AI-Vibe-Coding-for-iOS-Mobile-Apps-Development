# TGS-2023037545 — AI Vibe Coding for iOS Mobile Apps Development

Learner materials and hands-on Activities for Tertiary Infotech Academy's WSQ course, **AI Vibe Coding for iOS Mobile Apps Development**.

This is an iOS application-development course delivered through vibe coding: learners specify observable behaviour, AI proposes complete files, and Xcode plus the Simulator prove the result. Swift is the vocabulary for reviewing generated SwiftUI code, not a syntax lesson sequence. Portable C++ remains the regulated logic layer behind the Objective-C++ adapter.

## Course information

- Course code: `TGS-2023037545`
- TSC: Software Design 3 (`ICT-DES-3005-1.1`)
- Duration: 2 days / 16 hours, including 2 hours of assessment
- Provider: Tertiary Infotech Academy Pte Ltd
- [Course details and registration](https://www.tertiarycourses.com.sg/wsq-ai-vibe-coding-for-ios-mobile-apps-development.html)

## Architecture

```text
SwiftUI view and state
        |
        v
Objective-C++ adapter
        |
        v
Portable C++ domain core
        |
        v
Requirements, tests, traceability and release evidence
```

The portable core contains business invariants and remains independent of Apple frameworks. The adapter translates types, ownership, and errors. SwiftUI owns native controls, accessibility, navigation, and observable presentation state.

## Repository contents

- `courseware/` — trainer slide deck, learner-slide PDF, Learner Guide, and Lesson Plan
- `activities/` — ten self-contained Activity folders with XcodeGen projects, generated shared Xcode schemes, app icons, privacy manifests, scripts, prompts, tests and Simulator verification
- `activities/10-capstone-release-evidence/solution/projects/` — complete BudgetBuddy, FocusCards and HabitPulse apps
- `LG-AI Vibe Coding for iOS Mobile Apps Development-v1.2.md` — searchable Markdown mirror of the Learner Guide
- `activities/IOS-VIBE-CODING-PROMPT-PACK.md` and PDF — copy/paste-ready end-to-end BudgetBuddy generation, review, repair, test, privacy, documentation, CI, and release-evidence prompts

Assessment papers, answer keys, source references, credentials, build sources, and internal QA evidence are intentionally excluded from this learner repository.

## Getting started

Clone the repository:

```bash
git clone https://github.com/tertiarycourses/TGS-2023037545-AI-Vibe-Coding-for-iOS-Mobile-Apps-Development.git
cd TGS-2023037545-AI-Vibe-Coding-for-iOS-Mobile-Apps-Development
```

Alternatively, choose **Code → Download ZIP** on GitHub. Begin with [`activities/README.md`](activities/README.md), open the prompt pack, then work through Activities 1–10 in order. Each Activity names its prerequisites, generation prompt, review/repair prompt, expected deliverable, verification evidence, troubleshooting path, and safe cleanup boundary.

## Tooling

- Xcode 26.6 or compatible, targeting iOS 17+
- XcodeGen 2.45.4 or compatible
- An installed iPhone Simulator; the scripts resolve an available device and prefer iPhone 17 Pro when present
- Apple Clang or another C++20 compiler
- CMake and CTest where available
- Git
- An approved AI coding assistant, used without credentials or personal data

If CMake is unavailable, the relevant Activity provides an equivalent direct-compiler verification command.

## Learning outcomes

Learners will determine C++ component boundaries, apply software-design methods and tools, select appropriate controls and features, assess interoperability and functionality, and produce traceable design documentation aligned with user requirements.

## Responsible AI use

- Use only supplied mock data.
- Never paste credentials, signing files, personal data, or proprietary source into an AI tool.
- Treat generated code as a proposal, not proof.
- Inspect every diff and rerun the named verification gates.
- Retain evidence for requirements, tests, interoperability, and release decisions.

## License and use

Course materials are provided for enrolled learners of Tertiary Infotech Academy. Unless stated otherwise in an individual file, redistribution or commercial reuse is not granted.

© 2026 Tertiary Infotech Academy Pte Ltd. All rights reserved.
