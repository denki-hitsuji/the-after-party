#!/bin/bash

# The After Party - 自動セットアップスクリプト
# 使用方法: chmod +x setup.sh && ./setup.sh

set -e

echo "🎵 The After Party - セットアップ開始"
echo ""

# 色の定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 現在のディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "${BLUE}ステップ 1/4: Hugo がインストールされているか確認中...${NC}"
if ! command -v hugo &> /dev/null; then
    echo "${RED}❌ Hugo がインストールされていません${NC}"
    echo ""
    echo "Hugoをインストールしてください:"
    echo "  brew install hugo"
    echo ""
    exit 1
fi

HUGO_VERSION=$(hugo version)
echo "${GREEN}✅ Hugo が見つかりました: ${HUGO_VERSION}${NC}"
echo ""

echo "${BLUE}ステップ 2/4: ファイルを確認中...${NC}"
if [ ! -f "$SCRIPT_DIR/hugo.toml" ]; then
    echo "${RED}❌ hugo.toml が見つかりません${NC}"
    echo "このスクリプトは the-after-party ディレクトリで実行してください"
    exit 1
fi
echo "${GREEN}✅ ファイル確認完了${NC}"
echo ""

echo "${BLUE}ステップ 3/4: ディレクトリ構成を確認中...${NC}"
# 必要なディレクトリが存在するか確認
if [ ! -d "$SCRIPT_DIR/themes/hermit-style" ]; then
    echo "${RED}❌ テーマディレクトリが見つかりません${NC}"
    exit 1
fi
echo "${GREEN}✅ ディレクトリ構成OK${NC}"
echo ""

echo "${BLUE}ステップ 4/4: Hugoサイトをビルドしています...${NC}"
cd "$SCRIPT_DIR"
hugo

if [ $? -eq 0 ]; then
    echo ""
    echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo "${GREEN}🎉 セットアップ完了！${NC}"
    echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "次のコマンドでローカルサーバーを起動できます:"
    echo ""
    echo "  ${BLUE}hugo server${NC}"
    echo ""
    echo "ブラウザで以下のURLを開いてください:"
    echo "  ${BLUE}http://localhost:1313${NC}"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
else
    echo "${RED}❌ ビルドに失敗しました${NC}"
    exit 1
fi
