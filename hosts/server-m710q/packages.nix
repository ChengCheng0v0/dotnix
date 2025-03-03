{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # 系统工具
    wget        # 从互联网获取文件
    unzip       # Zip 解压工具
    age         # 加密工具
    sops        # 机密管理器
    jq          # JSON 处理器

    # 终端工具
    eza         # ls 替代品

    # 语言支持
    gcc         # GNU 编译器集合
    clang       # C 语言编译器
    rustc       # Rust 语言编译器
    cargo       # Rust 的包管理器
    python314   # Python 3.14
    nodejs_23   # Node.js 23

    # 开发工具
    lunarvim    # 代码编辑器
    git         # 版本控制系统

    # 网络服务
    # caddy       # HTTP 服务器

    # 其它
    kitty       # 终端模拟器
  ];
}
