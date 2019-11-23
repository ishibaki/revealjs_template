# reveal.js Template

Starting to write: YYYY-MM-DD

## Requirements

- [pandoc](https://github.com/jgm/pandoc)
- [reveal.js](https://github.com/hakimel/reveal.js)
- Optional
  - [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template)
  - [pandoc-docx-pagebreak](https://pypi.org/project/pandoc-docx-pagebreak/)
  - [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref)

**Clone this repo in the directory including reveal.js repo.**

```
│
├─ revealjs_template/
│  ├─ manuscript/
│  ├─ figs/
│  ├─ out/
│  │  └─ reveal.js/ @ ──┐
│  └─ Makefile          │
│                       │
└─ reveal.js/ <─────────┘
```

## How to use

```sh
chmod +x ./init.sh && ./init.sh
```

And start to write your manuscript in `./manuscript/1_main.md`

## Automatic generation

### reveal.js slide

```sh
make
```

### Open slide

```sh
make open
```

### Optional

```sh
make out.pptx
make out.pdf
make out.docx
make out.html
```

<!-- vim: set foldmethod=marker : -->
