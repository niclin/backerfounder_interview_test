
## Setup

- 技術棧 Rails 5.2 + PostgreSQL
- 有用到 sidekiq 所以要安装 redis `brew install redis`

1. `git clone git@github.com:niclin/backerfounder_interview_test.git`
2. `rake db:create db:migrate`
3. `rails server` 啟動後查看 `localhost:3000`
4. 建立初始 100 筆資料 `rake db:seed`
5. 執行 sidekiq 確保每分鐘會更新留言和文章的權重分數

# mini Hacker News Clone

複製一個 mini 的 Hacker News，製作簡易可用的推文系統 prototype：

https://news.ycombinator.com/

## 繳交期限

2018/11/05（ㄧ）17:00 前

## 技術實踐需求

- Rails + PostgreSQL
- Vanilla JS or jQuery or Vue.js（可以不用 JS）

## 主要需要實踐的功能概述

**對於任何訪客，進入到首頁：**

- 可以註冊帳號
- 可以登入帳號
- 可以看到所有貼文的
  - 標題
  - 權重分數
  - 作者
  - 留言數
- 可以點擊貼文觀看每則貼文的留言內容

**對於已經註冊的訪客：**

- 可以對其他人貼文投票 upvote
  - 未登入者點擊投票按鈕，導向去登入介面
  - 不可 downvote
  - 已點過 upvote 者再點一次即撤銷先前的投票
- 可以發表貼文
- 可以在貼文下留言
- 可以針對其他人的留言做留言（巢狀結構，最多 8 層，介面上請為巢狀結構稍作縮排示意）

**貼文排序：**

- 每一則貼文依照權重分數降冪排序，權重分數計算公式可參考下個段落
- 每分鐘更新一次權重分數（為求可以從介面上測試，故時間條件設定為每分鐘）
- 貼文需要分頁，一頁最多 10 篇內容

**貼文的留言排序：**

- 留言排序規則與貼文相同
- 每一層巢狀留言也都需要套用相同排序規則

## 權重分數計算公式

```
權重分數 = (P-1) / (T+2)^G

P = 每篇文章的基礎分數
T = 時間間距，單位為小時
G = 重力係數，文章分數下降的速度

```

## 其他說明事項

- 建議先註冊 Hacker News 帳號玩過一輪以瞭解該系統功能
- 介面排版不要求，基本 CSS 可清晰分辨區塊範圍即可，主要以實踐功能為目的
- 請撰寫腳本可自動填充初始 seed 資料，貼文至少先產生 100 篇，並將呼叫填充資料的方式，註明於 README 上


## 完成後

- 撰寫本機搭建環境的 README
- 請 push 到 GitHub public repo，提供 repo 連結
- 我們會在一週內回覆結果喔
