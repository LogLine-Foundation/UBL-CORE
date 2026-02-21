# UBL Documentation Index

This is the entry point for all project documentation.

**Status**: active
**Owner**: Repo Maintainer
**Last reviewed**: 2026-02-21

## Sources of Truth

| Topic | Canonical document | Owner | Status |
|---|---|---|---|
| System design and invariants | `ARCHITECTURE.md` | Core Runtime | Active |
| Execution plan and delivery status | `TASKLIST.md` | Core Runtime | Active |
| LLM/human canonical entrypoint | `START-HERE.md` | Core Runtime | Active |
| Project/process governance | `GOVERNANCE.md` | Repo Maintainer | Active |
| Canon quickstart | `docs/canon/START-HERE-CANON.md` | Core Runtime | Active |
| Canon exhaustive reference | `docs/canon/CANON-REFERENCE.md` | Core Runtime | Active |
| Numeric canon | `docs/canon/UNC-1.md` + `schemas/unc-1.schema.json` + `kats/unc1/unc1_kats.v1.json` | Core Runtime | Active |
| VM numeric opcode canon | `docs/vm/OPCODES_NUM.md` | Core Runtime | Active |
| Runtime trust and role model | `CERTIFIED_RUNTIME.md` | Core Runtime | Active |
| Bootstrap/rollout policy flow | `ROLLOUT_P0_TO_P1.md` | Ops + Security | Active |
| API contract | `/openapi.json` + `crates/ubl_runtime/src/manifest.rs` | Gate | Active |
| Environment/config flags | `docs/reference/README.md` + runtime/gate env reads in code | Runtime + Gate | Active |
| Error taxonomy | `crates/ubl_runtime/src/error_response.rs` | Runtime | Active |
| Crypto trust model | `SECURITY.md` | Security | Active |
| Docs attestation flow | `docs/security/DOC_ATTESTATION.md` | Security | Active |
| Release gates | `docs/lifecycle/RELEASE_READINESS.md` | Core Runtime + Ops | Active |
| Change history | `docs/changelog/CHANGELOG.md` | Repo Maintainer | Active |
| OSS scope and boundary | `docs/oss/OPEN_SOURCE_SCOPE.md` | Repo Maintainer | Active |
| Contribution workflow | `CONTRIBUTING.md` | Repo Maintainer | Active |
| Community conduct policy | `CODE_OF_CONDUCT.md` | Repo Maintainer | Active |
| Support channels/policy | `SUPPORT.md` | Repo Maintainer | Active |
| RFC process | `RFC_PROCESS.md` + `docs/rfc/README.md` | Repo Maintainer | Active |
| Versioning policy | `VERSIONING.md` | Core Runtime | Active |
| Compatibility policy | `COMPATIBILITY.md` | Core Runtime | Active |
| Trademark policy | `TRADEMARK_POLICY.md` | LogLine Foundation | Active |
| Commercial model boundary | `COMMERCIAL-LICENSING.md` | LogLine Foundation | Active |

## Governance

- Documentation standards: `docs/STANDARDS.md`
- ADR process: `docs/adr/README.md`
- Archived/superseded docs: `docs/archive/`

## High-Signal Reading Order

1. `README.md`
2. `START-HERE.md`
3. `ARCHITECTURE.md`
4. `TASKLIST.md`
5. `SECURITY.md`
6. `GOVERNANCE.md`
7. `docs/reference/README.md`
8. `/openapi.json`
9. `docs/ops/INCIDENT_RUNBOOK.md`
10. `docs/lifecycle/RELEASE_READINESS.md`
11. `docs/oss/OPEN_SOURCE_SCOPE.md`
