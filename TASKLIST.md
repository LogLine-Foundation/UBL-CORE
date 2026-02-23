# UBL-CORE — TASKLIST (LAB 512 Readiness)

**Status**: Active execution source of truth  
**Date**: 2026-02-22  
**Objective**: Prepare UBL-CORE for official, permanent bootstrap on LAB 512 with audit-grade evidence.

Previous tasklist archived at: `docs/archive/2026-02/TASKLIST_MASTER_ARCHIVE_2026-02-22.md`

---

## Operating Rules

- Contract-first: behavior changes require contract tests first.
- Conformance is mandatory for merge/promotion.
- LAB 256 is rehearsal/integration environment.
- LAB 512 is genesis/production historical environment.
- No irreversible operation on LAB 512 without passing promotion gate.

---

## Phase 0 — Baseline and Scope Lock

- [ ] Confirm target branch/commit for LAB 512 promotion.
- [ ] Freeze scope for bootstrap v1 (what is in, what is out).
- [ ] Confirm that archived legacy tasklist is non-normative.
- [ ] Publish this tasklist as canonical execution tracker.

---

## Phase 1 — Architecture Validation for LAB 512

- [ ] Define production topology with two UBL copies:
  - control + ingestion plane
  - data/serving plane
- [ ] Formalize Episode 1 protocol as normative contract (`docs/ops/EPISODE_1_PROTOCOL.md`).
- [ ] Replace old canary concept with dual-plane validation protocol.
- [ ] Define control-plane responsibilities (ingest, governance, policy transitions, orchestration).
- [ ] Define data-plane responsibilities (query/read APIs, receipts retrieval, CAS delivery, performance isolation).
- [ ] Define deterministic handoff contract between planes (what is replicated, when, and how verified).
- [ ] Document failure modes and rollback paths per plane.

**Note**: Additional input pending from operator (“vou trazer mais info”).

---

## Phase 2 — Security and Identity Ceremony

- [ ] Finalize key ceremony checklist for LAB 512 (machine birth + key birth).
- [ ] Confirm signer trust anchors and attestation pinning strategy.
- [ ] Confirm subject/authorship identity policy for ingress.
- [ ] Confirm break-glass policy and operator/admin separation.
- [ ] Validate secret handling defaults (no runtime secret leakage in artifacts).

---

## Phase 3 — Bootstrap Pipeline Hardening

- [x] Final review of `scripts/forever_bootstrap.sh` for LAB 512 execution path.
- [x] Final review of `scripts/host_lockdown.sh` for service-user model (`ubl-service`).
- [x] Final review of `scripts/workzone_cleanup.sh` for safe cleanup boundaries.
- [x] Ensure final bundle generation/upload is mandatory where required.
- [x] Ensure final local checks emit canonical report + receipt.

---

## Phase 4 — Edge and Exposure Hardening (Cloudflare + DNS)

- [ ] Confirm Cloudflare Access app/policy prerequisites.
- [ ] Confirm tunnel + DNS automation path for:
  - `ubl.agency` (public landing)
  - `api.ubl.agency` (API/gate)
  - `logline.world` (rich receipt URL model)
- [ ] Confirm edge rate limiting and registry of rule IDs.
- [ ] Confirm `/r#ubl:v1:<token>` remains the single public receipt model.

---

## Phase 5 — Quality Gates Before Promotion

- [x] `make contract` passes.
- [x] `make conformance` passes.
- [ ] CI `WF` gate passes with CONTRACT + CONFORMANCE.
- [ ] Reproducibility/attestation checks pass for target commit.
- [ ] Promotion checklist (`LAB 256 -> LAB 512`) signed off.

---

## Phase 6 — LAB 256 Full Rehearsal (No Exceptions)

- [ ] Execute full bootstrap rehearsal from clean state.
- [ ] Validate all generated artifacts, receipts, and witnesses.
- [ ] Validate dual-plane behavior and deterministic sync/replication checks.
- [ ] Run Episode 1 Small/Big acceptance test using the 12-line checklist in `docs/ops/EPISODE_1_PROTOCOL.md`.
- [ ] Run incident drill and recovery simulation.
- [ ] Capture rehearsal evidence package for go/no-go decision.

---

## Phase 7 — LAB 512 Official Bootstrap

- [ ] Execute approved bootstrap runbook.
- [ ] Emit and preserve inaugural receipt artifacts.
- [ ] Publish trust anchors and external witness.
- [ ] Verify public endpoints and offline verification path.
- [ ] Create freeze manifest and snapshot immediately after genesis.

---

## Phase 8 — Post-Bootstrap Stabilization

- [ ] Enable scheduled heartbeat receipts.
- [ ] Validate encrypted backup cycle from day 1.
- [ ] Verify monitoring/dashboard/alerts baselines.
- [ ] Record post-bootstrap operations note and open next tasklist cycle.

---

## Deferred / Not in This Cycle

- Product-shell feature expansion unrelated to LAB 512 readiness.
- New protocol surfaces without direct impact on bootstrap integrity.
