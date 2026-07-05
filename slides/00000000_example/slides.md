---
theme: default
title: Example Slide
transition: slide-left
favicon: https://serenity.keito.dev/🧶/ico?square
seoMeta:
  ogTitle: Example Slide
  ogDescription: 検証用のサンプルスライド
  ogUrl: https://slides.keito.dev/00000000_example/
  ogImage: auto
  twitterCard: summary_large_image
---

# (Example) mst-mkt/slides

Slidev で作成されたスライドのリポジトリ \
このスライドはこのリポジトリの参考用のサンプルです

<!--
スピーカーノート。presenter モードで見える。
-->

---

## 構成

```
slides/
  <date>_<slug>/
    slides.md         # スライド本体
    vite.config.ts    # タスク (dev / build / export)
    package.json      # 依存
```

- スライドごとにパッケージを作成
- vite-task でタスクを管理 (dev, build, ...)

---

## コマンド

- `vpr new` 新しいスライドを作成
- `vpr dev` dev サーバーを起動
- `vpr build` 全スライドをビルド
- `vpr export` PDF に出力
- `vpr preview` ビルドをローカルで確認
- `vpr deploy` Cloudflare にデプロイ

---

```yaml
layout: center
```

https://github.com/mst-mkt/slides
