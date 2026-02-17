# Mathmancer

Meu primeiro jogo feito com a engine [PudimBasicsGL](https://github.com/pudimbasicsgl).

## Requisitos

- Lua 5.4
- LuaRocks
- OpenGL 4.6

## Como rodar

```bash
./run.sh
```

O script instala as dependências via LuaRocks e inicia o jogo automaticamente.

## Estrutura

```
init.lua              -- ponto de entrada do jogo
src/
  assets_scripts/     -- scripts de gameplay (player, câmera, cores, etc.)
  sprites/            -- sprites e animações
```

## Licença

MIT