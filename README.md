# .config/fish

fish shellの設定

## install

```bash
cd ~/.config
git clone https://github.com/atu4403/fish_conf fish
cd fish
mv backup/fish_variables_2021-12 fish_variables
```

## fish_variablesについて

`fish_variables`は変数の状態を保存するファイルであり、頻繁に更新が行われる。
例えばプロンプトプラグインの`hydro`ではgitの状態管理に変数をしているのでgit操作のたびに`fish_variables`も書き換わる。

これはバージョン管理に適さないので、月に一度バックアップを取ってそれを管理する。

`fish create_backup.fish`により`backup`ディレクトリに作成される。このスクリプトを`.git/hooks/post-commit`に書くことによってコミットの度に動作する。(ただしこのスクリプトが実際にbackupを作成するのは月に一度だけ)
