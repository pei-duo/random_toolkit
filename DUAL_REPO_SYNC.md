# 双仓库同步配置文档

本文档说明了如何配置和使用双仓库同步功能，实现代码同时推送到 Gitee（主仓库）和 GitHub（备份仓库）。

## 仓库配置

### 主仓库（Gitee）
- **URL**: https://gitee.com/peiduo_734386/random_toolkit.git
- **用途**: 主要开发仓库，用于发布和分发
- **远程名称**: `origin`

### 备份仓库（GitHub）
- **URL**: https://github.com/pei-duo/random_toolkit.git
- **用途**: 备份仓库，保持代码同步
- **配置方式**: 作为 `origin` 的额外推送URL

## 远程仓库配置

当前使用 Git 原生的多推送URL功能，配置如下：

```bash
# 查看远程仓库配置
git remote -v

# 输出结果：
origin  https://gitee.com/peiduo_734386/random_toolkit.git (fetch)
origin  https://gitee.com/peiduo_734386/random_toolkit.git (push)
origin  https://github.com/pei-duo/random_toolkit.git (push)
```

### 配置步骤

如果需要重新配置，可以按以下步骤操作：

```bash
# 1. 设置主推送URL（Gitee）
git remote set-url --push origin https://gitee.com/peiduo_734386/random_toolkit.git

# 2. 添加备份推送URL（GitHub）
git remote set-url --add --push origin https://github.com/pei-duo/random_toolkit.git
```

## 使用方法

### 日常开发流程

```bash
# 1. 添加更改
git add .

# 2. 提交更改
git commit -m "你的提交信息"

# 3. 推送到两个仓库（一条命令同时推送）
git push origin main
```

由于配置了多推送URL，执行 `git push origin main` 会自动推送到两个仓库。

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

### 推送失败处理

如果某个仓库推送失败，可以检查网络连接或仓库权限。由于使用了多推送URL配置，如果其中一个仓库推送失败，整个推送操作会失败。

### 重新配置远程仓库

如果需要重新配置远程仓库：

```bash
# 重置为单一推送URL
git remote set-url --push origin https://gitee.com/peiduo_734386/random_toolkit.git

# 重新添加多推送URL配置
git remote set-url --add --push origin https://github.com/pei-duo/random_toolkit.git
```

### 验证配置

```bash
# 验证配置是否正确
git remote -v

# 测试推送
git push origin main
```