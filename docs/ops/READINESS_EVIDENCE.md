# LAB 512 Readiness Evidence Log

Last updated: 2026-02-23T20:50:15Z

## Phase 3 — Bootstrap Pipeline Hardening

- Final review of `scripts/forever_bootstrap.sh` for LAB 512 execution path.
  - Command: `sed -n '1,240p' /Users/ubl-ops/UBL-CORE/scripts/forever_bootstrap.sh`
  - Command: `sed -n '820,1180p' /Users/ubl-ops/UBL-CORE/scripts/forever_bootstrap.sh`
  - Command: `rg -n "bundle|upload|receipt|report" /Users/ubl-ops/UBL-CORE/scripts/forever_bootstrap.sh`
  - Evidence: final bundle generation/upload + final report receipt controls are enforced by env gates and strict flags (see `UBL_FINAL_BUNDLE_ENABLE`, `UBL_FINAL_BUNDLE_UPLOAD_ENABLE`, `UBL_FINAL_BUNDLE_REQUIRE_REMOTE`, `UBL_FINAL_REPORT_RECEIPT_ENABLE`, `UBL_FINAL_REPORT_RECEIPT_REQUIRE`).

- Final review of `scripts/host_lockdown.sh` for service-user model (`ubl-service`).
  - Command: `sed -n '1,200p' /Users/ubl-ops/UBL-CORE/scripts/host_lockdown.sh`

- Final review of `scripts/workzone_cleanup.sh` for safe cleanup boundaries.
  - Command: `sed -n '1,200p' /Users/ubl-ops/UBL-CORE/scripts/workzone_cleanup.sh`

- Ensure final bundle generation/upload is mandatory where required.
  - Command: `sed -n '1,200p' /Users/ubl-ops/UBL-CORE/ops/forever_bootstrap.env`
  - Evidence: `UBL_FINAL_BUNDLE_ENABLE=true`, `UBL_FINAL_BUNDLE_UPLOAD_ENABLE=true`, `UBL_FINAL_BUNDLE_REQUIRE_REMOTE=true`.

- Ensure final local checks emit canonical report + receipt.
  - Command: `sed -n '1,200p' /Users/ubl-ops/UBL-CORE/ops/forever_bootstrap.env`
  - Evidence: `UBL_FINAL_REPORT_RECEIPT_ENABLE=true`, `UBL_FINAL_REPORT_RECEIPT_REQUIRE=true`.

## Phase 5 — Quality Gates Before Promotion

- `make contract` passes.
  - Command: `cd /Users/ubl-ops/UBL-CORE && make contract`
  - Evidence: `artifacts/contract/latest.json`, `artifacts/contract/latest.md`.

- `make conformance` passes.
  - Command: `cd /Users/ubl-ops/UBL-CORE && make conformance`
  - Evidence: `artifacts/conformance/latest.json`, `artifacts/conformance/latest.md`.

## Phase 0-6 — Blocker Assessment Snapshot (LAB 256-safe)

- Snapshot of current repo state and supporting documentation references.
  - Command: `bash -lc "mkdir -p /Users/ubl-ops/UBL-CORE/artifacts/readiness && { echo \\\"Timestamp (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)\\\"; echo \\\"PWD: $(pwd)\\\"; echo; echo \\\"## Git state\\\"; git -C /Users/ubl-ops/UBL-CORE rev-parse --abbrev-ref HEAD; git -C /Users/ubl-ops/UBL-CORE rev-parse HEAD; git -C /Users/ubl-ops/UBL-CORE status -sb; echo; echo \\\"## Ops docs index\\\"; ls -la /Users/ubl-ops/UBL-CORE/docs/ops; echo; echo \\\"## Control/data plane references\\\"; rg -n \\\"control plane|data plane|dual-plane|handoff|rollback|topology|canary\\\" /Users/ubl-ops/UBL-CORE/docs/ops || true; echo; echo \\\"## EPISODE_1_PROTOCOL.md (excerpt)\\\"; sed -n '1,200p' /Users/ubl-ops/UBL-CORE/docs/ops/EPISODE_1_PROTOCOL.md; echo; echo \\\"## BOOTSTRAP_FINAL_TEXT.md (excerpt)\\\"; sed -n '1,200p' /Users/ubl-ops/UBL-CORE/docs/ops/BOOTSTRAP_FINAL_TEXT.md; echo; echo \\\"## Cloudflare docs\\\"; sed -n '1,160p' /Users/ubl-ops/UBL-CORE/docs/ops/CLOUDFLARE_EDGE_BASELINE.md; echo; sed -n '1,200p' /Users/ubl-ops/UBL-CORE/docs/ops/CLOUDFLARE_TUNNEL_GO_LIVE.md; echo; echo \\\"## Security/identity references\\\"; rg -n \\\"ceremony|attestation|break-glass|trust anchor|authorship|identity\\\" /Users/ubl-ops/UBL-CORE/docs/ops || true; echo; echo \\\"## Reproducibility/attestation references\\\"; rg -n \\\"reproducibility|attestation|promotion checklist|LAB 256|LAB 512\\\" /Users/ubl-ops/UBL-CORE/docs/ops || true; } > /Users/ubl-ops/UBL-CORE/artifacts/readiness/2026-02-23_phase0-6_blockers.txt"`
  - Evidence: `/Users/ubl-ops/UBL-CORE/artifacts/readiness/2026-02-23_phase0-6_blockers.txt`.

