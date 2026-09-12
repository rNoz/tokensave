set dotenv-load := false

default:
    @just --list

build:
    cargo build --workspace --locked

test:
    cargo test --workspace --locked

fmt-check:
    cargo fmt --all -- --check

lint:
    cargo clippy --workspace --all-targets --locked -- -D warnings

release:
    cargo build --workspace --release --locked

install:
    cargo install --path . --profile release --locked --root "$HOME/.local"

reclaim:
    bash .overlay/reclaim.sh

clean:
    bash .overlay/clean.sh
