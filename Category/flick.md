---
title: "圏論で表現（フリック入力）"
filters:
  - d2
d2:
  layout: elk
  theme: "NeutralDefault"
---

## アイデア

フリック入力を圏で表す。対象を文字、射を文字から文字への変換とする。
恒等射はその文字の入力そのもの。射の結合は連続入力を表す

## 定義

```yaml
フリック入力の圏:
  対象:
    値: "文字の集合（例：あ、い、う、え、おなど）"
    説明: "フリック入力の候補となる各文字が対象となる。各対象は入力時の起点となる文字を表す。"
    例:
      - "あ"
      - "い"
      - "う"
  射:
    値: "文字から文字への変換操作"
    説明: "各射は、ある文字から別の文字へ変換するフリック操作を表す。ユーザが行うフリックの方向転換などに対応する。"
    例:
      - "あ → い"
      - "か → き"
  恒等射:
    値: "各対象 x に対する入力操作 idₓ"
    説明: "各文字において、変換を行わずその文字自体を入力する操作を恒等射とする。"
    例:
      - "あの恒等射は『あ』を入力する操作"
  合成:
    値: "射の連続操作の合成（g ∘ f）"
    説明: "連続したフリック入力操作 f と g の合成により、最初の文字から最後の変換結果への連続操作として表す。"
    例:
      - "あ → い と い → う の合成は、あ → う となる"
  モノ射:
    値: null
    説明: "フリック入力の圏において、入力操作が単射としての性質を持つという明確な定義は一般的でない。"
    例: null
  エピ射:
    値: null
    説明: "フリック入力の圏において、入力操作が全射としての性質を持つという明確な定義は一般的でない。"
    例: null
  始対象:
    値: null
    説明: "すべての対象から一意な射が存在する対象（始対象）は、フリック入力の圏では定義されていない。"
    例: null
  終対象:
    値: null
    説明: "すべての対象へ一意な射が存在する対象（終対象）は、フリック入力の圏では定義されていない。"
    例: null
  積:
    値: null
    説明: "二対象のデカルト積のような概念は、フリック入力の圏では明確に定義されない。"
    例: null
  余積:
    値: null
    説明: "二対象の余積のような概念は、フリック入力の圏では明確に定義されない。"
    例: null
```

## 図

```d2
direction: right

ひらがな: {
  あ: {
    label: "あ\nF"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  い: {
    label: "い\nF"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  う: {
    label: "う\nF"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  え: {
    label: "え\nF"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  お: {
    label: "お\nF"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  
  あ -> あ
  あ -> い
  あ -> う
  あ -> え
  あ -> お
}

数字: {
  1: {
    label: "1\nG"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  ☆: {
    label: "☆\nG"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  ♪: {
    label: "♪\nG"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  →: {
    label: "→\nG"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  null: {
    label: "null\nG"
    style: {
      color: "#000000"
      font-color.dark: "#FF0000"
      font-color.light: "#FF0000"
    }
  }
  
  1 -> 1
  1 -> ☆
  1 -> ♪
  1 -> →
  1 -> null
}

ひらがな <-> 数字: {
  style: {
    stroke: "#FF0000"
    stroke-width: 2
    stroke-dash: 5
  }
}
```