## Phase 4 — Edge and Exposure Hardening (Cloudflare + DNS)

- Cloudflare credentials and tunnel/rate-limit automation unavailable in this environment.
  - Command: `env | rg -i "CLOUDFLARE|UBL_CLOUDFLARE" || true`
  - Evidence: No Cloudflare-related environment variables detected; requires operator-provided API token + tunnel IDs.
  - Update (2026-02-23T14:44:58Z): rechecked env; still no Cloudflare tokens or tunnel IDs available in session.
  - Update (2026-02-23T14:50:19Z): rechecked env; only `__CF_USER_TEXT_ENCODING` present, no API token/tunnel IDs available.
  - Update (2026-02-23T20:45:20Z): rechecked env; no Cloudflare tokens or tunnel IDs available in session.
  - Update (2026-02-23T20:50:15Z): rechecked env; only `__CF_USER_TEXT_ENCODING` present, no Cloudflare API token/tunnel IDs available.
  - Manual steps (operator):
    - Confirm Cloudflare Access policy is active, then set in bootstrap env:
      - `UBL_CLOUDFLARE_ENABLE=true`
      - `UBL_CLOUDFLARE_ACCESS_POLICY_CONFIRMED=true`
    - Create/confirm tunnel(s) in Zero Trust and note tunnel IDs for `ubl.agency`, `api.ubl.agency`, `logline.world`.
    - Create proxied `CNAME` records to `<TUNNEL_ID>.cfargotunnel.com` for each hostname.
    - Configure rate limit rules for `/v1/chips` and `/v1/receipts`; record rule IDs in:
      - `UBL_CLOUDFLARE_RATE_LIMIT_RULES` or `${UBL_BASE_DIR}/state/cloudflare_rate_limit.json`.

## MCP + API Endpoint Validation

- Local runtime health check failed (no local gate running).
  - Command: `curl -sS --max-time 5 http://127.0.0.1:4000/healthz`
  - Evidence: connection refused (2026-02-23T14:44:58Z).
  - Update (2026-02-23T20:45:20Z): connection refused; gate still not running locally.
  - Update (2026-02-23T20:50:15Z): connection refused; gate still not running locally.
  - Manual steps (operator):
    - Start the gate locally, then re-run:
      - `curl -sS http://127.0.0.1:4000/healthz`
      - `curl -sS http://127.0.0.1:4000/mcp/manifest`
      - `curl -sS http://127.0.0.1:4000/.well-known/webmcp.json`
      - `curl -sS -X POST http://127.0.0.1:4000/mcp/rpc -H 'content-type: application/json' --data '{"jsonrpc":"2.0","id":"1","method":"tools/list","params":{}}'`
      - `curl -sS -X POST http://127.0.0.1:4000/v1/chips -H 'content-type: application/json' --data '{"@type":"ubl/document","@id":"probe-mcp-vs-api","@ver":"1.0","@world":"a/chip-registry/t/logline","title":"probe"}'`

- Public endpoint validation blocked by restricted DNS/network access in this environment.
  - Command: `curl -I -sS --max-time 10 https://ubl.agency/healthz`
  - Command: `curl -I -sS --max-time 10 https://api.ubl.agency/healthz`
  - Command: `curl -I -sS --max-time 10 https://api.ubl.agency/mcp/manifest`
  - Command: `curl -I -sS --max-time 10 https://api.ubl.agency/.well-known/webmcp.json`
  - Command: `curl -I -sS --max-time 10 https://api.ubl.agency/mcp/rpc`
  - Command: `curl -I -sS --max-time 10 https://api.ubl.agency/mcp/sse`
  - Command: `curl -I -sS --max-time 10 https://logline.world/healthz`
  - Evidence: DNS resolution failed for all tested public hosts (2026-02-23T14:44:58Z); MCP content types could not be validated from this environment.
  - Update (2026-02-23T14:50:19Z): repeated public endpoint checks; DNS resolution still failed for all tested public hosts.
  - Update (2026-02-23T20:45:20Z): repeated public endpoint checks; DNS resolution still failed for all tested public hosts.
  - Update (2026-02-23T20:50:15Z): repeated public endpoint checks; DNS resolution still failed for ubl.agency, api.ubl.agency, logline.world.
  - Manual steps (operator):
    - From a network with external DNS, confirm:
      - `curl -I -sS https://api.ubl.agency/healthz`
      - `curl -I -sS https://api.ubl.agency/mcp/manifest`
      - `curl -I -sS https://api.ubl.agency/.well-known/webmcp.json`
      - `curl -I -sS https://api.ubl.agency/mcp/rpc` (expect `content-type: text/event-stream`)
