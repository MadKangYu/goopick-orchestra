# goopick-orchestra

통합 오케스트라 - 모든 goopick 저장소를 중앙에서 관리

## 구조

```
goopick-orchestra/          # 이 저장소 (지휘자)
├── goopick-claude/         # Claude 작업물 (서브모듈)
├── goopick-vault/          # Obsidian 노트 (서브모듈)
└── scripts/
    ├── sync-all.sh         # 전체 동기화
    ├── status.sh           # 상태 확인
    └── backup.sh           # 백업
```

## 저장소 역할

| 저장소 | 용도 | 동기화 |
|--------|------|--------|
| goopick-claude | Claude 작업물 | 수동 (다운로드 → push) |
| goopick-vault | Obsidian 노트 | Obsidian Git 자동 |
| goopick-orchestra | 통합 관리 | 수동 |

## 사용법

### 초기 설정
```bash
git clone --recursive https://github.com/MadKangYu/goopick-orchestra.git
```

### 전체 동기화
```bash
./scripts/sync-all.sh
```

### 상태 확인
```bash
./scripts/status.sh
```

## 서브모듈

- [goopick-claude](https://github.com/MadKangYu/goopick-claude)
- [goopick-vault](https://github.com/MadKangYu/goopick-vault)
