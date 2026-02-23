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
  - Blocker: Operator has not confirmed the promotion target (branch/commit); current repo state captured in evidence artifact.
  - Next: `cd /Users/ubl-ops/UBL-CORE && git rev-parse --abbrev-ref HEAD && git rev-parse HEAD` after operator approval.
- [ ] Freeze scope for bootstrap v1 (what is in, what is out).
  - Blocker: Scope boundary list has not been provided or approved by the operator.
  - Next: `rg -n "Scope|Objective|In scope|Out of scope" /Users/ubl-ops/UBL-CORE/docs/ops` to draft scope text for approval.
- [ ] Confirm that archived legacy tasklist is non-normative.
  - Blocker: No explicit operator signoff recorded that the archived tasklist is non-normative.
  - Next: `rg -n "Previous tasklist archived" /Users/ubl-ops/UBL-CORE/TASKLIST.md` before adding the explicit non-normative statement.
- [ ] Publish this tasklist as canonical execution tracker.
  - Blocker: Publication channel/target has not been specified (repo-only vs. external ops channel).
  - Next: `git -C /Users/ubl-ops/UBL-CORE log -1 -- /Users/ubl-ops/UBL-CORE/TASKLIST.md` once the publication target is approved.

---

## Phase 1 — Architecture Validation for LAB 512

- [ ] Define production topology with two UBL copies:
  - control + ingestion plane
  - data/serving plane
  - Blocker: Additional operator input is pending to finalize topology specifics beyond existing docs.
  - Next: `rg -n "control plane|data plane|topology" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting the topology section.
- [ ] Formalize Episode 1 protocol as normative contract (`docs/ops/EPISODE_1_PROTOCOL.md`).
  - Blocker: Protocol is marked "active" but not explicitly declared "normative contract" by operator.
  - Next: `sed -n '1,60p' /Users/ubl-ops/UBL-CORE/docs/ops/EPISODE_1_PROTOCOL.md` before updating status text.
- [ ] Replace old canary concept with dual-plane validation protocol.
  - Blocker: Dual-plane validation protocol is not documented; old canary doc still exists.
  - Next: `rg -n "canary|dual-plane" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting replacement protocol.
- [ ] Define control-plane responsibilities (ingest, governance, policy transitions, orchestration).
  - Blocker: Responsibilities exist in narrative form but not formalized as a normative contract section.
  - Next: `sed -n '20,140p' /Users/ubl-ops/UBL-CORE/docs/ops/BOOTSTRAP_FINAL_TEXT.md` before formalizing.
- [ ] Define data-plane responsibilities (query/read APIs, receipts retrieval, CAS delivery, performance isolation).
  - Blocker: Responsibilities exist in narrative form but not formalized as a normative contract section.
  - Next: `sed -n '20,160p' /Users/ubl-ops/UBL-CORE/docs/ops/BOOTSTRAP_FINAL_TEXT.md` before formalizing.
- [ ] Define deterministic handoff contract between planes (what is replicated, when, and how verified).
  - Blocker: No documented handoff/replication contract is present.
  - Next: `rg -n "handoff|replic|sync" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting handoff contract.
- [ ] Document failure modes and rollback paths per plane.
  - Blocker: Failure modes/rollback paths are not documented per plane.
  - Next: `rg -n "failure|rollback|recover" /Users/ubl-ops/UBL-CORE/docs/ops` before adding rollback paths.
- [x] Ingest Episode 1 prompt pack into a tracked implementation intake.
  - Evidence: `/Users/ubl-ops/UBL-CORE/docs/ops/EPISODE_1_PROMPTS_INTAKE.md`.
  - Note: Intake maps prompts 01..09 to spec outputs and defines execution order without replacing normative protocol text.
- [x] Materialize spec-pack skeleton and first two specs (08 and 02).
  - Evidence:
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/README.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_GOVERNANCE_YAML_AND_SCHEMAS_EP1.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_WORKSPACE_E_SCHEMAS_EP1.md`
- [x] Materialize hardening specs for GAP-6/15 and GAP-11.
  - Evidence:
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_GAPS_6_15_EP1.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_EVENTSTORE_AUDIT_GAP11.md`
- [x] Materialize evidence specs for Lineage/PROV/OBS and Verifier.
  - Evidence:
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_LINEAGE_PROV_OBS_EP1.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_VERIFIER_EP1.md`
- [x] Complete Episode 1 spec pack materialization (01..09).
  - Evidence:
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_PLATFORM_MOCKS_EP1.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_EPISODE_RUNNER_EP1.md`
    - `/Users/ubl-ops/UBL-CORE/docs/ops/episode-1/specs/SPEC_IMPLEMENTACAO_EP1.md`

**Note**: Additional input pending from operator (“vou trazer mais info”).

---

## Phase 2 — Security and Identity Ceremony

- [ ] Finalize key ceremony checklist for LAB 512 (machine birth + key birth).
  - Blocker: No checklist draft is present for operator review.
  - Next: `rg -n "ceremony|key birth|machine birth" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting checklist.
