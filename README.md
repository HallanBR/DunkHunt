# Duck Hunt

Clone inspirado no clássico **Duck Hunt**, feito no **Godot Engine**. O jogador usa a mira para abater patos que sobem pela tela; o cão reage conforme o desfecho do turno (capturas ou fugas).

## Requisitos

- [Godot Engine 3.x](https://godotengine.org/download/archive/) (projeto com `config_version=4`)

## Como executar

1. Abra o Godot e use **Importar** (ou **Scan**) e selecione a pasta do projeto (`project.godot`).
2. Pressione **F5** ou o botão **Play** para iniciar pela cena principal `Main.tscn`.

## Controles

| Ação | Entrada |
|------|---------|
| Atirar | Botão esquerdo do rato (ação `atirar`) |

A mira segue o cursor; dispare quando estiver sobre um pato.

## Regras (resumo)

- **Turnos**: em cada rodada nascem vários patos.
- **Pontuação**: patos abatidos aumentam o contador no HUD.
- **Topo da tela**: patos vivos que escapam contam como *flyaway* e podem zerar a sequência de pontos conforme a lógica do jogo.
- **Chão**: patos mortos podem colidir com a área do chão e tocar o som de impacto.

## Estrutura principal

| Caminho | Descrição |
|---------|-----------|
| `Main.tscn` / `Main.gd` | Cena principal, turnos, HUD e áreas de topo/chão |
| `pato.tscn` / `pato.gd` | Comportamento dos patos |
| `Alvo.tscn` / `Alvo.gd` | Mira e detecção de tiro |
| `Material Duck Hunt/` | Sprites, sons e fontes |

## Licença

O código e os assets incluídos neste repositório seguem a licença definida pelo autor do projeto (ajuste esta secção se aplicar uma licença específica, por exemplo MIT ou CC-BY).

---

*Projeto Duck Hunt — Godot.*
