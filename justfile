set shell := ["bash", "-c"]

# 🎨 ANSI 颜色
RED := "\\033[31m"
GREEN := "\\033[32m"
YELLOW := "\\033[33m"
BLUE := "\\033[34m"
PURPLE := "\\033[35m"
CYAN := "\\033[36m"
WHITE := "\\033[37m"
RESET := "\\033[0m"

# ✨ ANSI 样式
BOLD := "\\033[1m"
UNDERLINE := "\\033[4m"
REVERSE := "\\033[7m"
DIM := "\\033[2m"
HIDDEN := "\\033[8m"

# 默认操作
default:
  @just --list

# 初始化
init:
  @echo -e "\n{{GREEN}}Done!{{RESET}}"

# 重新编译 NixOS
rebuild:
  nixos-rebuild build --flake . --impure
  @echo -e "\n{{YELLOW}}The current changes will not be saved! To apply the changes permanently, use switch or boot.{{RESET}}"

# 重新编译 NixOS 并临时应用
rebuild-test:
  nixos-rebuild test --flake . --impure
  @echo -e "\n{{YELLOW}}The current changes will not be saved! To apply the changes permanently, use switch or boot.{{RESET}}"

# 重新编译 NixOS 并立即切换
rebuild-switch:
  nixos-rebuild switch --flake . --impure

# 重新编译 NixOS 并在下次启动后切换
rebuild-boot:
  nixos-rebuild boot --flake . --impure
  @echo -e "\n{{YELLOW}}The current changes will be applied after reboot.{{RESET}}"

# 加密机密
encrypt-secret:
  SOPS_AGE_KEY_FILE=/var/lib/sops/age-key.txt sops --output ./secrets/default.json -e ./secrets/default.json

# 解密机密
decrypt-secret:
  SOPS_AGE_KEY_FILE=/var/lib/sops/age-key.txt sops --output ./secrets/default.json -d ./secrets/default.json
  @echo -e "\n{{RED}}The secret is decrypted. Please don't forget to re-encrypt.{{RESET}}"
