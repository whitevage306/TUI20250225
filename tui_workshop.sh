# 1. 問候使用者
dialog --title "我的每一天" --msgbox "今天的你一切都好嗎? 讓我們一起記錄今天的心情。" 10 50


# 2. 驗證通關密語（必須與系統密碼相同）
ERROR_COUNT=0
while true; do
    dialog --title "噓，這是秘密基地，請輸入通關密語" --passwordbox "你的通關密語:" 10 50 2> password.txt

    PASSWORD=$(cat password.txt)

    # 嘗試使用密碼驗證
    echo "$PASSWORD" | sudo -S true 2>/dev/null
    if [ $? -eq 0 ]; then
        break  # 密碼正確，跳出迴圈
    else
        # 密碼錯誤
        ERROR_COUNT=$((ERROR_COUNT + 1))
        if [ $ERROR_COUNT -eq 2 ]; then
            dialog --title "密碼錯誤" --msgbox "你已經錯誤兩次，將跳出日記編輯。" 10 50
            exit 1  # 錯誤兩次，退出程式
        else
            dialog --title "密碼錯誤" --msgbox "密碼不正確，請再試一次！" 10 50
        fi
    fi
done

# 3. 選擇心情
dialog --title "選單模式" --menu "今天的我" 15 50 6 \
1 "開心" \
2 "難過" \
3 "生氣" \
4 "平靜" \
5 "喜悅" \
6 "傷心" 2> mood_number.txt

# 讀取選擇的心情數字
MOOD_NUM=$(cat mood_number.txt)

# 轉換數字為心情國字
case "$MOOD_NUM" in
    1) MOOD_TEXT="開心" ;;
    2) MOOD_TEXT="難過" ;;
    3) MOOD_TEXT="生氣" ;;
    4) MOOD_TEXT="平靜" ;;
    5) MOOD_TEXT="喜悅" ;;
    6) MOOD_TEXT="傷心" ;;
esac

# 4. 選擇日期
dialog --calendar "今天的日期是?(方向鍵可以選擇日期)" 10 50 25 2 2025 2> date.txt
DATE_SELECTED=$(cat date.txt)

# 5. 填寫日記
dialog --title "隨筆日記" --form "方向鍵操作，第一行輸入完按下可跳第二行，都輸入完按 Enter" 20 50 2 \
"感恩小記:" 1 1 "" 1 15 20 0 \
"點點滴滴:" 2 1 "" 2 15 20 0 2> diary.txt

# 6. 儲存到 mood.txt
echo -e "【今天的記錄】\n" > mood.txt
echo -e "日期: $DATE_SELECTED\n" >> mood.txt
echo -e "心情: $MOOD_NUM $MOOD_TEXT\n" >> mood.txt
echo -e "隨筆:\n" >> mood.txt
cat diary.txt >> mood.txt
echo -e "\n========================\n" >> mood.txt

# 7. 顯示結束訊息
dialog --title "早安午安晚安" --msgbox "謝謝今天的我，謝謝今天的你。" 10 50

# 8. 顯示 mood.txt 內容
clear
cat mood.txt

# 9. 清理暫存檔案
rm -f mood_number.txt date.txt diary.txt password.txt
