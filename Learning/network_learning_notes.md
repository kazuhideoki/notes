# 体験しながら学ぶネットワーク技術入門

## 【問題】キャプチャできない

20250222

- パケットキャプチャ試行したがエラー？だが、ファイルは作成されている。
- しかし、ping したあとに Wireshark で開いても、パケットがキャプチャされていないっぽい？

### 解決策

https://qiita.com/riv_infra/items/945478c49714dee44329

```
tcpdumpコマンドでpcapファイルの吐き出し先を変更し、吐き出した後/tmp/tinetにコピーしました。

root@cl2:/# tcpdump -i net0 -w /tmp/ethernet.pcap ether host 02:42:ac:01:10:01
tcpdump: listening on net0, link-type EN10MB (Ethernet), capture size 262144 bytes
^C4 packets captured
4 packets received by filter
0 packets dropped by kernel
root@cl2:/# cp /tmp/ethernet.pcap /tmp/tinet/

ローカル端末の~/tinetディレクトリは、multipass上のubuntuにあるディレクトリ/tmp/tinet/へマウントされているので、これによりローカル端末でWireSharkを起動し、対象のpcapファイルを選択することでパケット解析ができました。
```

## ARP

![](i/29cc4e07-7e95-48e6-aefd-f3ecf1f33e34.png)

- 問い合わせ: 送信側が、目的のIPのMACアドレスが分からないときに、ネットワーク全体に「誰がこのIPのMAC持ってる？」とブロードキャストで問い合わせる。(画像1行目)
- 応答: 対象のIPを持つホストが、自分のMACアドレスを返答する。(画像2行目)
- 相互確認: この例では、双方のホストが互いにMACアドレスを確認し合って、通信できる状態になっている。(画像3行目)

![](i/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202025-02-27%206.37.06.png)

## L2 スイッチング

cl1 から cl2 に ping
sw1(L2スイッチ)MACアドレステーブルになければ `フラッディング` してネットワーク内全体に確認メッセージを送信する

![](i/51d5db0d-138e-4a92-b5ad-d61c5e8aab4d.png)

L2スイッチの情報

```
root@sw1:/# ovs-appctl fdb/show sw1
 port  VLAN  MAC                Age
    1     0  02:42:ac:01:10:01   90
    2     0  02:42:ac:01:10:02   90
```
