function codex-safe -a profile --description 'Safe Codex'
    set -q profile[1]; or set profile "default-local"

    # set -l codex_bin codex
    set -l codex_bin /usr/local/lib/node_modules/@openai/codex/node_modules/@openai/codex-linux-x64/vendor/x86_64-unknown-linux-musl/bin/codex
    set -l nono nono run --allow-cwd \
        --profile codex \
        --extends $profile
    set -l codex $codex_bin \
        --no-daemon \
        --sandbox danger-full-access \
        --ask-for-approval on-request

    HERDR_AGENT=codex $nono -- $codex $argv[2..]
end
