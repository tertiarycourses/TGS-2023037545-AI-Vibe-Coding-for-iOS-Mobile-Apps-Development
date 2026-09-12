# App Store Connect metadata and submission checklist

Status rule: local checks may become PASS; credentials, signing and Apple-side changes remain HOLD until a trainer executes and reads them back.

| Gate | Evidence required | Status |
|---|---|---|
| Identity | App name, bundle ID, marketing version and integer build agree with the intended app record | HOLD |
| Release configuration | Opaque 1024px icon, privacy manifest, required-reason API review, permissions, entitlements and encryption declaration | HOLD |
| Signed archive | Reviewed Release archive validates in Xcode Organizer | HOLD |
| Export and upload | Exported IPA validates and the intended build upload completes | HOLD |
| Processing | App Store Connect shows the same bundle/version/build as processed and selectable | HOLD |
| Metadata | Description, subtitle, keywords, support/privacy URLs, category, copyright and review contact complete | HOLD |
| Screenshots | Real app states uploaded in Apple's currently accepted display sizes | HOLD |
| Privacy | App Privacy answers match the verified data-flow inventory and are published | HOLD |
| Age and rights | Age-rating questionnaire and content-rights declarations reviewed | HOLD |
| Availability | Price and explicit country/region availability reviewed; availability is not inferred from price | HOLD |
| Attach and submit | Correct processed build attached; blockers resolved; trainer explicitly submits | HOLD |
| Readback | App identity, version, build, availability and review state read back from Apple | HOLD |

Never store Apple ID passwords, API private keys, signing certificates, provisioning profiles or session data in this Activity.
