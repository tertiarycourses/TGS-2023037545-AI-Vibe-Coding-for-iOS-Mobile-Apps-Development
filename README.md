# TGS-2023037545 — AI Vibe Coding for iOS Mobile Apps Development

Learner materials and hands-on Activities for Tertiary Infotech Academy's WSQ course, **AI Vibe Coding for iOS Mobile Apps Development**.

The course uses a portable C++ domain core, an Objective-C++ interoperability adapter, and a native SwiftUI shell. AI-assisted development is treated as an evidence-driven engineering workflow: specify the contract, create a failing test, make the smallest causal change, review the diff, and retain verification evidence.

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
- `activities/` — ten self-contained Activity folders with instructions, starter assets, worked solutions, mock data, verification, troubleshooting, and cleanup
- `LG-AI Vibe Coding for iOS Mobile Apps Development-v1.0.md` — searchable Markdown mirror of the Learner Guide

Assessment papers, answer keys, source references, credentials, build sources, and internal QA evidence are intentionally excluded from this learner repository.

## Getting started

Clone the repository:

```bash
git clone https://github.com/tertiarycourses/TGS-2023037545-AI-Vibe-Coding-for-iOS-Mobile-Apps-Development.git
cd TGS-2023037545-AI-Vibe-Coding-for-iOS-Mobile-Apps-Development
```

Alternatively, choose **Code → Download ZIP** on GitHub. Begin with [`activities/README.md`](activities/README.md), then work through Activities 1–10 in order. Each Activity names its prerequisites, expected deliverable, verification evidence, troubleshooting path, and safe cleanup boundary.

## Tooling

- Xcode with Swift and SwiftUI support
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
