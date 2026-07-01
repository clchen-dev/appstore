# 1Panel App Store（个人 fork）

> **这是个人 fork,用于添加自己的应用。**
>
> 上游([1Panel-dev/appstore](https://github.com/1Panel-dev/appstore))是官方应用商店,这里在它基础上额外维护**自建应用**。
>
> - 自建应用放在 [`my-apps/`](./my-apps/),目录结构与官方应用一致(`data.yml` + `logo.png` + `<版本>/{data.yml,docker-compose.yml}`)。
> - 自建应用维护在 **`my_app_store`** 分支(与上游 `apps/` 分开)。
> - 社区版用法:`git push` 后,在服务器上运行 [`sync-myapps.sh`](./sync-myapps.sh) 把 `my-apps/` 同步到 `/opt/1panel/resource/apps/local/`,再到面板「应用商店 → 同步本地应用」即可安装。
>   - 原因:社区版无法配置自定义商店 URL,只能走「本地应用」;专业版可直接配置自定义应用商店。
>
> 下方为上游原始 README。

---

English | [简体中文](README_zh.md)

The official repository for the [1Panel](https://github.com/1Panel-dev/1Panel) App Store, containing all applications available for installation via the [1Panel](https://github.com/1Panel-dev/1Panel) App Store.

### 1Panel App Store Listing Criteria:

 - Well-known and active open-source projects
 - Significant installation base
 - Official Docker images provided
 - Other approved projects

## Issue Reporting

If you encounter any problems during use or have additional feedback, please submit a GitHub Issue to the [main 1Panel repository](https://github.com/1Panel-dev/1Panel/issues).

## Creating Local Applications

[How to submit your own application](https://github.com/1Panel-dev/appstore/wiki/How-to-submit-your-own-application)

You can also use [1Panel App Store Skills](https://github.com/1Panel-dev/1Panel-appstore-skills) to create application packages with AI coding tools. The skills provide packaging guidelines, templates, and validation steps for building 1Panel-compatible local application packages.

The skills are also available on [ClawHub](https://clawhub.ai/1panel/1panel-appstore).
