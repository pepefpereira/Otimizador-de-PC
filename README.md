# Otimizador de PC – PEPE Tech & Play (v2)

Script simples para Windows que **libera espaço** limpando arquivos temporários e **ativa um plano de energia de alto desempenho**. Feito por [@pepetechplay](https://www.tiktok.com/@pepetechplay).

> **Sem milagre de FPS.** O script libera espaço e pode deixar o PC mais fluido, mas não aumenta FPS por mágica. Em **notebook**, o plano de máximo desempenho gasta mais bateria e esquenta mais.

---

## O que o script faz

1. **Plano de energia:** cria e ativa o plano *Desempenho Máximo*. Se o seu Windows não tiver esse plano, ativa o *Alto desempenho*.
2. **Limpeza de temporários:** apaga o conteúdo de `%TEMP%` (pasta Temp do seu usuário) e de `C:\Windows\Temp`. Arquivos em uso são ignorados.
3. **Cache de shaders do DirectX:** apaga `%LOCALAPPDATA%\D3DSCache`. O Windows recria sozinho; na primeira abertura de cada jogo pode haver um leve engasgo.
4. **Resultado:** mostra quantos MB foram liberados no disco C:.

## O que o script NÃO faz

- Não instala nada e não baixa nada da internet.
- Não altera o registro do Windows.
- Não mexe em seus documentos, fotos ou jogos.
- Não apaga a pasta Prefetch (apagar não ajuda e só deixa as primeiras aberturas mais lentas).

## Como usar

1. Baixe o arquivo `Otimizar_PC_PEPE_Tech_v2.bat`.
2. **Leia o código antes de rodar.** Clique com o botão direito, *Editar* (ou abra no Bloco de Notas). Nunca rode um script da internet sem conferir.
3. Clique com o botão direito no arquivo e escolha **Executar como administrador**.
4. Se o Windows exibir o aviso do SmartScreen ("O Windows protegeu seu computador"), é normal para qualquer `.bat` baixado. Clique em *Mais informações* e depois em *Executar assim mesmo*, **somente** se você conferiu o código e o link veio do perfil oficial.
5. Ao final, **reinicie o PC**.

## Conferir se o arquivo é o original

Código SHA-256 da versão v2:

```
d81da51387c0979b61c3a385599b258423f8122c243270d75eac479d193e2567
```

Para conferir no Windows, abra o Prompt de Comando na pasta do arquivo e rode:

```
certutil -hashfile Otimizar_PC_PEPE_Tech_v2.bat SHA256
```

Se o resultado for diferente do código acima, **não execute** o arquivo e baixe de novo pelo link oficial.

## Como desfazer

- **Voltar o plano de energia para Equilibrado:**
  ```
  powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
  ```
- **Remover o plano criado pelo script:**
  ```
  powercfg -delete 99999999-9999-9999-9999-999999999999
  ```
- Os arquivos temporários apagados não precisam ser restaurados: são recriados pelo Windows e pelos programas quando necessário.

## Perguntas rápidas

**Preciso ser administrador?** Sim. Sem isso, a limpeza de `C:\Windows\Temp` fica parcial, então o script avisa e fecha.

**Funciona em qualquer Windows?** Foi pensado para Windows 10 e 11. O plano *Desempenho Máximo* pode não existir em algumas edições, e por isso há o plano de reserva.

**É seguro?** O código é curto e legível. Leia antes de rodar. Se não entender algum comando, não execute e pergunte.

## Contato

Dúvidas e sugestões: comente nos vídeos ou chame nas lives (terça, quinta, sábado e domingo, à noite, a partir das 21h, com horário variável).

---

*Uso por sua conta e risco. Faça backup dos arquivos importantes antes de qualquer manutenção no PC.*
