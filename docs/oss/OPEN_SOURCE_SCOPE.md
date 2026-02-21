# Open Source Scope

**Status**: active  
**Owner**: Repo Maintainer  
**Last reviewed**: 2026-02-21

## Objective

Define the boundary between the OSS `UBL-CORE` foundation and product-shell repositories.

## UBL-CORE (this repository)

In scope:

- deterministic runtime and pipeline
- canonicalization, receipt, and verification primitives
- gate service, MCP endpoint, and CLI
- core stores/connectors needed by runtime behavior
- core operational and security documentation

Out of scope:

- product-specific UX/APIs/business flows
- tenant-specific adapters and deployment wrappers
- product branding and distribution packaging

## Product Shells Repository

Product shells currently live at:

- [danvoulez/UBL-SHELLS](https://github.com/danvoulez/UBL-SHELLS)

Rules:

1. `UBL-SHELLS` depends on `UBL-CORE` via git dependencies.
2. Core crate code is not copied into shell repositories.
3. Core changes may trigger shell update workflows (dispatch + scheduled fallback).

## Release and Change Flow

1. `UBL-CORE` changes land on `main`.
2. Core tags (`v*`) produce candidate releases and can be promoted to official releases.
3. `UBL-SHELLS` consumes updated core by git dependency updates and CI validation.

## Economic Model Boundary

- Core protocol/runtime verification components are open-source.
- Paid value is expected in managed operations and enterprise integrations.
- See:
  - `COMMERCIAL-LICENSING.md`
  - `TRADEMARK_POLICY.md`
