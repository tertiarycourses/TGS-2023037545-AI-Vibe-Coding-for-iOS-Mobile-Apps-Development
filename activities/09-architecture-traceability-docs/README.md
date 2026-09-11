# Activity 9: Architecture and Traceability Documentation

Course: AI Vibe Coding for iOS Mobile Apps Development (TGS-2023037545)
Mapping: K5, A5
Estimated time: 75 minutes

## Objective

Create design documentation that maps user specifications to architecture, interfaces and tests.

## Deliverable

C4 diagrams, two ADRs, API contract and traceability matrix

## Tools

Markdown, Mermaid or editable shapes, Doxygen-style comments

## Included files

- `starter/adr-template.txt`
- `starter/traceability.csv`
- `solution/ADR-001-objective-cpp-boundary.txt`
- `solution/traceability.csv`

## Before you begin

- Work only with the supplied mock data. Do not add credentials, personal data or signing files.
- Keep the portable C++ core free of Swift, Objective-C and Apple framework dependencies.
- Record the initial state before editing so that verification shows a meaningful change.
- If using an AI coding assistant, treat its output as a proposal and inspect the resulting diff.

## Procedure

1. Run `cd activities/09-architecture-traceability-docs` and create `workspace/docs`. Copy `starter/adr-template.txt` and `starter/traceability.csv` into that folder.
2. Create a context view showing the budget owner, BudgetBuddy iOS app and local storage. Keep source editable in a diagram tool or PowerPoint; export a review copy only after labels fit.
3. Create a container/component view with SwiftUI shell, BudgetViewModel, BudgetBridge, ExpenseService, BudgetPolicy and ExpenseRepository. Draw arrows in the actual dependency direction.
4. Reconcile the diagram against target membership and imports. Run `rg -n '^import |^#import |^#include ' <your-source-folders>` and remove any diagram edge not supported by code.
5. Copy the ADR template to `workspace/docs/ADR-001-objective-cpp-boundary.txt`. Complete status, context, options, decision, consequences, affected requirements, evidence, owner and review date.
6. Create `ADR-002-json-persistence.txt` and compare direct Swift persistence, C++ repository port and mixed ownership. Record why the selected port preserves the regulated component boundary.
7. Add API contract comments to the bridge header. Document cents units, nullability, ownership, error domain/codes, preconditions and whether an operation mutates state.
8. Fill `workspace/docs/traceability.csv` with one row for each `REQ-001` through `REQ-005`. Each row must name a design element, implementation path, test, evidence path and status.
9. Validate the CSV with `python3 -c 'import csv; rows=list(csv.DictReader(open("workspace/docs/traceability.csv"))); assert len(rows)==5; assert all(r["status"] for r in rows)'`. Expect five populated rows and exit status zero.
10. Compare the ADR and traceability structure with the solution examples. Do not copy a decision that conflicts with your actual code or evidence.
11. Ask a peer to choose two requirements at random and follow the matrix in both directions—from requirement to evidence and from test back to requirement.
12. Retain editable diagram sources, exported review images, two ADRs, documented bridge API and validated traceability CSV. Remove only obsolete exported drafts.

## Verification

All five regulated outcomes are traceable and no documented dependency contradicts the build graph.

Capture the command output, test result, matrix or screenshot named by the deliverable. A statement such as “it works” is not sufficient evidence.

## Troubleshooting

If the diagram is crowded, split by stakeholder question instead of shrinking labels.

Check the earliest failing layer first: portable C++ domain test, then Objective-C++ contract, then Swift state and finally the visible interface.

## Cleanup

Retain source diagrams and Markdown; remove obsolete exported drafts.

Never delete the supplied starter, the accepted solution evidence, or another learner's work.
