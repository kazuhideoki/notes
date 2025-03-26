# Gen AIプレゼンテーション動画作成

## Links

- [[2025-03-25]]
- [[gen_ai]]

## 概要

生成AI社内コンペの発表用スライド動画を作成するためのノート

スライド https://yourstand-ev.slack.com/archives/C07E024TUGN/p1742884649807629?thread_ts=1742530686.355999&cid=C07E024TUGN

## スピーカーノート

```
## AI活用でCSログ調査をサクッと効率化！

お客様からの問い合わせ対応、毎日頑張ってますよね。ただ、ログ調査って本当に時間がかかりますよね…。そこで登場するのが、今回の主役「生成AI」です！

## ユーザーからの問い合わせ分析 (ChatGPT)

ChatGPTに問い合わせ分析をお願いしてみたら、圧倒的に目立ったのが「充電トラブル」。充電が始まらない、途中で止まるなど、せっかくの便利なサービスがうまく使えず困っているユーザーがたくさんいました。他にも料金トラブルや操作方法、施設の使い勝手など幅広い課題が浮き彫りに。
そこで私たちは、この厄介な充電トラブルをスッキリ解決する方法を探すことにしました！

## 背景と課題

CS部門の皆さん、ログ調査をエンジニアにお願いすると、待つこと数日…。待ちぼうけしている間にお客様のイライラが溜まってしまいます。さらにエンジニアも本来の開発が進まず、負担が増えるという「みんな辛い」状況でした。

## AI活用による解決策

そこで私たちの救世主、ChatGPTの登場です！CSメンバーが自らログ解析をすることで、エンジニアの手間を一気に削減。「もうエンジニアを呼ばなくていい！」なんて声が聞こえそうですが、もちろん仲良く協力し合ってます。

## プロセス比較

これまではCSがエンジニアの調査結果を首を長くして待っていましたが、AIを導入してからは、待ち時間ほぼゼロ！「AIのおかげで暇になっちゃうかも？」なんて冗談も出るほどスピーディーになりました。

## 期待される効果

AIの導入で、お客様対応が格段に速くなり、満足度もアップ間違いなし！さらにエンジニアも本業に集中できてハッピーです。CSメンバーも技術力アップで一石二鳥、いや三鳥くらい得しています。

## 今後の展望

これからChatGPTがもっと賢くなって、ログ解析精度もぐんぐん上がります。他にもFAQ対応やナレッジ活用までAIが活躍する予定です。会社中がAI好きになっちゃうくらい、楽しく便利なAI文化を作っていきましょう！

## まとめ

というわけで、ChatGPTでログ調査がラクになり、お客様もエンジニアも笑顔に。「もうAI無しでは生きられない！」なんて言い出す人が出てきてもおかしくないですね。これからもAIと楽しく便利な未来をつくっていきましょう！

※ちなみに、このスライドの文章や画像、スピーチ内容から音声まで、すべてChatGPTが作成しています。ちょっと盛りすぎちゃってるかもしれませんが、そこはご愛嬌ということで
```

## スクリプト(未検証)

```python
import os
import subprocess
from moviepy.editor import ImageClip, AudioFileClip, concatenate_videoclips

def convert_pptx_to_images(pptx_path, output_dir):
    """
    LibreOffice を使って pptx を PNG 画像に変換する関数。
    LibreOffice がインストールされていることが必要です。
    """
    cmd = [
        "soffice", "--headless", "--convert-to", "png",
        pptx_path, "--outdir", output_dir
    ]
    subprocess.run(cmd, check=True)
    print(f"変換完了: {pptx_path} -> {output_dir}")

def create_video_from_slides_and_audio(slides_dir, audio_dir, output_video_path):
    """
    画像ディレクトリと音声ディレクトリから、各スライドと対応する音声で動画を作成する関数。
    """
    # スライド画像のファイル名をソートして取得（例: Slide1.png, Slide2.png, ...）
    slide_images = sorted([
        os.path.join(slides_dir, f)
        for f in os.listdir(slides_dir) if f.lower().endswith(".png")
    ])
    
    clips = []
    for idx, slide_image in enumerate(slide_images, start=1):
        # 各スライドに対応する音声ファイル (例: slide1.mp3)
        audio_file = os.path.join(audio_dir, f"slide{idx}.mp3")
        if not os.path.exists(audio_file):
            print(f"警告: {audio_file} が見つかりません。スライド {idx} はスキップします。")
            continue
        # 音声ファイルを読み込み
        audio_clip = AudioFileClip(audio_file)
        duration = audio_clip.duration
        
        # 画像クリップを作成し、音声をセット。画像の表示時間は音声の長さに合わせる
        img_clip = ImageClip(slide_image).set_duration(duration)
        img_clip = img_clip.set_audio(audio_clip)
        clips.append(img_clip)
        print(f"スライド {idx} のクリップを作成しました。")
    
    if not clips:
        print("動画に追加するクリップがありません。")
        return
    
    # 全てのクリップを連結して最終的な動画を作成
    final_clip = concatenate_videoclips(clips, method="compose")
    final_clip.write_videofile(output_video_path, fps=1)
    print(f"動画の作成が完了しました: {output_video_path}")

def main():
    # 入力ファイルと出力ディレクトリのパスを設定
    pptx_path = "presentation.pptx"  # 入力するpptxファイル
    output_dir = "slides"            # pptxから出力されるスライド画像のディレクトリ
    audio_dir = "audios"             # 音声ファイルが入っているディレクトリ
    output_video_path = "output_video.mp4"  # 出力する動画ファイルの名前
    
    # 出力ディレクトリが存在しない場合は作成
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # pptx を画像に変換
    convert_pptx_to_images(pptx_path, output_dir)
    
    # 画像と音声を組み合わせて動画を作成
    create_video_from_slides_and_audio(output_dir, audio_dir, output_video_path)

if __name__ == "__main__":
    main()
```
