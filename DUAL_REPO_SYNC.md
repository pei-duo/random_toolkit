# 双仓库同步说明

本项目配置了双仓库同步，Gitee 作为主仓库，GitHub 作为备份仓库。

## 仓库配置

- **主仓库 (Gitee)**: https://gitee.com/peiduo_734386/random_toolkit.git
- **备份仓库 (GitHub)**: https://github.com/pei-duo/random_toolkit.git

## 远程仓库配置

```bash
# 查看当前远程仓库配置
git remote -v

# 输出:
# origin          https://gitee.com/peiduo_734386/random_toolkit.git (fetch)
# origin          https://gitee.com/peiduo_734386/random_toolkit.git (push)
# github-backup   https://github.com/pei-duo/random_toolkit.git (fetch)
# github-backup   https://github.com/pei-duo/random_toolkit.git (push)
```

## 使用方法

### 方法一：使用同步脚本（推荐）

```bash
# 提交并同步到两个仓库
./sync_repos.sh "你的提交信息"
```

### 方法二：手动推送

```bash
# 1. 添加更改
git add .

# 2. 提交更改
git commit -m "你的提交信息"

# 3. 推送到主仓库 (Gitee)
git push origin main

# 4. 推送到备份仓库 (GitHub)
git push github-backup main
```

### 方法三：自动钩子（已配置）

项目已配置 `post-commit` 钩子，每次提交后会自动推送到两个仓库。

## 拉取代码

默认从 Gitee 主仓库拉取：

```bash
# 拉取最新代码
git pull origin main

# 或者简单的
git pull
```

## 克隆项目

新开发者应该从 Gitee 主仓库克隆：

```bash
git clone https://gitee.com/peiduo_734386/random_toolkit.git
```

## 注意事项

1. **主要开发**: 所有开发工作都基于 Gitee 仓库
2. **代码拉取**: 始终从 Gitee 仓库拉取最新代码
3. **问题反馈**: 在 Gitee 仓库提交 Issues
4. **Pull Request**: 向 Gitee 仓库提交 PR
5. **GitHub 仅作备份**: GitHub 仓库仅用于备份，不建议直接在 GitHub 上进行开发

## 故障排除

如果推送失败，可以手动推送到指定仓库：

```bash
# 仅推送到 Gitee
git push origin main

# 仅推送到 GitHub
git push github-backup main
```

如果需要重新配置远程仓库：

```bash
# 删除现有远程仓库
git remote remove origin
git remote remove github-backup

# 重新添加
git remote add origin https://gitee.com/peiduo_734386/random_toolkit.git
git remote add github-backup https://github.com/pei-duo/random_toolkit.git
```