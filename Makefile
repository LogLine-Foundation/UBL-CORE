.PHONY: all build test fmt lint kat gate gate-prod clean check load-validate rollout-check prod-slice-canary docs-attest-keygen docs-attest-manifest docs-attest-sign docs-attest-verify

all: build

build:
	cargo build --workspace

test:
	cargo test --workspace

fmt:
	cargo fmt --all

fmt-check:
	cargo fmt --all -- --check

lint:
	cargo clippy --workspace --all-targets -- -D warnings

check: fmt-check lint test

kat:
	cargo test --workspace -- --nocapture rho_ unc1_ golden_

gate:
	RUST_LOG=info cargo run -p ubl_gate

gate-prod:
	REQUIRE_UNC1_NUMERIC=true F64_IMPORT_MODE=reject RUST_LOG=info cargo run -p ubl_gate

load-validate:
	cargo test -p ubl_chipstore --test load_validation -- --ignored --nocapture

rollout-check:
	bash scripts/rollout_p0_p1_check.sh \
		--runtime-hash "$${RUNTIME_HASH:?set RUNTIME_HASH}" \
		--allow-placeholder-signatures \
		--report-file ./data/rollout_report.json

prod-slice-canary:
	bash scripts/production_slice_canary.sh \
		--base-url "$${BASE_URL:-http://127.0.0.1:4000}" \
		--iterations "$${ITERATIONS:-20}" \
		--report-file ./data/production_slice_report.json

docs-attest-keygen:
	bash scripts/docs_attest.sh init-key \
		--key-out "$${KEY_OUT:-$$HOME/.ubl-core/keys/docs_attest_ed25519.pem}" \
		--pub-out "$${PUB_OUT:-$$HOME/.ubl-core/keys/docs_attest_ed25519.pub.pem}"

docs-attest-manifest:
	bash scripts/docs_attest.sh build-manifest \
		--out "$${MANIFEST_OUT:-./release-artifacts/docs/manifest.json}"

docs-attest-sign:
	@test -n "$${KEY_PATH:-}" || (echo "set KEY_PATH to private key path"; exit 1)
	bash scripts/docs_attest.sh sign \
		--manifest "$${MANIFEST_PATH:-./release-artifacts/docs/manifest.json}" \
		--key "$${KEY_PATH}" \
		$$( [ -n "$${PUB_PATH:-}" ] && printf '%s' "--pub $${PUB_PATH}" ) \
		--out "$${ATTEST_OUT:-./release-artifacts/docs/attestation.json}"

docs-attest-verify:
	bash scripts/docs_attest.sh verify \
		--manifest "$${MANIFEST_PATH:-./release-artifacts/docs/manifest.json}" \
		--attestation "$${ATTEST_PATH:-./release-artifacts/docs/attestation.json}"

clean:
	cargo clean
