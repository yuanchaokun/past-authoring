# Past Authoring · 过去自我书写

> 基于 Jordan B. Peterson 的 Self-Authoring Suite，一个极简沉浸式自传书写工具。

[![Deploy to Cloudflare Pages](https://github.com/yuanchaokun/past-authoring/actions/workflows/deploy.yml/badge.svg)](https://github.com/yuanchaokun/past-authoring/actions/workflows/deploy.yml)

---

## 简介

**Self-Authoring** 是由心理学家 Jordan B. Peterson 及其团队开发的在线写作项目。数十年研究表明，认真书写自己人生经历的人会变得更快乐、更少焦虑、更健康。

本工具实现了其中的 **Past Authoring（过去自我书写）** 模块，帮助你：

- 将人生划分为 **7 个时期**，系统回顾重要经历
- 分析每段经历如何塑造了今天的你
- 从中选出 **10 个最关键的经历** 进行深度剖析
- 生成一份完整的自传并自由导出

---

## 功能特点

| 特性 | 说明 |
|------|------|
| 🌏 中英双语 | 所有问题提供中英文版本，可随时切换 |
| 📊 进度追踪 | 顶部进度条 + 全局字数统计 |
| 💾 自动保存 | 内容自动保存至浏览器 localStorage |
| ✨ 极简沉浸 | 简约设计，无干扰书写环境 |
| 📤 自由导出 | 支持 Markdown、JSON、打印/PDF |
| 🔒 完全私密 | 无需注册，无需网络，数据只在本地 |

---

## 使用方式

直接访问部署地址，或将 `index.html` 发送给朋友在浏览器中打开即可使用。

**练习流程：**

```
① 划分7个人生时期
    ↓
② 为每个时期描述重要经历（最多6个）
    ↓
③ 分析每段经历的影响
    ↓
④ 选出10个最关键的经历
    ↓
⑤ 深度分析这10个经历
    ↓
⑥ 查看综合总结 · 导出
```

---

## 本地运行

```bash
# 克隆仓库
git clone https://github.com/yuanchaokun/past-authoring.git
cd past-authoring

# 启动本地服务器（任选一种）
python3 -m http.server 8080
# 或
npx serve .
```

然后访问 `http://localhost:8080/landing.html`

---

## 部署到 Cloudflare Pages

本项目使用 GitHub Actions + Wrangler 自动部署。

### 1. Fork / Clone 本仓库

### 2. 获取 Cloudflare 凭证

进入 [Cloudflare Dashboard](https://dash.cloudflare.com/) 获取：

- **Account ID**：右侧边栏 → Workers & Pages → 复制 Account ID
- **API Token**：My Profile → API Tokens → Create Token → 使用 `Edit Cloudflare Workers` 模板

### 3. 在 GitHub 中配置 Secrets

进入仓库 → **Settings → Secrets and variables → Actions → New repository secret**

| Secret 名称 | 值 |
|------------|-----|
| `CLOUDFLARE_API_TOKEN` | 步骤2获取的 API Token |
| `CLOUDFLARE_ACCOUNT_ID` | 步骤2获取的 Account ID |

### 4. 初次创建 Cloudflare Pages 项目

```bash
# 本地执行一次，创建 Pages 项目
wrangler pages project create past-authoring
```

### 5. 推送即自动部署

```bash
git push origin main
# GitHub Actions 自动触发，部署到 Cloudflare Pages
```

---

## 项目结构

```
past-authoring/
├── landing.html          # 引导落地页
├── index.html            # 主练习页（Past Authoring 完整流程）
├── wrangler.toml         # Cloudflare Wrangler 配置
├── .github/
│   └── workflows/
│       └── deploy.yml    # GitHub Actions 自动部署
└── README.md
```

---

## 参考资料

- [Self-Authoring Suite 官网](https://www.selfauthoring.com/)
- [Jordan Peterson 关于写作的研究](https://www.jordanbpeterson.com/self-authoring/)
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)

---

*本工具仅供个人学习与自我探索使用*
