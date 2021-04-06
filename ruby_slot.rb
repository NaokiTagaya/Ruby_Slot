begin
  # 当たり時の計算クラス
  class Calc
    # 揃った列に応じて獲得するコインやポイントが変動する
    def align_number(current_coin, current_point, insert_coin, align_row)
      case align_row
       # 1列揃った場合（獲得コイン：賭けたコイン数x2, 獲得ポイント：賭けたコイン数x10）
       when 1 then
         get_coin = Selectcoins[insert_coin] *2
         get_point = Selectcoins[insert_coin] *10
         puts "#{get_coin}コイン獲得！"
         puts "#{get_point}ポイント獲得！"
         # 獲得したコインとポイントを加える
         current_coin = get_coin + current_coin
         current_point = get_point + current_point         
         return current_coin, current_point
      # 2列揃った場合（獲得コイン：賭けたコイン数x4, 獲得ポイント：賭けたコイン数x20）
       when 2 then
         get_coin = Selectcoins[insert_coin] *4
         get_point = Selectcoins[insert_coin] *20
         puts "#{get_coin}コイン獲得！"
         puts "#{get_point}ポイント獲得！"
         # 獲得したコインとポイントを加える
         current_coin = get_coin + current_coin
         current_point = get_point + current_point         
         return current_coin, current_point
      # 3列揃った場合（獲得コイン：賭けたコイン数x6, 獲得ポイント：賭けたコイン数x30）
       when 3 then
         get_coin = Selectcoins[insert_coin] *6
         get_point = Selectcoins[insert_coin] *30
         puts "#{get_coin}コイン獲得！"
         puts "#{get_point}ポイント獲得！"
         # 獲得したコインとポイントを加える
         current_coin = get_coin + current_coin
         current_point = get_point + current_point         
         return current_coin, current_point
      end
    end
  end
  
   # 初期値
   coins = 100
   points = 0
   money_flg = true
   Selectcoins = [0, 10, 30, 50]
   calc = Calc.new()
  
  # money_flgがfalseになるまで、もしくはbreakするまで遊び続けることができる
  while money_flg do
   # スロットの値を定義（randで値を出力）
   slotnum1 = rand(9)
   slotnum2 = rand(9)
   slotnum3 = rand(9)
   slotnum4 = rand(9)
   slotnum5 = rand(9)
   slotnum6 = rand(9)
   slotnum7 = rand(9)
   slotnum8 = rand(9)
   slotnum9 = rand(9)
   # 1~4の値を入力する
   puts "----------"
   puts "残りコイン数#{coins}"
   puts "ポイント#{points}"
   puts "何コイン入れますか？"
   puts "1（10コイン） 2（30コイン） 3（50コイン） 4（やめとく）"
   puts "----------"
   insert_coin = gets.to_i
     # 1~3いずれかの値が入力された場合、処理を進める
     if insert_coin == 1 || insert_coin == 2 || insert_coin == 3 then
       # 手持ちのコインが足りるかどうか確認する  
       if coins >= Selectcoins[insert_coin] then
         # エンター3回押してスロットを止める
         puts "エンターを3回押しましょう！"
         puts = gets
         puts "----------"
         puts "|#{slotnum1}|||"
         puts "|#{slotnum2}|||"
         puts "|#{slotnum3}|||"
         puts = gets
         puts "|#{slotnum1}|#{slotnum4}||"
         puts "|#{slotnum2}|#{slotnum5}||"
         puts "|#{slotnum3}|#{slotnum6}||"
         puts = gets
         puts "|#{slotnum1}|#{slotnum4}|#{slotnum7}|"
         puts "|#{slotnum2}|#{slotnum5}|#{slotnum8}|"
         puts "|#{slotnum3}|#{slotnum6}|#{slotnum9}|"
         # 数字が真ん中斜め、3列揃った場合
         if ((slotnum2 == slotnum5) && (slotnum2 == slotnum8)) && ((slotnum1 == slotnum5) && (slotnum1 == slotnum9)) && ((slotnum3 == slotnum5) && (slotnum3 == slotnum7))
           puts "数字が3列揃いました！大当たり！"
           align_row = 3
           coins = coins - Selectcoins[insert_coin]
           coins, points = calc.align_number(coins, points, insert_coin, align_row)
         # 数字が2列揃った場合
         elsif ((slotnum2 == slotnum5) && (slotnum2 == slotnum8)) && ((slotnum1 == slotnum5) && (slotnum1 == slotnum9)) || # 真ん中と右斜め下
               ((slotnum2 == slotnum5) && (slotnum2 == slotnum8)) && ((slotnum3 == slotnum5) && (slotnum3 == slotnum7)) || # 真ん中と右斜め上
               ((slotnum1 == slotnum5) && (slotnum1 == slotnum9)) && ((slotnum3 == slotnum5) && (slotnum3 == slotnum7))    # 右斜め下と右斜め上
           puts "数字が2列揃いました！当たり！"
           align_row = 2
           coins = coins - Selectcoins[insert_coin]
           coins, points = calc.align_number(coins, points, insert_coin, align_row)
         # 数字が真ん中に揃った場合
         elsif (slotnum2 == slotnum5) && (slotnum2 == slotnum8)
           puts "真ん中に#{slotnum5}が揃いました！当たり！"
           align_row = 1
           coins = coins - Selectcoins[insert_coin]
           coins, points = calc.align_number(coins, points, insert_coin, align_row)
         # 数字が斜めに揃った場合
         elsif ((slotnum1 == slotnum5) && (slotnum1 == slotnum9)) || ((slotnum3 == slotnum5) && (slotnum3 == slotnum7)) 
           puts "斜めに#{slotnum5}が揃いました！当たり！"
           align_row = 1
           coins = coins - Selectcoins[insert_coin]
           coins, points = calc.align_number(coins, points, insert_coin, align_row)          
         # 数字が揃わなかったらはずれ
         else
           puts "残念！もう1回挑戦しましょう！"
           coins = coins - Selectcoins[insert_coin]
           # 残りのコインが0以下の時、money_flgをfalseにして終了する
           if coins <= 0 then
             puts "あなた：あ、もうコインが無い・・・(´Д`;)"
             puts "あなた：今日はこれでおしまいだな・・・(´・ω・｀)"
             puts "----------"
             puts "〜今回の成績〜"
             puts "残りコイン数：#{coins}"
             puts "ポイント：#{points}"
             money_flg = false
           end
         end
       # 手持ちのコイン以上に賭けようとしたら注意文を表示する
       else
         puts "コインが足りません！"
       end
     # 4が入力された場合、breakにして終了する
     elsif insert_coin == 4 then
       puts "あなた：今日はこの辺にしておくか・・・（　´_ゝ｀）"
       puts "店員：ありがとうございましたー( ´∀｀ )"
       puts "----------"
       puts "〜今回の成績〜"
       puts "残りコイン数：#{coins}"
       puts "ポイント：#{points}"
       break
     # 1~4以外の値が入力された場合、注意文を表示する
     else
       puts "1~4の値を入力してください。"
    end
  end
rescue
   puts $! # 例外オブジェクトを出力する
   puts $@ # 例外が発生した位置情報を出力する
   puts "例外エラーが発生しました。係員をお呼びください。"
end