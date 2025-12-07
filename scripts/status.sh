#!/bin/bash
# 전체 상태 확인 스크립트

cd "$(dirname "$0")/.."

echo "🎼 goopick-orchestra 상태"
echo "═══════════════════════════════════════"
echo ""

for repo in goopick-claude goopick-vault goopick-notion; do
    if [ -d "$repo" ]; then
        echo "📁 $repo"
        echo "───────────────────────────────────────"
        cd "$repo"

        # 최근 커밋
        echo "  최근 커밋: $(git log -1 --format='%s (%ar)')"

        # 변경사항
        changes=$(git status -s | wc -l | tr -d ' ')
        if [ "$changes" -gt 0 ]; then
            echo "  변경사항: $changes 개"
        else
            echo "  변경사항: 없음 ✅"
        fi

        # 원격과 차이
        git fetch -q 2>/dev/null || true
        ahead=$(git rev-list --count HEAD..origin/main 2>/dev/null || echo "0")
        behind=$(git rev-list --count origin/main..HEAD 2>/dev/null || echo "0")
        echo "  원격 동기화: ↑$behind ↓$ahead"

        cd ..
        echo ""
    fi
done

echo "═══════════════════════════════════════"
