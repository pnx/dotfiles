function codex-safe -a profile --description 'safe codex'
    set -q profile[1]; or set profile "default-local"
    HERDR_AGENT=codex nono run --profile codex --extends $profile -- \
        codex --no-daemon --sandbox danger-full-access --ask-for-approval on-request $args
end

