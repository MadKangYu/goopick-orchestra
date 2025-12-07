#!/bin/bash
# 전체 동기화 스크립트

set -e

echo "🎼 goopick-orchestra 전체 동기화 시작..."
echo ""

cd "$(dirname "$0")/.."

# 서브모듈 업데이트
echo "📦 서브모듈 업데이트 중..."
git submodule update --remote --merge

# 각 저장소 상태 확인
echo ""
echo "📊 저장소 상태:"
echo "─────────────────────────────────────"

for repo in goopick-claude goopick-vault; do
    if [ -d "$repo" ]; then
        echo ""
        echo "📁 $repo"
        cd "$repo"
        git status -s
        cd ..
    fi
done

echo ""
echo "✅ 동기화 완료!"
