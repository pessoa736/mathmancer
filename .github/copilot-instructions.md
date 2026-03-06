# Copilot Instructions — mathmancer

## Obrigatório antes de qualquer tarefa

Antes de gerar ou modificar qualquer código neste projeto, **sempre leia** o guia da biblioteca PudimBasicsGl:

- **Caminho:** `lua_modules/lib/luarocks/rocks-5.4/pudimbasicsgl/*/docs/forAgents/agent-guide.md`

Esse arquivo contém a API completa, padrões corretos de uso, e erros comuns a evitar.

## Contexto do Projeto

- **Linguagem:** Lua 5.4
- **Biblioteca gráfica:** PudimBasicsGl (instalada via luarocks local)
- **Ponto de entrada:** `init.lua`
- **Scripts do jogo:** `src/assets_scripts/`
- **Recursos (sprites, fontes):** `src/sprites/`, `src/fonts/`
- **Gerenciamento de dependências:** luarocks local (`./luarocks`)

## Regras importantes

1. `pb.renderer.clear()` deve ser chamado **antes** de `pb.renderer.begin()`.
2. Recursos (texturas, fontes, sons) só podem ser carregados **após** `pb.window.create()`.
3. Usar sintaxe de dois-pontos (`:`) para métodos de objetos (`tex:draw()`, `font:draw()`).
4. O loop principal é escrito pelo usuário — a lib **não** tem callbacks como LÖVE.
5. Auto-flush entre batches (primitivos, texturas, texto) é automático — não precisa chamar `flush()` manualmente.
6. Vetores da lib usam campos nomeados (`v.x`, `v.y`), não índices (`v[1]`, `v[2]`).
