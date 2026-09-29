# SkinChanger Lite（换肤器 Lite）

作者：b1ank。Anomaly插件，提供配饰和滑翔翼外观切换。

配饰从游戏内目录读取，按眼部（`EYE`）和头顶（`OverHead`）分组，可同时佩戴并分别恢复。滑翔翼从游戏内目录读取，选择并应用后可在展开时查看效果。

有bug反馈 discord频道：https://discord.gg/3BWzEe4pJP

## 安装

从 [Releases](https://github.com/kongbaibaizi/SkinChanger/releases) 下载 `SkinChanger-0.1.8-Lite.zip`。解压后，将 `SkinChanger` 文件夹放入 Anomaly 的 `plugins` 目录。

## 构建

需要 Windows、CMake、Visual Studio C++ 工具链和 Anomaly SDK。在本仓库根目录运行，按实际安装位置填写 SDK 目录：

```powershell
cmake -S . -B build -A x64 -DCMAKE_PREFIX_PATH="<Anomaly SDK 目录>"
cmake --build build --config Release
ctest --test-dir build -C Release --output-on-failure
```

插件产物在 `build/package/SkinChanger`。构建完成后运行 `powershell -ExecutionPolicy Bypass -File .\package.ps1` 可生成安装 ZIP。

许可证：AGPL-3.0-only，详见 [LICENSE](LICENSE)。
