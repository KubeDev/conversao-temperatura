## Como Executar (Usando o Script de Automação no WSL)

Este projeto inclui um script chamado `iniciar_app_direto_wsl.sh` que automatiza todo o processo de configuração do ambiente e execução da aplicação diretamente no seu WSL.

1.  **Clone este repositório:**
    Abra seu terminal WSL, navegue até o diretório onde deseja clonar o projeto e execute:
    ```bash
    git clone https://github.com/diegoasf/conversao-temperatura.git
    ```

2.  **Navegue até o diretório do projeto:**
    ```bash
    cd conversao-temperatura
    ```

3.  **Dê permissão de execução ao script:**
    Este passo só é necessário uma vez.
    ```bash
    chmod +x iniciar_app_direto_wsl.sh
    ```

4.  **Execute o script:**
    ```bash
    ./iniciar_app_direto_wsl.sh
    ```
    O script irá:
    * Verificar e instalar o Git (se necessário).
    * Verificar e instalar o Node.js na versão especificada no script (atualmente configurado para Node.js 20.x) usando o NodeSource.
    * Instalar as dependências do projeto (`npm install`).
    * **Iniciar a aplicação (`node server.js`) em segundo plano.** O terminal ficará livre após a execução do script.
    * Informar o PID (Process ID) da aplicação iniciada.

5.  **Acesse a aplicação:**
    Após o script iniciar a aplicação com sucesso, abra seu navegador e acesse:
    `http://localhost:8080`

6.  **Para parar a aplicação:**
     Quando a aplicação é iniciada pelo script em segundo plano, ele informa o **PID (Process ID)** do processo Node.js. Para parar a aplicação, você usará esse PID com o comando `kill`.

     Exemplo: Se o script informou `PID: 12345`
     ```bash
    kill 12345
