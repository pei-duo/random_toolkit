#!/bin/bash

# 双仓库同步推送脚本
# 使用方法: ./sync_repos.sh [commit_message]

set -e

# 检查是否提供了提交信息
if [ $# -eq 0 ]; then
    echo "请提供提交信息"
    echo "使用方法: ./sync_repos.sh \"你的提交信息\""
    exit 1
fi

COMMIT_MESSAGE="$1"

echo "=== 双仓库同步推送 ==="
echo "提交信息: $COMMIT_MESSAGE"
echo ""

# 添加所有更改
echo "1. 添加更改到暂存区..."
git add .

# 提交更改
echo "2. 提交更改..."
git commit -m "$COMMIT_MESSAGE"

# 推送到 Gitee (主仓库)
echo "3. 推送到 Gitee 主仓库..."
git push origin main

# 推送到 GitHub (备份仓库)
echo "4. 推送到 GitHub 备份仓库..."
git push github-backup main

echo ""
echo "✅ 代码已成功同步到两个仓库！"
echo "   - Gitee (主仓库): https://gitee.com/peiduo_734386/random_toolkit.git"
echo "   - GitHub (备份): https://github.com/pei-duo/random_toolkit.git"