# golf-it-bot

> Golf-itライフをより豊かにするためのdiscord bot.  :golf:

## Installation

### 1. botの準備
```bash
git clone https://github.com/tenmihi/golf-it-bot

export DISCORD_GOLF_IT_TOKEN='TOKEN'
export DISCORD_GOLF_IT_CLIENT_ID='CLIENT_ID'
```

環境変数の`DISCORD_GOLF_IT_TOKEN`にDiscord botのトークンを，同じく`DISCORD_GOLF_IT_CLIENT_ID`にクライアントIDを指定しておきます．

### 3. 起動

```bash
./script/run.sh
```
デーモンとしてbotが起動するので，止めたい時はpkill等で止めてください．．

## Commands

すべてPrefixとして`golf `を付けて発言する必要があります．

### ping
botに対してpingを送ります．動作確認用です．

### map
Steam workshopからカスタムマップをランダムに1件取得してきます．  
記憶していないので，取ってきたことのあるマップでも再度取ってくる可能性があります．

### news
Golf-itに関する最新のニュースを1件取得してきます．

## Author

tenmihi

## License

MIT
