# my-apps

放自定义 1Panel 应用模板的地方。每个应用一个目录,结构和官方 appstore 一致:

```
my-apps/<key>/
├── data.yml          # 应用级定义(additionalProperties.key/name/type/tags/description…)
├── logo.png          # 图标(必需)
├── README.md         # 说明(可选)
└── <版本>/            # 如 1.0.0/
    ├── data.yml          # 版本级:formFields 安装参数表单
    └── docker-compose.yml # 用 ${envKey} 引用参数;数据 bind-mount 到 ./data
```

可直接抄官方应用改:`cp -r ../apps/halo my-apps/<你的key>` 后修改。

## 用法(社区版)

1. 本地在这里加/改应用 → `git push`。
2. 服务器拉取并同步到本地应用目录:
   ```bash
   ./sync-myapps.sh        # 在仓库根目录运行
   ```
3. 1Panel → 应用商店 → 同步本地应用 → "本地"分类出现 → 安装。
