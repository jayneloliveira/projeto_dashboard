# 🍓 Celeste Dashboard

Um dashboard pessoal inspirado na estética pixel art do jogo Celeste. Projetado para organizar o fluxo de trabalho diário em um só lugar, unindo compromissos, caixa de entrada, lista de tarefas, cronômetro de foco e anotações rápidas em uma interface imersiva e responsiva.

## ✨ Funcionalidades

- **Integração Google (OAuth2)**: Conexão segura e persistente para ler e-mails e calendário.
- **Resumo de E-mails**: Monitora a quantidade de e-mails totais e não lidos na caixa de entrada em tempo real.
- **Compromissos da Semana**: Exibição da agenda sincronizada com o Google Calendar.
- **Tarefas Avançadas**: Gerenciamento de tarefas diárias com sistema de prioridades (Alta, Média, Baixa), prazos, descrições detalhadas e suporte a subtarefas.
- **Cronômetro Pomodoro**: Tracker de foco embutido (25m Foco, 5m Pausa Curta, 15m Pausa Longa).
- **Brain Dump**: Área para anotações rápidas, listas e ideias, com salvamento automático no navegador (`localStorage`).
- **Login Inteligente**: Memoriza a sessão localmente e desloga automaticamente em longos períodos de inatividade (1h) ou grandes atualizações.

## 🛠️ Tecnologias Utilizadas

- **HTML5 & CSS3 Vanilla**: Estruturação semântica e customização com CSS Grid/Flexbox sem dependência de bibliotecas ou frameworks externos.
- **JavaScript (Vanilla)**: Lógica de frontend (gestão de estados e cronômetros via DOM e `localStorage`).
- **Google Identity Services (GSI)**: Autenticação via Google para a permissão segura dos escopos.
- **Google APIs**: Integração com a `Gmail API` e a `Calendar API`.
- **Google Fonts**: Utilização de fontes modernas (`Inter`, `Outfit`) combinadas com o charme retrô (`Press Start 2P`).

## 🚀 Como rodar localmente

Por conta de integrações com APIs e das políticas de segurança modernas dos navegadores (CORS/Módulos), o dashboard exige a execução a partir de um servidor local.

1. Clone o repositório em sua máquina.
2. Abra o terminal (PowerShell) na pasta do projeto.
3. Inicie o servidor embutido executando o script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\start_server.ps1
   ```
4. O servidor iniciará na porta `8000`. 
5. Abra o navegador e acesse: [http://localhost:8000](http://localhost:8000).

*(Alternativamente, você pode usar `python -m http.server 8000` ou extensões como "Live Server" do VSCode).*

## 🎨 Como customizar

Toda a personalização visual pode ser feita diretamente no cabeçalho do arquivo `index.html`. 

- **Cores e Identidade**: No topo do `<style>`, altere as variáveis `:root` (como `--bg-dark`, `--pink-main` e `--teal-main`) para aplicar novos temas globalmente.
- **API do Google**: Se for hospedar em um domínio próprio ou modificar escopos agressivamente, gere seu próprio Client ID no Google Cloud Console e o atualize na constante `CLIENT_ID` dentro do script JS.
- **Background Animado**: A animação de "neve/partículas" pode ser alterada mexendo na classe `.particles` ou nas chaves de animação `@keyframes snow`.
