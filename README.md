# SkinChanger Lite（换肤器 Lite）

作者：b1ank。Anomaly插件，提供配饰和滑翔翼外观切换。

配饰从游戏内目录读取，按眼部和头顶分组，可同时佩戴并分别恢复。滑翔翼从游戏内目录读取，选择并应用后可在展开时查看效果。插件会在本次运行中按角色记住配饰和滑翔翼选择，外观效果仅在本地显示。

有bug联系 discord频道https://discord.gg/3BWzEe4pJP
纯AI 0人工 感谢GPT老师

## 安装

从 [Releases](https://github.com/kongbaibaizi/SkinChanger/releases) 下载 `SkinChanger-0.1.8-Lite.zip`。可在 Anomaly 的第三方插件页面添加本仓库的 [`pluginmaster.json`](pluginmaster.json) 插件源并安装。手动安装时，在 Anomaly 的 `plugins` 目录下创建 `SkinChanger` 文件夹，将 ZIP 内的文件解压进去。ZIP 根目录直接包含 `manifest.json` 和 `plugin.dll`。

## 构建

需要 Windows、CMake、Visual Studio C++ 工具链和 Anomaly SDK。在本仓库根目录运行，按实际安装位置填写 SDK 目录：

```powershell
cmake -S . -B build -A x64 -DCMAKE_PREFIX_PATH="<Anomaly SDK 目录>"
cmake --build build --config Release
ctest --test-dir build -C Release --output-on-failure
```

插件产物在 `build/package/SkinChanger`。构建完成后运行 `powershell -ExecutionPolicy Bypass -File .\package.ps1` 可生成安装 ZIP。发布时先上传 ZIP 到 Release，再更新 `pluginmaster.json` 中的下载链接。

许可证：AGPL-3.0-only，详见 [LICENSE](LICENSE)。
