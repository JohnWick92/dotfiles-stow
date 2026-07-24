# 📁 Dotfiles Installer

<!--toc:start-->

- [📁 Dotfiles Installer](#-dotfiles-installer)
  - [Português](#português)
    - [🎯 O que este script faz?](#o-que-este-script-faz)
    - [📁 Estrutura esperada](#estrutura-esperada)
    - [🚀 Como usar](#como-usar)

<!--toc:end-->

## Português

<h3 id="o-que-este-script-faz">🎯 O que este script faz?</h3>

Este script **automatiza completamente** a configuração do seu ambiente de desenvolvimento em uma nova máquina:

| Componente                   | Descrição                                       |
| ---------------------------- | ----------------------------------------------- |
| **Oh My Zsh**                | Framework para gerenciar configuração do Zsh    |
| **fast-syntax-highlighting** | Destaca comandos em cores enquanto você digita  |
| **zsh-autosuggestions**      | Sugere comandos anteriores baseado no histórico |
| **GNU Stow**                 | Cria links simbólicos organizando seus dotfiles |

**O mais importante:** O script aplica **TODOS** os seus pacotes de configuração (Zsh, Neovim/LazyVim, Tmux, Git, etc.) através do Stow em um único comando.

<h3 id="estrutura-esperada">📁 Estrutura esperada</h3>

Seus dotfiles devem estar organizados assim:

~/.dotfiles/ 
Trabalhando...

<h3 id="como-usar">🚀 Como usar</h3>

```bash
# 1. Clone seu repositório para ~/.dotfiles
git clone https://github.com/seu-usuario/dotfiles ~/.dotfiles

# 2. Entre no diretório
cd ~/.dotfiles

# 3. Torne o script executável
chmod +x install.sh

# 4. Execute!
./install.sh

# 5. Recarregue o shell
exec zsh

🔧 Como modificar para outros usuários

O script foi feito para ser facilmente customizável. Veja como:
Adicionar/remover plugins do Zsh

# No script, edite estas linhas:
[ ! -d "$CUSTOM/plugins/fast-syntax-highlighting" ] && git clone ...
[ ! -d "$CUSTOM/plugins/zsh-autosuggestions" ] && git clone ...

# Adicione seu plugin:
[ ! -d "$CUSTOM/plugins/meu-plugin" ] && git clone https://github.com/usuario/meu-plugin.git "$CUSTOM/plugins/meu-plugin"

# Ou remova as linhas dos plugins que não quer

Configurar novos pacotes para o Stow

O Stow já aplica todas as pastas automaticamente com stow --restow */. Para adicionar um novo pacote:
bash

# 1. Crie a pasta no ~/.dotfiles
mkdir -p ~/.dotfiles/novo-pacote/.config/novo-app

# 2. Coloque seus arquivos de configuração lá
cp ~/.config/novo-app/config ~/.dotfiles/novo-pacote/.config/novo-app/

# 3. O script já vai stowar automaticamente!

Alterar o diretório dos dotfiles

Se preferir outro local (ex: ~/Developer/dotfiles):
bash

# Edite a última parte do script:
cd ~/Developer/dotfiles  # Em vez de ~/.dotfiles
stow --restow */
```
