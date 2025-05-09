# 🧱 Ubuntu LTS Upgrade Script

Este repositório contém um script interativo aprimorado para **atualizar o Ubuntu 20.04 LTS para o Ubuntu 22.04 LTS**, a versão mais recente e estável com suporte de longo prazo (LTS).

O objetivo é ajudar **novos programadores e desenvolvedores iniciantes** a realizarem a atualização de forma segura, prática e sem complicações.

---

## 📜 Sobre o script

Arquivo: `ubuntu-lts-upgrade.sh`  
Criado por: [Rarysson](https://github.com/RaryssonPereira)  
Melhorias por: ChatGPT 🚀  
Objetivo: Automatizar com segurança os principais passos para atualizar o Ubuntu de uma versão LTS para outra, incluindo validações e logs detalhados.

---

## 🔧 O que o script faz?

1. Valida se está sendo executado com privilégios administrativos.
2. Verifica se a versão atual é o Ubuntu 20.04 LTS.
3. Verifica se há pelo menos 5GB de espaço livre em disco.
4. Oferece a opção de realizar um backup das configurações essenciais antes da atualização.
5. Atualiza todos os pacotes existentes no sistema.
6. Garante que o `update-manager-core` esteja instalado.
7. Configura o sistema para aceitar apenas atualizações LTS.
8. (Opcional) Pergunta se você deseja reiniciar antes de continuar.
9. Inicia o processo de upgrade para o Ubuntu 22.04 LTS.
10. Fornece instruções detalhadas para verificar se a atualização foi bem-sucedida.

---

## 🚨 Requisitos antes de usar

- Ter **Ubuntu 20.04 LTS** instalado.
- Conexão com a internet estável.
- Fazer **backup dos seus arquivos importantes**.
- De preferência, **testar em uma máquina virtual primeiro** se você não tiver certeza.

---

## ▶️ Como usar

### 1. Baixe o script

```bash
git clone https://github.com/RaryssonPereira/ubuntu-lts-upgrade.git
cd ubuntu-lts-upgrade
```

### 2. Torne o script executável

```bash
chmod +x ubuntu-lts-upgrade.sh
```

### 3. Execute o script

```bash
sudo ./ubuntu-lts-upgrade.sh
```

---

### 💡 Dica: também é possível executar assim

```bash
sudo bash ubuntu-lts-upgrade.sh
```

Mas o script já especifica qual shell usar com a linha `#!/bin/bash` no topo.

---

## 🧠 O que significa `#!/bin/bash` no topo do script?

Essa linha, chamada **"shebang"**, indica ao sistema que o script deve ser executado usando o interpretador Bash.  
Assim, quando você roda `./ubuntu-lts-upgrade.sh`, o sistema entende que deve usar o Bash para interpretar o conteúdo do arquivo.

---

## 📦 Após a atualização

Depois de finalizar o processo e reiniciar o sistema, execute o comando abaixo para confirmar a nova versão instalada:

```bash
lsb_release -a
```

---

## ❤️ Contribuindo

Este projeto tem como objetivo ajudar iniciantes.  
Se você tem sugestões, correções ou melhorias, **contribua com um Pull Request ou abra uma Issue!**

---

## 📜 Licença

Este projeto está sob a **licença MIT**.  
Sinta-se livre para **usar, modificar e compartilhar** com o mundo!

---

## ✨ Créditos

Criado com dedicação por **Rarysson**, com melhorias feitas por **ChatGPT**, para ajudar outros a começarem sua jornada com **Linux e Ubuntu** da melhor forma possível.
