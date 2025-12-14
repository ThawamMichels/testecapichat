# Capi Chat - Deploy no EasyPanel

## Pré-requisitos
- EasyPanel instalado na VPS
- Repositório Git (GitHub, GitLab, etc.)

## Passo a Passo para Deploy

### 1. Subir o código para um repositório Git

```bash
git init
git add .
git commit -m "Initial commit with Docker config"
git remote add origin https://github.com/seu-usuario/capi-chat.git
git push -u origin main
```

### 2. No EasyPanel

1. Acesse seu painel do EasyPanel
2. Clique em **"+ Serviço"** ou **"Aplicativo"**
3. Selecione **"GitHub"** (ou GitLab/Bitbucket)
4. Conecte sua conta e selecione o repositório
5. O EasyPanel vai detectar automaticamente o Dockerfile
6. Clique em **"Deploy"**

### 3. Configurar Domínio

1. Após o deploy, vá nas configurações do serviço
2. Na aba **"Domains"**, adicione seu domínio
3. O EasyPanel configura SSL automaticamente

### 4. Variáveis de Ambiente (se necessário)

Se precisar configurar variáveis de ambiente:
1. Vá em **"Environment"** nas configurações do serviço
2. Adicione as variáveis necessárias

## Estrutura dos Arquivos de Deploy

- `Dockerfile` - Configuração do container (build + nginx)
- `nginx.conf` - Configuração do servidor web para SPA
- `.dockerignore` - Arquivos ignorados no build

## Portas

- O container expõe a porta **80**
- O EasyPanel faz o proxy automaticamente para HTTPS

## Troubleshooting

### Build falhou
- Verifique os logs no EasyPanel
- Certifique-se que o `package.json` está correto

### Rotas não funcionam (404)
- O `nginx.conf` já está configurado para SPA routing
- Todas as rotas são redirecionadas para `index.html`

### Problemas de cache
- Faça rebuild: Settings > Rebuild
