---
theme: default
title: Example Slide
info: 検証用のサンプルスライド
class: text-center
transition: slide-left
mdc: true
favicon: https://serenity.keito.dev/🧶/ico?square
seoMeta:
  ogTitle: Example Slide
  ogUrl: https://slides.keito.dev/00000000_example/
  ogImage: auto
  twitterCard: summary_large_image
---

# Example Slide

動作確認用のサンプル

<div class="pt-8 opacity-70">
  <code>slides/00000000_example</code>
</div>

<!--
これはスピーカーノート
dev サーバーの presenter モードで確認できる
-->

---

## このリポジトリの構成

- `slides/${yyyymmdd}_${slug}/` に発表ごとのスライドを置く
- `vpr new <slug> [yyyymmdd]` で新しいスライドを生成

---

```yaml
layout: two-cols
```

# コードハイライト

```ts {1|2-3|all}
const tool = 'slidev'
const talks = ['2026-07-05', '2026-09-01']
export default talks
```

::right::

# 動作チェック項目

- [x] dev サーバーが立つ
- [x] コードのクリックアニメーション
- [x] `build` で静的出力できる

---

```yaml
layout: center
class: text-center
```

# 準備完了 🎉

`pnpm --filter 00000000_example dev`