- [ ] Confirm signer trust anchors and attestation pinning strategy.
  - Blocker: Trust anchor list and pinning strategy are not documented.
  - Next: `rg -n "trust anchor|attestation" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting the strategy.
- [ ] Confirm subject/authorship identity policy for ingress.
  - Blocker: Identity/authorship policy for ingress is not documented.
  - Next: `rg -n "authorship|identity|ingress" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting the policy.
- [ ] Confirm break-glass policy and operator/admin separation.
  - Blocker: Break-glass and operator/admin separation policy is not documented.
  - Next: `rg -n "break-glass|operator/admin" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting the policy.
- [ ] Validate secret handling defaults (no runtime secret leakage in artifacts).
  - Blocker: No documented validation run or checklist for secret handling defaults.
  - Next: `rg -n "secret|leak|artifact" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting validation steps.

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
  - Blocker: Cloudflare Access policy prerequisites require account configuration review.
  - Next: `sed -n '1,200p' /Users/ubl-ops/UBL-CORE/docs/ops/CLOUDFLARE_EDGE_BASELINE.md` before enumerating prerequisites.
- [ ] Confirm tunnel + DNS automation path for:
  - `ubl.agency` (public landing)
  - `api.ubl.agency` (API/gate)
  - `logline.world` (rich receipt URL model)
  - Blocker: Tunnel/DNS automation path requires Cloudflare account access and existing tunnel IDs.
  - Next: `sed -n '1,240p' /Users/ubl-ops/UBL-CORE/docs/ops/CLOUDFLARE_TUNNEL_GO_LIVE.md` before mapping automation steps.
- [ ] Confirm edge rate limiting and registry of rule IDs.
  - Blocker: Rule IDs registry not recorded; requires Cloudflare dashboard access.
  - Next: `rg -n "rate limit|rule ID" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting registry.
- [ ] Confirm `/r#ubl:v1:<token>` remains the single public receipt model.
  - Blocker: Requires operator confirmation that no alternate receipt URL model is approved.
  - Next: `rg -n "receipt model|logline.world|/r#ubl:v1" /Users/ubl-ops/UBL-CORE/docs/ops` before asserting exclusivity.

---

## Phase 5 — Quality Gates Before Promotion

- [x] `make contract` passes.
- [x] `make conformance` passes.
- [ ] CI `WF` gate passes with CONTRACT + CONFORMANCE.
  - Blocker: No CI run ID or output captured for the `WF` gate.
  - Next: `rg -n "WF" /Users/ubl-ops/UBL-CORE/.github/workflows` before triggering/inspecting the workflow.
- [ ] Reproducibility/attestation checks pass for target commit.
  - Blocker: Reproducibility/attestation runbook or automation not located in repo.
  - Next: `rg -n "reproducibility|attestation" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting checks.
- [ ] Promotion checklist (`LAB 256 -> LAB 512`) signed off.
  - Blocker: Promotion checklist document and signoff log not present.
  - Next: `rg -n "promotion checklist|LAB 256 -> LAB 512" /Users/ubl-ops/UBL-CORE/docs/ops` before drafting checklist.

---

## Phase 6 — LAB 256 Full Rehearsal (No Exceptions)

- [ ] Execute full bootstrap rehearsal from clean state.
  - Blocker: LAB 256 access/run window not provided; rehearsal cannot be executed locally.
  - Next: `ssh <LAB256_HOST> -- 'cd /opt/ubl/UBL-CORE && ./scripts/forever_bootstrap.sh'` once access is granted.
- [ ] Validate all generated artifacts, receipts, and witnesses.
  - Blocker: Rehearsal artifacts are not available without running the full bootstrap on LAB 256.
  - Next: `ls -la /opt/ubl/UBL-CORE/artifacts` on LAB 256 after rehearsal completes.
- [ ] Validate dual-plane behavior and deterministic sync/replication checks.
  - Blocker: Requires LAB 256 dual-plane deployment and replication artifacts.
  - Next: `rg -n "replication|sync" /opt/ubl/UBL-CORE/artifacts` on LAB 256 after rehearsal.
- [ ] Run Episode 1 Small/Big acceptance test using the 12-line checklist in `docs/ops/EPISODE_1_PROTOCOL.md`.
  - Blocker: Acceptance test requires LAB 256 Small/Big runtimes and recorded receipts.
  - Next: `rg -n "Episode 1|acceptance" /opt/ubl/UBL-CORE/scripts /opt/ubl/UBL-CORE/docs/ops` to locate the runner on LAB 256.
- [ ] Run incident drill and recovery simulation.
  - Blocker: Incident drill requires LAB 256 orchestration and operator availability.
  - Next: `rg -n "incident" /opt/ubl/UBL-CORE/scripts /opt/ubl/UBL-CORE/docs/ops/INCIDENT_RUNBOOK.md` on LAB 256 once scheduled.
- [ ] Capture rehearsal evidence package for go/no-go decision.
  - Blocker: Evidence package depends on completed rehearsal and artifact collection.
  - Next: `tar -czf /opt/ubl/UBL-CORE/artifacts/rehearsal_evidence.tgz /opt/ubl/UBL-CORE/artifacts` on LAB 256.

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
