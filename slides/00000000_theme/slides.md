---
theme: mst-mkt
title: Theme Preview
seoMeta:
  ogTitle: Theme Preview
  ogDescription: slidev-theme-mst-mkt の確認用スライド
  ogUrl: https://slides.keito.dev/00000000_theme/
  ogImage: auto
  twitterCard: summary_large_image
---

# slidev-theme-mst-mkt

テーマ確認用のプレビュースライド

---

# タイポグラフィ

_Typography_

段落のテキスト。**強調**、_イタリック_、`inline code`、[リンク](https://slides.keito.dev)。

複数行のテキスト。複数行のテキスト。複数行のテキスト。
複数行のテキスト。複数行のテキスト。複数行のテキスト。
複数行のテキスト。複数行のテキスト。複数行のテキスト。

> 引用ブロックのスタイル確認

---

# 見出しとリスト

_Headings & Lists_

### h3 見出し

#### h4 見出し

- リスト項目 1
- リスト項目 2
  - ネストした項目

1. 番号付きリスト
2. 番号付きリスト

---

# テーブル

_Table_

| フォント            | 用途   | ウェイト      |
| ------------------- | ------ | ------------- |
| Lexend              | 欧文   | 400, 500, 600 |
| Zen Kaku Gothic New | 日本語 | 500, 700      |
| Hack                | コード | 400, 700      |

---

# コード

_Code_

```ts {2}
export function greet(name: string) {
  return `Hello, ${name}!` // ハイライト行
}
```

```css
.slidev-layout {
  background: var(--slidev-theme-background);
}
```

---

```yaml
layout: two-cols
```

## two-cols

左カラムの内容

::right::

## Right

右カラムの内容

---

```yaml
layout: center
```

## center

中央寄せレイアウト

---

```yaml
layout: section
```

# section

セクションの区切り

---

```yaml
layout: quote
```

# "引用のレイアウト"

— 発言者の名前

---

```yaml
layout: fact
```

# 100%

fact レイアウト

---

```yaml
layout: statement
```

# statement レイアウト

---

```yaml
layout: intro
```

# intro

イントロ用レイアウト

---

```yaml
layout: end
```

# End
